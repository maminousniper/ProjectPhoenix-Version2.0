local utils = {}
local Renewed = exports['Renewed-Lib']:getLib()

function utils.addPed(data)
    Renewed.addPed(data)
end

function utils.getCharId()
    return Renewed.getCharId()
end

function utils.addObject(data)
    Renewed.addObject(data)
end

function utils.removeObject(id)
    Renewed.removeObject(id)
end

function utils.registerNetEvent(event, fn)
    RegisterNetEvent(event, function(...)
        if source ~= '' then fn(...) end
    end)
end

function utils.addBlip(settings)
    local blip = AddBlipForCoord(settings.coords.x, settings.coords.y, settings.coords.z)
    SetBlipSprite(blip, settings.id)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, settings.scale)
    SetBlipColour(blip, settings.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(settings.name)
    EndTextCommandSetBlipName(blip)
end

return utils