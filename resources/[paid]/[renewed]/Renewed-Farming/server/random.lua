local Config = require 'shared.Random'
local Plants = require 'shared.Config'.Plants

if Config.disable then return end

local canGive = require 'server.utils'.canGive

local randomPlants = {}
local currentLocations = {}
local loaded = false

CreateThread(function()
    for k, _ in pairs(Plants) do
        randomPlants[#randomPlants + 1] = k
    end

    for i = 1, #Config.Locations do
        local Location = Config.Locations[i]

        if Location.Type then
            Location.type = Location.Type
        end

        if not Location.type or Location.type == 'random' then
            Location.type = randomPlants[math.random(1, #randomPlants)]
        end

        if not Plants[Location.type] then
            table.remove(Config.Locations, i)
        else
            local pData = Plants[Location.type].stages[#Plants[Location.type].stages]

            if Config.minusOne then
                Location.coords = vec3(Location.coords.x, Location.coords.y, Location.coords.z + -1.0 + pData.offset.z)
            else
                Location.coords = vec3(Location.coords.x, Location.coords.y, Location.coords.z + pData.offset.z)
            end

            Location.model = pData.stage
        end
    end


    local spots = 0
    for index = 1, #Config.Locations do
        local Location = Config.Locations[index]
        if Location then
            spots += 1
            Location.id = spots
            currentLocations[spots] = Location
        end
    end

    loaded = true
end)

local function getIndex(id)
    for i = 1, #currentLocations do
        if currentLocations[i].id == id then
            return i
        end
    end

    return nil
end

RegisterNetEvent('Renewed-Farming:server:harvestRandoms', function(id)
    local index = getIndex(id)
    local Location = index and currentLocations[index]

    if Location then
        table.remove(currentLocations, index)

        local rewards = Plants[Location.type].rewards

        if rewards and next(rewards) then
            for k, v in pairs(rewards) do
                local count = math.random(v.min, v.max)

                if count > 0 and not canGive(source, k, count) then
                    exports.ox_inventory:CustomDrop('Farming', {
                        {k, count},
                    }, Location.coords.xyz)
                end
            end
        end

        TriggerClientEvent('Renewed-Farming:client:removeRandom', -1, index)
    end
end)

lib.callback.register('Renewed-Farming:server:getGeneratedLocations', function()
    while not loaded do Wait(0) end

    return currentLocations
end)