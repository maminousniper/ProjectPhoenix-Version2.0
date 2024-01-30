lib.locale()

local Config = require 'shared.Config'
local Farms = require 'client.farms'

local progressBar = Config.circleProgress and lib.progressCircle or lib.progressBar

local currentEntity
local currentFarm

local myPlants = {}
local plantAmt = 0
local planting = false

local function deletePlant(entity)
    SetEntityAsMissionEntity(entity, false, true)
    DeleteObject(entity)
end

local GetGameTimer = GetGameTimer
local GetEntityCoords = GetEntityCoords

local function removeTrowels()
    local objects = GetGamePool('CObject')
    local meCoords = GetEntityCoords(cache.ped)
    for i = 1, #objects do
        local object = objects[i]
        local cCoords = GetEntityCoords(object)

        if #(meCoords - cCoords) < 25.0 then
            if GetEntityModel(object) == `prop_cs_trowel` then
                deletePlant(object)
            end
        end
    end
end

local function moveToCoords(coords)
    local timeout = GetGameTimer() + 5000
    local dist = #(coords - GetEntityCoords(cache.ped))

    TaskGoStraightToCoord(cache.ped, coords.x, coords.y, coords.z, 1.0, -1, 0.0, 0.0)

    while dist > 1.4 do
        dist = #(coords - GetEntityCoords(cache.ped))

        if GetGameTimer() > timeout then
            ClearPedTasksImmediately(cache.ped)
            return false, true
        end

        if dist < 1.4 then
            ClearPedTasksImmediately(cache.ped)
            break
        end

        Wait(0)
    end

    return dist < 1.4
end

local function plantSeeds(coords, seed)
    if not next(coords) then return end

    lib.hideTextUI()

    local pCoords = GetEntityCoords(cache.ped)

    for i = 1, #coords do
        coords[i].dist = #(pCoords - coords[i].coords)
    end

    table.sort(coords, function(a, b) return a.dist < b.dist end)

    for i = 1, #coords do
        local spot = coords[i]

        if not Farms.isSpotUsed(currentFarm, spot.spot) and exports.ox_inventory:GetItemCount(seed) > 0 then
            local dist = #(spot.coords - GetEntityCoords(cache.ped))
            local ready = dist < 1.4 or moveToCoords(spot.coords)

            if ready then
                TaskTurnPedToFaceEntity(cache.ped, spot.plant, 750)

                Wait(750)

                if progressBar({
                    duration = 4500,
                    label = locale('planting_seed'),
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
                    ClearPedTasksImmediately(cache.ped)
                    TriggerServerEvent('Renewed-Farming:server:plantSeed', currentFarm, seed, spot.spot)
                end
            end
        end

        deletePlant(spot.plant)
    end

    Wait(250)

    removeTrowels()
end

local function harvestSeeds(farm, payload)
    table.sort(payload, function(a, b) return a.dist < b.dist end)

    for i = 1, #payload do
        local plant = payload[i]

        if Farms.isSpotUsed(farm, plant.index) then
            local success = plant.dist < 1.4 or moveToCoords(vec3(plant.coords.x, plant.coords.y, plant.coords.z + 0.5))


            if success then
                TaskTurnPedToFaceCoord(cache.ped, plant.coords.x, plant.coords.y, plant.coords.z + 0.5, 750)
                Wait(750)

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
                    ClearPedTasksImmediately(cache.ped)
                    TriggerServerEvent('Renewed-Farming:server:harvestSeed', farm, plant.index)
                end
            end
        end
    end

    Wait(250)

    removeTrowels()
end

local function addSeed(model, count)
    count = count > 10 and 10 or count

    if #myPlants >= count then return end

    lib.RequestModel(model)

    plantAmt += 1

    local object = CreateObject(model, 0.0, 0.0, 0.0, false, true, true)
    SetEntityCollision(object, false, false)

    myPlants[plantAmt] = object

    return true
end

local SetEntityCoords = SetEntityCoords


local OxTxt = {
    ('-- %s --  \n'):format(locale('place_seed')),
    ('[E] %s  \n'):format(locale('place')),
    ('[X] %s  \n'):format(locale('cancel')),
    ('[%s] %s'):format(plantAmt, locale('plants')),
}

local function changeText()
    OxTxt[4] = ('[%s] %s'):format(plantAmt, locale('plants'))
    lib.showTextUI(table.concat(OxTxt), {
        position = "left-center",
    })

end


local IsControlJustPressed = IsControlJustPressed
local function placeSeed(data)
    if planting then return end

    local plant = data and data.name

    local plantSettings = plant and Config.Plants[plant]

    if not plantSettings then
        return
    end

    planting = not planting

    local plantOffset = plantSettings.stages[1].offset or vec3(0.0, 0.0, 0.0)
    local model = plantSettings.stages[1].stage

    addSeed(model, data.count)

    changeText()

    local allCoords = {}

    while planting do
        local hit, entity, coords, _, material = lib.raycast.cam(1, 4, 10.0)
        local xPressed = IsControlJustPressed(0, 73)

        if hit and entity and material == -700658213 and coords then
            if entity ~= currentEntity then
                currentEntity = entity
                currentFarm = Farms.getFarm(GetEntityCoords(entity))
            end

            local spots, amount = Farms.getClosestSpot(currentFarm, coords)

            if spots and amount > 0 then
                if amount > plantAmt then amount = plantAmt end

                for i = 1, amount do
                    local cPlant = myPlants[i]
                    local cSpot = spots[i]
                    local pCoords = cSpot.coords + plantOffset
                    allCoords[i] = {
                        coords = pCoords,
                        spot = cSpot.index,
                        plant = cPlant,
                    }

                    SetEntityCoords(cPlant, pCoords.x, pCoords.y, pCoords.z)
                end



                local ePressed = IsControlJustPressed(0, 38)
                local dScroll = IsControlJustPressed(0, 14)

                if ePressed then
                    plantSeeds(allCoords, plant)
                    break
                elseif dScroll then
                    if addSeed(model, data.count) then
                        changeText()
                    end
                elseif IsControlJustPressed(0, 15) then
                    if plantAmt > 1 then
                        deletePlant(myPlants[plantAmt])
                        allCoords[plantAmt] = nil
                        myPlants[plantAmt] = nil
                        plantAmt -= 1
                        changeText()
                    end
                end
            end
        end

        if xPressed then
            break
        end
    end

    lib.hideTextUI()

    if next(myPlants) then
        for _, v in pairs(myPlants) do
            deletePlant(v)
        end

        myPlants = {}
        plantAmt = 0
    end

    SetModelAsNoLongerNeeded(model)
    planting = false
    currentEntity = nil
    currentFarm = nil
end exports('placeSeed', placeSeed)

local pitchForking = false

local function resetPlants()
    currentEntity = nil
    currentFarm = nil
    pitchForking = false
    lib.hideTextUI()
end

local falseRgb = { 255, 0, 0 }
local trueRgb = { 0, 255, 0 }

local DrawMarker = DrawMarker
local function getPlants()
    if pitchForking then return end
    pitchForking = true
    lib.showTextUI(table.concat({
        ('-- %s --  \n'):format(locale('harvest_plant')),
        ('[E] %s  \n'):format(locale('harvest')),
        ('[X] %s  \n'):format(locale('cancel')),
    }), {
        position = "left-center",
    })

    while pitchForking do
        local _, entity, coords, _, material = lib.raycast.cam(1, 4, 15.0)
        if entity ~= currentEntity or not currentFarm then
            currentEntity = entity
            currentFarm = material == -700658213 and Farms.getFarm(GetEntityCoords(entity))
        end

        local rgb = currentFarm and trueRgb or falseRgb

        DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, rgb[1], rgb[2], rgb[3], 100, false, false, 0, false, false, false, false)

        if IsControlJustPressed(0, 38) then
            SetTimeout(100, resetPlants)
            return Farms.getPlantsInDist(currentFarm, coords), currentFarm
        elseif IsControlJustPressed(0, 73) then
            SetTimeout(100, resetPlants)
            return false, false
        end
    end
end

local function harvestPlants()
    if pitchForking then return end

    local plants, farm = getPlants()

    if not plants or not farm then return end

    local grownPlants = lib.callback.await('Renewed-Farming:server:checkGrowth', false, farm, plants)

    if next(grownPlants) then
        harvestSeeds(farm, grownPlants)
    end
end exports('harvestPlants', harvestPlants)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, v in pairs(myPlants) do
            deletePlant(v)
        end
    end
end)

