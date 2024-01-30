

RegisterNetEvent('ox_compat:openutil', function(name, id)
    exports["ox_inventory"]:openInventory(name, {
        id = id
     })
end) 