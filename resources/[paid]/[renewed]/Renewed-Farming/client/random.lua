local circleCrossbar = require 'shared.Config'.circleProgress

local progressBar = circleCrossbar and lib.progressCircle or lib.progressBar

local utils = require 'client.utils'

CreateThread(function()
    local randomPlants = lib.callback.await('Renewed-Farming:server:getGeneratedLocations')

    if randomPlants and next(randomPlants) then
        local objects = {}
        local objectAmount = 0

        for i = 1, #randomPlants do
            local plant = randomPlants[i]

            if plant then
                local id = 'Renewed-Farming_random_' .. i
                objectAmount += 1
                objects[objectAmount] = {
                    object = plant.model,
                    coords = vec3(plant.coords.x, plant.coords.y, plant.coords.z),
                    heading = plant.coords.w,
                    freeze = true,
                    dist = 260,
                    id = id,
                    target = {{
                        name = id,
                        label = locale('harvest_plant'),
                        icon = 'fas fa-leaf',
                        onSelect = function()
                            if progressBar({
                                duration = 4500,
                                label = locale('harvesting_plant'),
                                useWhileDead = false,
                                canCancel = true,
                                position = 'bottom',
                                disable = {
                                    car = true,
                                    move = true,
                                    combat = true
                                },
                                anim = {
                                    scenario = 'WORLD_HUMAN_GARDENER_PLANT',
                                }
                            }) then
                                TriggerServerEvent('Renewed-Farming:server:harvestRandoms', plant.id)
                            end
                        end,
                        distance = 2.0
                    }}
                }
            end
        end

        if objectAmount > 0 then
            utils.addObject(objects)
        end
    end
end)

RegisterNetEvent('Renewed-Farming:client:removeRandom', function(index)
    if index then
        utils.removeObject('Renewed-Farming_random_' .. index)
    end
end)