CreateThread(function()
    local farms = lib.callback.await('Renewed-Farming:server:getFarms', false)

    for k, v in pairs(farms) do
        Farms.addFarm(k, v.coords, v.plants)


        if v.plants and next(v.plants) then
            for i = 1, #v.plants do
                local plant = v.plants[i]

                if plant and plant.seed then
                    Farms.addSeed(k, i, plant.seed)
                end

                if plant.water and plant.water > 0 then
                    Farms.waterPlant(k, i)
                end
            end
        end
    end
end)

lib.callback.register('Renewed-Farming:client:waterPlant', function()
    return progressBar({
		label = locale('watering_plant'),
        position = 'bottom',
		duration = 6000,
		canCancel = true,
		disable = {
            move = not Config.waterWalk,
			combat = true,
		},
		anim = {
			dict = 'missfbi3_waterboard',
			clip = 'waterboard_loop_player',
		}
	})
end)



-- Server sided secure net events --
local registerNetEvent = require 'client.utils'.registerNetEvent

registerNetEvent('Renewed-Farming:client:addFarm', function(id, coords, points)
    Farms.addFarm(id, coords, points)
end)

registerNetEvent('Renewed-Farming:client:waterPlant', function(farm, spot)
    Farms.waterPlant(farm, spot)
end)

registerNetEvent('Renewed-Farming:client:driedSpot', function(payload)
    for i = 1, #payload do
        local plant = payload[i]

        if plant then
            Farms.driedSpot(plant.farm, plant.spot)
        end
    end
end)

registerNetEvent('Renewed-Farming:client:seedPlanted', function(farm, seed, spot)
    Farms.addSeed(farm, spot, seed)
end)

registerNetEvent('Renewed-Farming:client:updatePlants', function(data)
    for i = 1, #data do
        local plant = data[i]

        if plant then
            Farms.changeSeed(plant.farm, plant.spot, plant.seed, plant.stage)
        end
    end
end)

registerNetEvent('Renewed-Farming:client:deadPlants', function(data)
    for i = 1, #data do
        local plant = data[i]
        if plant then
            Farms.deadPlants(plant.farm, plant.spot, plant.seed, plant.delete)
        end
    end
end)