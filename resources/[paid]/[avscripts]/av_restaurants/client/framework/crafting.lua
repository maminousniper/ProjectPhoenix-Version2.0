busy = false
AddEventHandler('av_restaurant:craft', function(data)
    if busy then return end
    busy = true
    local job, item, type, ingredients, image, label, prop = data['job'], data['item'], data['type'], data['ingredients'], data['image'], data['itemLabel'], data['prop']
    lib.requestAnimDict(Config.CraftingDict, 10000)
    TaskPlayAnim(PlayerPedId(), Config.CraftingDict, Config.CraftAnimation, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    Wait(Config.CraftingTime)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent('av_restaurant:craftEnd', job, item, type, ingredients, image, label, prop)
    busy = false
end)