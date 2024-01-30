function Round(value, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

function checkSpawn(coords)
    local vehicles = lib.getNearbyVehicles(vector3(coords.x, coords.y, coords.z), 10, true)
    if #vehicles >= 1 then return false end
    return true
end

function giveKeys(vehicle)
    local plates = GetVehicleNumberPlateText(vehicle)
    -- Add your own GiveKeys event/export here:

end

function setFuel(vehicle)
    -- Your fuel export/event here:

end

function vehicleMods(vehicle, mods)
    if Config.Framework == "QBCore" then
        QBCore.Functions.SetVehicleProperties(vehicle, mods)
        return
    end
    if Config.Framework == "ESX" then
        ESX.Game.SetVehicleProperties(vehicle, mods)
    end
end