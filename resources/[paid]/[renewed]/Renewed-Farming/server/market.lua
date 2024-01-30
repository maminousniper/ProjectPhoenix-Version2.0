local Config = require 'shared.Market'
local utils = require 'server.utils'

local currentShopAmt = 0
local currentShop = {}

local ox_inventory = exports.ox_inventory
local dummyPrices = Config.prices

local moneySlot = 11

local function hasItem(name)
    for i = 1, #currentShop do
        if currentShop[i].name == name then
            return true, i
        end
    end

    return false
end

local function removeItem(item, count)
    for i = 1, #currentShop do
        if currentShop[i].name == item then
            if currentShop[i].count >= count then
                currentShop[i].count -= count

                return true
            else
                return false
            end
        end
    end

    return false
end


local function addShopItems(items, addItem)
    local changed = false
    local sort = false

    for _, v in pairs(items) do
        if dummyPrices[v.name] and (not addItem or (addItem and ox_inventory:AddItem('Farming_market_main', v.name, v.count))) then

            local success, index = hasItem(v.name)

            if success and index then
                currentShop[index].count += v.count
            else
                currentShopAmt += 1
                sort = true
                currentShop[currentShopAmt] = {
                    name = v.name,
                    count = v.count,
                    price = dummyPrices[v.name] + Config.upsale,
                }
            end

            changed = true
        end
    end


    if changed then
        if sort then
            table.sort(currentShop, function(a, b) return a.name < b.name end)
        end

        ox_inventory:RegisterShop('Renewed_Farming_Market', {
            name = locale('farmers_market'),
            inventory = currentShop,
            locations = {
                Config.ped.coords.xyz,
            }
        })

    end
end

CreateThread(function()
    -- Money Stash noone can access --
    ox_inventory:RegisterStash('Farming_market_main', locale('farmers_market'), 90, 90000000, 'renewed', 'renewed', vec3(0.0, 0.0, 0.0))

    addShopItems(ox_inventory:GetInventoryItems('Farming_market_main'))
end)

RegisterNetEvent('Renewed-Farming:server:createShopStash', function()
    local charId = utils.getCharId(source)

    if charId then
        ox_inventory:RegisterStash(('Farming_market_%s'):format(charId), locale('farmers_market'), moneySlot, 9000000)
    end
end)

ox_inventory:registerHook('swapItems', function(payload)
    if payload.fromInventory == payload.toInventory then return false end
    if payload?.action == 'swap' then return false end

    local toSlot = type(payload.toSlot) == 'number' and payload.toSlot or payload.toSlot.slot
    local isTaking = payload.toType == 'player'

    if not isTaking and toSlot == moneySlot then return false end

    local item = payload.fromSlot
    local name = item.name
    local fromSlot = item.slot

    local price = dummyPrices[name]

    if not isTaking and not price then return false end

    if isTaking and fromSlot == moneySlot then
        if payload.count < item.count then
            utils.notify(payload.source, 'error', locale('market_takemoney'))
            return false
        end

        local items = ox_inventory:GetInventoryItems(payload.fromInventory)

        SetTimeout(0, function()
            addShopItems(items, true)
            ox_inventory:ClearInventory(payload.fromInventory)
        end)

        return true
    elseif not isTaking and name ~= 'money' and toSlot < moneySlot then
        return ox_inventory:AddItem(payload.toInventory, 'money', price * payload.count, nil, moneySlot)
    elseif isTaking and toSlot < moneySlot then
        return ox_inventory:RemoveItem(payload.fromInventory, 'money', price * payload.count, nil, moneySlot)
    end

    return false
end, {
    inventoryFilter = {
        '^Farming_market_[%w]+',
    }
})

ox_inventory:registerHook('buyItem', function(payload)
    return ox_inventory:RemoveItem('Farming_market_main', payload.itemName, payload.count) and removeItem(payload.itemName, payload.count) or false
end, {
    typeFilter = {
        Renewed_Farming_Market = true
    }
})