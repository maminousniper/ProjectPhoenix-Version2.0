local Farms = {}
local playerFarms = {}
local Renewed = exports['Renewed-Lib']:getLib()
local Plants = require 'shared.Config'.Plants
local wateringCan = require 'shared.Config'.wateringCan.item

function Farms.addFarm(id, coords, spots)
    local newSpots = {}

    for i = 1, #spots do
        newSpots[i] = {
            coords = vec3(spots[i].coords.x, spots[i].coords.y, spots[i].coords.z),
            inUse = false
        }
    end

    playerFarms[id] = {
        coords = coords,
        spots = newSpots
    }

    Renewed.addObject({
        object = `np_garden_001`,
        coords = coords.xyz,
        heading = coords.w,
        freeze = true,
        dist = 260,
    })
end

function Farms.getFarm(coords)
    if not coords then return end

    for k, v in pairs(playerFarms) do
        if #(coords - vec3(v.coords.x, v.coords.y, v.coords.z)) < 2.0 then
            return k
        end
    end

    return false
end

function Farms.getClosestSpot(id, coords)
    local Farm = id and playerFarms[id]

    if not Farm then return end

    local spots = {}
    local spotAmt = 0

    for i = 1, #Farm.spots do
        local spot = Farm.spots[i]

        if not spot.inUse then
            spotAmt += 1
            spots[spotAmt] = {
                dist = #(coords - spot.coords),
                coords = spot.coords,
                index = i,
            }
        end
    end

    table.sort(spots, function(a, b) return a.dist < b.dist end)

    return spots, spotAmt
end

function Farms.getPlantsInDist(farm, coords)
    local currentFarm = farm and playerFarms[farm]

    if not currentFarm then return end

    local plants = {}
    local plantAmt = 0
    local myCoords = GetEntityCoords(cache.ped)
    for i = 1, #currentFarm.spots do
        local spot = currentFarm.spots[i]

        if spot.inUse and #(coords - spot.coords) < 0.8 then
            plantAmt += 1
            plants[plantAmt] = {
                dist = #(myCoords - spot.coords),
                coords = spot.coords,
                index = i,
            }
        end
    end

    return plants
end

function Farms.isSpotUsed(farm, spot)
    local currentFarm = farm and playerFarms[farm]

    if not currentFarm then return end

    return currentFarm.spots[spot].inUse
end

function Farms.addSeed(farm, spot, seed)
    local currentFarm = farm and playerFarms[farm]?.spots
    local plantSettings = currentFarm and Plants[seed]

    if plantSettings then
        currentFarm[spot].inUse = true

        local coords = currentFarm[spot].coords

        local zOffset = plantSettings.plantOffset or 0.0

        Renewed.addObject({
            id = ('Renewed-Farming-%s-%s'):format(farm, spot),
            object = plantSettings.stages[1].stage,
            coords = vec3(coords.x, coords.y, coords.z + zOffset),
            heading = 0,
            colissions = false,
            dist = 130,
        })

        currentFarm[spot].target = exports.ox_target:addSphereZone({
            coords = vec(coords.x, coords.y, coords.z + 0.2),
            radius = 0.4,
            debug = false,
            options = {
                {
                    label = locale('add_water'),
                    icon = 'fa-solid fa-droplet',
                    onSelect = function()
                        TriggerServerEvent('Renewed-Farming:server:waterPlant', farm, spot)
                    end,
                    items = wateringCan,
                    distance = 2.0
                }
            }
        })
    end
end

function Farms.changeSeed(farm, spot, seed, stage)
    if not farm or not spot or not seed or not stage then return end

    local plantData = playerFarms[farm] and playerFarms[farm].spots[spot]
    local stageData = plantData and Plants[seed] and Plants[seed].stages[stage]

    if stageData then
        Renewed.changeObject(('Renewed-Farming-%s-%s'):format(farm, spot), stageData.stage, plantData.coords + stageData.offset)
    end
end

function Farms.deadPlants(farm, spot, seed, delete)
    local currentFarm = farm and playerFarms[farm]

    if currentFarm then
        local id = ('Renewed-Farming-%s-%s'):format(farm, spot)

        if delete then
            currentFarm.spots[spot].inUse = false
            Renewed.removeObject(id)

            exports.ox_target:removeZone(currentFarm.spots[spot].target)
        else
            local plantData = playerFarms[farm].spots[spot]
            local stageData = Plants[seed].deadplant

            Renewed.changeObject(id, stageData.stage, plantData.coords + stageData.offset)
        end
    end
end

function Farms.waterPlant(farm, spot)
    local currentFarm = farm and playerFarms[farm]

    if currentFarm then
        local plantData = spot and currentFarm.spots[spot]

        if plantData then
            Renewed.addObject({
                id = ('Renewed-Farming-water-%s-%s'):format(farm, spot),
                object = `mud_decal_farming`,
                coords = plantData.coords,
                heading = 0,
                colissions = false,
                dist = 65,
            })
        end
    end
end

function Farms.driedSpot(farm, spot)
    Renewed.removeObject(('Renewed-Farming-water-%s-%s'):format(farm, spot))
end

return Farms