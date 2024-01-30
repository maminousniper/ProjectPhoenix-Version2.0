lib.locale()

local Config = require 'shared.Config'
local utils = require 'server.utils'
local Farms = {}

local ox_inventory = exports.ox_inventory


local function spotDistance(pCoords, sCoords)
    return #(pCoords - sCoords) < 10
end

RegisterNetEvent('Renewed-Farming:server:plantSeed', function(farm, seed, spot)
    local pCoords = GetEntityCoords(GetPlayerPed(source))
    local currentFarm = farm and Farms[farm]
    local currentSpot = spot and currentFarm and currentFarm.plants[spot]

    if not currentSpot or not spotDistance(pCoords, vec3(currentFarm.coords.x, currentFarm.coords.y, currentFarm.coords.z)) then return end

    if not currentSpot.seed and ox_inventory:RemoveItem(source, seed, 1) then
        currentSpot.seed = seed
        currentSpot.timestamp = os.time()
        currentSpot.dead = false
        currentSpot.stage = 1
        currentSpot.growth = 0

        TriggerClientEvent('Renewed-Farming:client:seedPlanted', -1, farm, seed, spot)
    end
end)

RegisterNetEvent('Renewed-Farming:server:harvestSeed', function(farm, spot)
    local src = source
    local currentSpot = spot and farm and Farms[farm] and Farms[farm].plants[spot]
    local seed = currentSpot and currentSpot.seed

    if not seed then return end
    local pData = Config.Plants[seed]

    if currentSpot.stage < #pData.stages and not currentSpot.dead then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - vec3(currentSpot.coords.x, currentSpot.coords.y, currentSpot.coords.z)) < 5 and currentSpot.seed then
        currentSpot.seed = nil


        if currentSpot.dead and next(pData.deadplant.rewards) then
            for k, v in pairs(pData.deadplant.rewards) do
                local count = math.random(v.min, v.max)

                if count > 0 and not utils.canGive(src, k, count) then
                    ox_inventory:CustomDrop(locale('farming'), {
                        {k, count},
                    }, vec3(currentSpot.coords.x, currentSpot.coords.y, currentSpot.coords.z))
                end
            end
        elseif next(pData.rewards) then
            for k, v in pairs(pData.rewards) do
                local count = math.random(v.min, v.max)

                if count > 0 and not utils.canGive(src, k, count) then
                    ox_inventory:CustomDrop(locale('farming'), {
                        {k, count},
                    }, vec3(currentSpot.coords.x, currentSpot.coords.y, currentSpot.coords.z))
                end
            end
        end


        TriggerClientEvent('Renewed-Farming:client:deadPlants', -1, {{
            farm = farm,
            spot = spot,
            delete = true
        }})
    end
end)

-- Watering --
local waterCans = {}

local function getWaterCan(items)
    local highestDurability, slot = 0, 0
    local metadata = {}

    for i = 1, #items do
        local item = items[i]

        local durability = item.metadata and item.metadata.durability or 0

        if durability > highestDurability then
            highestDurability = durability
            metadata = item.metadata
            slot = item.slot
        end
    end

    return slot, metadata
end

local function waterCan(src, coords, despawn)
    if waterCans[src] and despawn then
        local object = waterCans[src]
        Entity(object).state:set('entityParticle', false, true)
        Player(src).state:set('attachEntity', false, true)

        DeleteEntity(object)

        waterCans[src] = nil
    elseif not waterCans[src] and not despawn then
        local object = CreateObject(`prop_wateringcan`, coords.x, coords.y, coords.z - 20, true, true, true)

        while not DoesEntityExist(object) do
            Wait(25)
        end

        Player(src).state:set('attachEntity', {
            entity = NetworkGetNetworkIdFromEntity(object),
            bone = 0x8CBD,
            offset = vec3(0.15, 0.0, 0.4),
            rotation = vec3(0.0, -180.0, -140.0)
        }, true)

        Entity(object).state:set('entityParticle', {
            dict = 'core',
            effect = 'ent_sht_water_tower',
            offset = vec3(0.35, 0.0, 0.25),
            rotation = vec3(0.0, 0.0, 0.0),
            scale = 2.0,
        }, true)

        waterCans[src] = object
    end
end

