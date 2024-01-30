local function CanPlaceBeehive(source)
    local identifier = GetPlayerIdentifer(source)
    local retval = true
    local count = 0
    if BeehiveTable then
        for k, v in pairs(BeehiveTable) do
            if v.citizenid == identifier then
                count = count + 1
            end
        end
    end
    
    if count >= Config.MaxBeehives then
        retval = false
    end
    return retval
end

CreateThread(function ()
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        QBCore.Functions.CreateUseableItem(Config.BeehiveItemName, function(source, item)
            if CanPlaceBeehive(source) then
                TriggerClientEvent('snipe-beekeeping:client:PlaceTable', source, Config.BeehiveProps["closed"].Prop, item.name)
            else
                ShowNotification(source, Config.Locale["already_placed_beehive"], "error")
            end
        end)
    elseif Config.Core == "ESX" and Config.Inventory ~= "ox" then
        ESX.RegisterUsableItem(k, function(source, item)
            if CanPlaceBeehive(source) then
                TriggerClientEvent('snipe-beekeeping:client:PlaceTable', source, Config.BeehiveProps["closed"].Prop, item.name)
            else
                ShowNotification(source, Config.Locale["already_placed_beehive"], "error")
            end
        end)
    end
end)

function PlaceBeehive(_, data, inv)
    if CanPlaceBeehive(inv.player.source) then
        TriggerClientEvent('snipe-beekeeping:client:PlaceTable', inv.player.source, Config.BeehiveProps["closed"].Prop, data.name)
    else
        ShowNotification(inv.player.source, Config.Locale["already_placed_beehive"], "error")
    end
end
exports("PlaceBeehive", PlaceBeehive)


-- ██████  ███████ ███    ███  ██████  ██    ██ ███████     ██ ████████ ███████ ███    ███ 
-- ██   ██ ██      ████  ████ ██    ██ ██    ██ ██          ██    ██    ██      ████  ████ 
-- ██████  █████   ██ ████ ██ ██    ██ ██    ██ █████       ██    ██    █████   ██ ████ ██ 
-- ██   ██ ██      ██  ██  ██ ██    ██  ██  ██  ██          ██    ██    ██      ██  ██  ██ 
-- ██   ██ ███████ ██      ██  ██████    ████   ███████     ██    ██    ███████ ██      ██
function RemoveItem(source, item, amount)
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.RemoveItem(item, amount) then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
            return true
        else
            return false
        end
    elseif Config.Core == "ESX" and Config.Inventory ~= "ox" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.removeInventoryItem(item, amount) then
            return true
        else
            return false
        end
    elseif Config.Inventory == "ox" then
        if exports.ox_inventory:RemoveItem(source, item, amount) then 
            return true
        else
            return false
        end
    end
end

--  █████  ██████  ██████  ██ ████████ ███████ ███    ███ 
-- ██   ██ ██   ██ ██   ██ ██    ██    ██      ████  ████ 
-- ███████ ██   ██ ██   ██ ██    ██    █████   ██ ████ ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██    ██      ██  ██  ██ 
-- ██   ██ ██████  ██████  ██    ██    ███████ ██      ██ 

function AddItem(source, item, amount, metadata)
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        local Player = QBCore.Functions.GetPlayer(source)
        if metadata then
            if Player.Functions.AddItem(item, amount, false, metadata) then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
                return true
            else
                return false
            end
        else
            if Player.Functions.AddItem(item, amount) then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
                return true
            else
                return false
            end
        end
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    elseif Config.Core == "ESX" and Config.Inventory ~= "ox" then
        if metadata then
            metadata.showAllDescriptions = true
            TriggerEvent('qs-inventory:addItem', src, item, 1, false, metadata)
            return true
        else
            TriggerEvent('qs-inventory:addItem', src, item, 1)
            return true
        end
    elseif Config.Inventory == "ox" then
        if metadata then
            if exports.ox_inventory:AddItem(source, item, amount, metadata) then
                return true
            else
                return false
            end
        else
            if exports.ox_inventory:AddItem(source, item, amount) then
                return true
            else
                return false
            end
        end
    end
end


-- ██   ██  █████  ███████     ██ ████████ ███████ ███    ███ 
-- ██   ██ ██   ██ ██          ██    ██    ██      ████  ████ 
-- ███████ ███████ ███████     ██    ██    █████   ██ ████ ██ 
-- ██   ██ ██   ██      ██     ██    ██    ██      ██  ██  ██ 
-- ██   ██ ██   ██ ███████     ██    ██    ███████ ██      ██ 


function HasItem(source, item)
    local src = source
    if Config.Core == "QBCore" and Config.Inventory ~= "ox" then
        local Player = QBCore.Functions.GetPlayer(source)
        local itemInfo = Player.Functions.GetItemByName(item)
        if itemInfo ~= nil then
            return true
        else
            return false
        end
    elseif Config.Core == "ESX" and Config.Inventory ~= "ox" then
        local xPlayer = QS.GetPlayerFromId(src)
        local item = xPlayer.Functions.GetItemByName(item)
        if item ~= nil then
            return true
        else
            return false
        end
    elseif Config.Inventory == "ox" then
        local item = exports.ox_inventory:Search(src, 'slots', item)
        if not next(item) then
            return false
        end
        if item[1].count >= 1 then
            return true
        else
            return false
        end
    end
end
