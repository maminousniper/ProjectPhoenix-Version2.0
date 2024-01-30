if GetResourceState('Renewed-Weed'):find('start') then return end

local Config = require 'shared.Config'.wateringCan
local waterCanWeight = require 'server.utils'.waterCanWeight

exports.ox_inventory:registerHook('swapItems', function(payload)
    if payload.action ~= 'swap' or payload.fromInventory ~= payload.toInventory or not payload.source or payload.source ~= payload.toInventory then return true end

    local item = payload.fromSlot
    local item2 = payload.toSlot

    if item2.name == Config.item and item.name == 'water' then
        local metadata = item2.metadata
        local durability = metadata and metadata.durability or 0

        if durability + Config.waterToDurability > 100 then return true end

        SetTimeout(10, function()
            durability += Config.waterToDurability

            if exports.ox_inventory:RemoveItem(payload.fromInventory, item.name, 1, item.metadata, item.slot) then

                metadata.durability = durability
                metadata.weight = waterCanWeight(durability)

                exports.ox_inventory:SetMetadata(payload.fromInventory, item2.slot, metadata)
            end
        end)

        return false
    end

    return true
end, {
    itemFilter = {
        water = true,
        [Config.item] = true
    }
})