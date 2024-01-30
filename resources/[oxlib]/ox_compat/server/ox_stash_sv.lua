local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('inventory:server:OpenInventory')
AddEventHandler('inventory:server:OpenInventory', function(name, id, other)
    local src = source
    if name == "dumpster" or "player" or "container" then
        TriggerClientEvent("ox_compat:openutil", src, name, id) 
        return
    end
    if name == "stash" then
        exports["ox_inventory"]:RegisterStash(id, name, other.slots, other.maxweight)
	    TriggerClientEvent("ox_compat:openutil", src, name, id) 
        return
    end

    QBCore.Functions.Notify(src, "There is an issue, Please see F8 and report to a dev", 'error')
    print("You tried to open" .. name .. "This doesnt exist, Please report to a developer.")
    print("Name:" .. name)
    print("ID:" .. id)
    print("Other:" .. other)
end)