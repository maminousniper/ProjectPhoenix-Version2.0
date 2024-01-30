local models = {}

CreateThread(function()
    while not started do Wait(100) end
    for k, v in pairs(Config.Sprays) do
        if v.ped then
            for a, b in pairs(v.ped) do
                local model = GetHashKey(b)
                if not models[model] then
                    models[model] = true
                    RequestModel(model)
                    exports[Config.TargetSystem]:AddTargetModel(model, {
                        options = {
                            {
                                label = Lang['open_stash'],
                                icon = 'fa-solid fa-box',
                                event = "av_gangs:targetStash",
                                gangName = k,
                                canInteract = function(entity)
                                    if currentZone and not IsEntityDead(entity) and (currentZone == currentGang['name']) then
                                        return true
                                    end
                                    return false
                                end,
                            },
                            {
                                label = Lang['rob'],
                                icon = 'fas fa-user-ninja',
                                event = "av_gangs:rob",
                                gangName = k,
                                canInteract = function(entity)
                                    if currentZone and not IsEntityDead(entity) and Authorized() then
                                        return true
                                    end
                                    return false
                                end, 
                            },
                        },
                        distance = 2.0
                    })
                end
            end
        end
    end
end)