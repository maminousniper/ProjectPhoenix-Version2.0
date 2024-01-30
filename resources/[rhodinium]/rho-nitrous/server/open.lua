-- Hooks

local hookId = exports.ox_inventory:registerHook('createItem', function(payload)
    local metadata = payload.metadata
    metadata.nitrous = metadata.nitrous or 'Empty'
    return metadata
end, {
    itemFilter = {
        nitrous = true
    }
})

-- Events

RegisterServerEvent("brazzers-nitrous:client:setNitrousBottle", function(index, slot)
    if not slot then
        local slot = exports.ox_inventory:GetSlotIdWithItem(source, 'nitrous')
        local item = exports.ox_inventory:GetSlot(source, slot)
    
        item.metadata.nitrous = index
        exports.ox_inventory:SetMetadata(source, item.slot, item.metadata)
        return
    end

    print("slot found")

    slot.metadata.nitrous = index
    exports.ox_inventory:SetMetadata(source, slot.slot, slot.metadata)
end)

RegisterServerEvent("brazzers-nitrous:server:refillTheFuckingBottle", function()
    local paid = exports['qb-phone']:RemoveCrypto(source, 'gne', 5)
    if not paid then 
        TriggerClientEvent('qb-phone:client:CustomNotification', source, "WALLET", "Not enough crypto in your wallet", "fas fa-chart-line", "#D3B300", 7500) 
    else
        TriggerClientEvent("brazzers-nitrous:client:refillTheFuckingBottle", source)
    end
    
end)