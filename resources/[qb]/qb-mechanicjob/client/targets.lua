local insideShop = false

CreateThread(function()
    exports["qb-polyzone"]:AddBoxZone("carshop1", vector3(-1418.63, -446.33, 35.91), 23.6, 14.8, {
      heading=302,
      minZ=34.71,
      maxZ=39.31,
      data = {
        id = "carshop1", 
      }
    })
end)
  
AddEventHandler("qb-polyzone:enter", function(zone, data)
    if zone == "carshop1" then
      insideShop = true
    end
end)
  
AddEventHandler("qb-polyzone:exit", function(zone, data)
    if zone == "carshop1" then
        insideShop = false
    end
end)

Citizen.CreateThread(function()
    local options = {
        {
        name = 'ox_target:mech:openMenu',
        label = 'Inspect Vehicle',
        icon = 'fa-solid fa-car',
        bones = 'bonnet',
        distance = 2.5,
        canInteract = function() 
            if not insideShop then return end
            local vehicle = lib.getClosestVehicle(GetEntityCoords(PlayerPedId()), 5, false)
            if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then 
                return true
            else
                return false
            end
            return exports['qb-policejob']:GetJobName("mechanic")
        end,
        onSelect = function(data)
            exports['qb-mechanicjob']:OpenMenu()
        end,
        }
    }
    exports.ox_target:addGlobalVehicle(options)
end) 

Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone('mechstoragee', vector3(-1418.3, -455.08, 35.91), 3.2, 1, {
        name='mechstoragee',
        heading=302,
        debugPoly=false,
        minZ=34.91,
        maxZ=37.51,
        }, {
            options = {
                {
                    icon = 'fas fa-box',
                    label = 'Mechanic Storage',
                    canInteract = function()
                        return exports['qb-policejob']:GetJobName("mechanic")
                    end,
                    action = function()
                        TriggerEvent("qb-mechanicjob:openStashOx")
                    end,
                },
            },
        distance = 2.0
    }) 
end)
