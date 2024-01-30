local QBCore = exports[Config.Core]:GetCoreObject()

local PlayerData = {}
local connected = false
local inBennys = false
local blip

-- Functions

local function inZone()
    local zone = {
        vector2(-1359.4564208984, -761.13494873047),
        vector2(-1363.5231933594, -755.79376220703),
        vector2(-1357.4534912109, -751.29956054688),
        vector2(-1353.4460449219, -756.73413085938),
    }

    local hotSpotZone = PolyZone:Create(zone, {
        name = 'Hot Spot Zone',
        minZ = 	22.304 - 2.0, 
        maxZ = 22.304 + 2.0,
        debugPoly = false
    })

    hotSpotZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inBennys = true
        else
            inBennys = false
            connected = false
        end
    end)
end

local function createBlip(coords)
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 351)
    SetBlipHighDetail(blip, true)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 5)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Pickup Location')
    EndTextCommandSetBlipName(blip)
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('qb-hotspot:client:createPickupZone', function()
    if blip then RemoveBlip(blip) end
    createBlip(Config.PickupLocation)

    local hotspotPickupZone = CircleZone:Create(Config.PickupLocation, 2.0, {
        name = "hotspotPickupZone",
        debugPoly = false
    })
    hotspotPickupZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            TriggerServerEvent('qb-hotspot:server:getItem')
            hotspotPickupZone:destroy()
        end
    end)
end)

RegisterNetEvent('qb-hotspot:client:removeHotspotBlip', function()
    RemoveBlip(blip)
end)

RegisterNetEvent('qb-hotspot:client:connectToHotspot', function(data)
    connected = true
    TriggerEvent('qb-phone:client:CustomNotification', 'HOT SPOT', 'You have connected to the '..data.network..' hotspot', 'fas fa-wifi', '#1DA1F2', 5000)
    if data.network == 'private' then
        inBennys = true
    end
end)

-- Threads

CreateThread(function()
    RemoveBlip(blip)
    inZone()
end)

-- Exports

exports('inBennys', function() return inBennys end)
exports('isConnected', function() return connected end)