RegisterNetEvent('Renewed-Farming:server:waterPlant', function(farm, spot)
    local src = source
    local currentFarm = farm and Farms[farm]
    local currentSpot = spot and currentFarm and currentFarm.plants[spot]

    if not currentSpot then return end

    local playerPed = GetPlayerPed(src)
    local pCoords = GetEntityCoords(playerPed)

    if not spotDistance(pCoords, vec3(currentSpot.coords.x, currentSpot.coords.y, currentSpot.coords.z)) then print("returns here") return end

    local items = ox_inventory:Search(src, 'slots', Config.wateringCan.item)

    local slot, metadata = getWaterCan(items)

    if slot == 0 then return utils.notify(src, 'error', locale('no_water')) end

    waterCan(src, pCoords)
    local success = lib.callback.await('Renewed-Farming:client:waterPlant', src)
    waterCan(src, false, true)

    pCoords = GetEntityCoords(playerPed)

    if not spotDistance(pCoords, vec3(currentSpot.coords.x, currentSpot.coords.y, currentSpot.coords.z)) then print("returns here") return end

    local itemSlot = success and ox_inventory:GetSlot(src, slot)
    if success and itemSlot and lib.table.matches(itemSlot.metadata, metadata) then
        if not currentSpot.water or currentSpot.water <= 0 then
            TriggerClientEvent('Renewed-Farming:client:waterPlant', -1, farm, spot)
        end

        itemSlot.metadata.durability -= 1
        ox_inventory:SetMetadata(src, itemSlot.slot, itemSlot.metadata)

        currentSpot.water = 100
        currentSpot.waterstamp = os.time()
    end

end)

for _, v in pairs(Config.Plants) do
    v.percent = 100 / (#v.stages - 1)
end

CreateThread(function()
    while true do
        local changedAmt, deadAmt, waterAmt = 0, 0, 0
        local Changed, deadPlants, waterPlants = {}, {}, {}
        local time = os.time()

        for k, v in pairs(Farms) do
            for i = 1, #v.plants do
                local plant = v.plants[i]
                if plant.seed and not plant.dead then
                    local pData = Config.Plants[plant.seed]
                    local growth = utils.growthTime(pData.growthTime or 1, time, plant.timestamp)

                    plant.growth = growth

                    if growth >= pData.deadplant.percent then
                        plant.dead = true
                        deadAmt += 1
                        deadPlants[deadAmt] = {
                            farm = k,
                            spot = i,
                            seed = plant.seed
                        }
                    elseif growth > Config.waterDeath and (not plant.water or plant.water == 0) then
                        plant.dead = true
                        deadAmt += 1
                        deadPlants[deadAmt] = {
                            farm = k,
                            spot = i,
                            delete = true
                        }
                    elseif growth < 100 and plant.stage < #pData.stages then
                        local stage = utils.getStage(growth, pData.percent)

                        if stage ~= plant.stage then
                            plant.stage = stage
                            changedAmt += 1
                            Changed[changedAmt] = {
                                farm = k,
                                spot = i,
                                stage = plant.stage,
                                seed = plant.seed
                            }
                        end
                    end
                end

                if plant.water and plant.water > 0 then
                    plant.water = utils.minusWater(time, plant.waterstamp)

                    if plant.water == 0 then
                        waterAmt += 1
                        waterPlants[waterAmt] = {
                            farm = k,
                            spot = i,
                        }
                    end
                end
            end
        end

        if changedAmt > 0 then
            TriggerClientEvent('Renewed-Farming:client:updatePlants', -1, Changed)
        end

        if deadAmt > 0 then
            TriggerClientEvent('Renewed-Farming:client:deadPlants', -1, deadPlants)
        end

        if waterAmt > 0 then
            TriggerClientEvent('Renewed-Farming:client:driedSpot', -1, waterPlants)
        end

        Wait(1 * 60000)
    end
end)



local db = require 'server.db'
local loaded = false
function addFarm(id, coords, points, onload)
    Farms[id] = {
        coords = coords,
        plants = {}
    }

    for i = 1, #points do
        local point = points[i]

        Farms[id].plants[i] = {
            inUse = false,
            growth = 0,
            seed = nil,
            stage = 0,
            coords = point
        }
    end

    if not onload then
        TriggerClientEvent('Renewed-Farming:client:addFarm', -1, id, coords, Farms[id].plants)
    end
end

CreateThread(function()
    local dbFarms = db.getFarms()

    if dbFarms and next(dbFarms) then
        for _, v in pairs(dbFarms) do
            addFarm(v.id, vec4(v.x, v.y, v.z, v.heading), json.decode(v.spots), true)
        end
    end

    loaded = true
end)


lib.addCommand('createfarm', {
    help = 'Creates a farm where everyone can grow plants',
    restricted = 'group.admin'
}, function(source)
    local coords, points = lib.callback.await('Renewed-Farming:client:placeFarm', source)

    if not coords then return end

    local id = db.createFarm(coords, points)

    if not id then return end

    addFarm(id, coords, points)
end)

lib.callback.register('Renewed-Farming:server:getFarms', function()
    while not loaded do Wait(25) end

    return Farms
end)

lib.callback.register('Renewed-Farming:server:checkGrowth', function(_, farm, plants)
    local currentFarm = farm and Farms[farm]

    local grownPlants = {}
    local grownAmount = 0

    if currentFarm then
        for i = 1, #plants do
            local spot = plants[i]?.index
            local plant = spot and currentFarm.plants[spot]
            local pData = plant and Config.Plants[plant.seed]

            if plant and (plant.stage == #pData.stages or plant.dead) then
                grownAmount += 1
                grownPlants[grownAmount] = plants[i]
            end
        end
    end

    return grownPlants
end)