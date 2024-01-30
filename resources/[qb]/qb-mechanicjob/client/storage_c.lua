local ox_inventory = exports.ox_inventory

RegisterNetEvent('qb-mechanicjob:openStashOx')
AddEventHandler('qb-mechanicjob:openStashOx', function()
    ox_inventory:openInventory('stash', 'mech_stash')
end)


 

