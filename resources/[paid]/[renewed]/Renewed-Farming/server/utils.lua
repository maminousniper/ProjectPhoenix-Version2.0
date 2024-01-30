local utils = {}
local Config = require 'shared.Config'
local getCharId = exports['Renewed-Lib']:getLib().getCharId


function utils.getStage(percent, stagePercent)
    return math.floor((percent / stagePercent) + 1.5)
end

function utils.minusWater(currentTime, oldTime)
    local minutesPassed = (currentTime - oldTime) / 60 -- Sees the time passed in minutes

    local waterLost = minutesPassed * Config.waterPercent

    return waterLost > 100 and 0 or 100 - waterLost
end

function utils.growthTime(growthTime, currentTime, oldTime)
    local timePassed = (currentTime - oldTime) / 60 -- Sees the time passed in minutes

    return math.ceil((timePassed / growthTime) * 100)
end

function utils.canGive(inventory, name, count)
    return count > 0 and exports.ox_inventory:CanCarryItem(inventory, name, count) and exports.ox_inventory:AddItem(inventory, name, count)
end

function utils.waterCanWeight(durability)
    return (Config.canWeight * 1000) * (durability / 100)
end

function utils.notify(source, notiType, message)
    TriggerClientEvent('ox_lib:notify', source, { type = notiType, description = message })
end

function utils.getCharId(source)
    return getCharId(source)
end

return utils