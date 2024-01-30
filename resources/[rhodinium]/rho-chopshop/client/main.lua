jobstarted = false
local bliptable = {}
local ChopShopPed = nil
local selectedvehicle = nil
vehicletable = {
    'Sultan',
    'FQ2',
    'Cavalcade',
    'Asea',
    'Primo',
    'Intruder',
    'Fugitive',
    'Premier',
    'Emperor',
    'Serrano',
    'Seminole',
    'Habanero',
    'RancherXL',
}

vehiclecoord = {
    vector4(176.85, 483.71, 142.26, 351.07),
    vector4(-1092.48, 438.7, 75.29, 258.31),
    vector4(-1152.27, -1565.11, 4.38, 30.1),
    vector4(1368.86, 1148.69, 113.76, 29.44),
    vector4(-132.92, 616.43, 205.68, 143.35),
    vector4(-1021.88, 810.17, 171.95, 212.76)
}
QBCore = exports[Config['CoreName']]:GetCoreObject()

local function checkDist()
    if #(GetEntityCoords(PlayerPedId()) - vector3(354.34, -796.96, 29.3)) < 10 and QBCore.Functions.HasItem(Config['vpnItem'], 1) then
        return true
    end
    return false
end

local function startJob()
    QBCore.Functions.TriggerCallback('rho-chopshop-check-group', function(cb)
        if cb then
            local label = 'Car'
            exports.ox_target:removeLocalEntity(ChopShopPed, 'Get Task')
            local randomveh = vehicletable[math.random(1, #vehicletable)]
            local randomcoord = vehiclecoord[math.random(1, #vehiclecoord)]
            QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
                local veh = NetToVeh(netId)
                SetEntityHeading(veh, randomcoord.w)
                exports[Config['FuelSystemName']]:SetFuel(veh, 100.0)
                SetVehicleFixed(veh)
                SetVehicleDoorsLocked(veh, 2)
                SetEntityAsMissionEntity(veh, true, true)
                local vehiclelable = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                label = GetLabelText(vehiclelable)
                TriggerServerEvent('rho-chopshop-startjobforgroup', veh, randomcoord, label, netId)
            end, randomveh, randomcoord, false)
        else
            QBCore.Functions.Notify('You need to create a group!', 'error', 5000)
        end
    end)
end

CreateThread(function()
    while not HasModelLoaded('a_m_m_soucent_04') do
        RequestModel('a_m_m_soucent_04')
        Wait(10)
    end
    while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        RequestAnimDict("mini@strip_club@idles@bouncer@base")
        Wait(10)
    end

    ChopShopPed = CreatePed(1, 'a_m_m_soucent_04', 354.34, -796.96, 28.3, 301.2, true, true)
    FreezeEntityPosition(ChopShopPed, true)
    SetEntityInvincible(ChopShopPed, true)
    SetBlockingOfNonTemporaryEvents(ChopShopPed, true)
    TaskPlayAnim(ChopShopPed, "mini@strip_club@idles@bouncer@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

    exports[Config['TargetName']]:AddTargetEntity(ChopShopPed, {
        options = {
            {
                label = 'Get Task',
                icon = 'fas fa-tasks',
                action = function()
                    startJob()
                end,
                canInteract = function()
                    return not IsEntityDead(PlayerPedId()) and checkDist()
                end
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent('rho-chopshop-jobstatus', function(veh, coord, randomveh, netid)
    jobstarted = true
    for _,v in pairs(bliptable) do
        RemoveBlip(v)
    end
    ChopBlip(coord.x, coord.y, coord.z)
    selectedvehicle = veh
    
    local function whilefunc() 
        while true do 
            Wait(10)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if IsPedInAnyVehicle(PlayerPedId(), false) and veh then
                if NetworkGetNetworkIdFromEntity(veh) == netid then
                    local retval = GetPedInVehicleSeat(veh, -1)
                    if retval then
                        TriggerServerEvent('rho-chopshop-getted-intothecar', randomveh)
                        return
                    end
                end
            end
        end
    end CreateThread(whilefunc)
end)

RegisterNetEvent('rho-chopshop-gotothezone', function(randomveh)
    for _,v in pairs(bliptable) do
        RemoveBlip(v)
    end
    ChopBlip2(-526.04, -1716.19, 473, 1, 0.7, 'Chop Shop')
    local function whilefunc2() 
        while true do 
            Wait(50)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if IsPedInAnyVehicle(PlayerPedId(), false) and veh then
                local retval = GetPedInVehicleSeat(veh, -1)
                if retval then
                    if #(GetEntityCoords(PlayerPedId()) - vector3(-550.57, -1704.4, 19.04)) < 7 then
                        TriggerServerEvent('rho-chopshop-correctzone', randomveh)
                        return
                    end
                end
            end
        end
    end CreateThread(whilefunc2)
end)

local asdf = 'Car'
RegisterNetEvent('rho-chopshop-can-chop', function(randomveh)
    for _,v in pairs(bliptable) do
        RemoveBlip(v)
    end
    
    exports[Config['TargetName']]:AddGlobalVehicle({
		options = {
            {
                label = 'Chop Vehicle',
                icon = 'fas fa-boxes',
                action = function() 
                    asdf = randomveh
                    local coordA = GetEntityCoords(PlayerPedId(), 1)
                    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
                    local curVeh = getVehicleInDirection(coordA, coordB)
                    if curVeh == 0 or curVeh == nil then return end
                    TriggerServerEvent('rho-chopshop-delete')
                    TriggerServerEvent('chopshop:check', GetVehicleNumberPlateText(curVeh), curVeh)
                end
            }
		},
		distance = 2.5,
	})
end)

RegisterNetEvent('rho-chopshop-delete-target', function()
    exports.ox_target:removeGlobalVehicle('Chop Vehicle')
end)

RegisterNetEvent('rho-chopshop-finished', function(vehicle)
    TriggerServerEvent('rho-chopshop-leave', asdf, vehicle)
end)

RegisterNetEvent('rho-chopshop-getbackhere', function(randomveh)
    ChopBlip2(354.34, -796.96, 126, 1, 0.7, 'Heated Bro')

    exports[Config['TargetName']]:AddTargetEntity(ChopShopPed, {
        options = {
            {
                label = 'Get Rewards',
                icon = 'fas fa-tasks',
                action = function()
                    TriggerServerEvent('rho-chopshop-getrewards')
                    exports.ox_target:removeLocalEntity(ChopShopPed, 'Get Rewards')
                end,
                canInteract = function()
                    return not IsEntityDead(PlayerPedId()) and checkDist()
                end
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent('rho-chopshop-clear', function()
    for _,v in pairs(bliptable) do
        RemoveBlip(v)
    end
    exports.ox_target:removeLocalEntity(ChopShopPed, 'Get Rewards')
    jobstarted = false
    selectedvehicle = nil

    exports[Config['TargetName']]:AddTargetEntity(ChopShopPed, {
        options = {
            {
                label = 'Get Task',
                icon = 'fas fa-tasks',
                action = function()
                    startJob()
                end,
                canInteract = function()
                    return not IsEntityDead(PlayerPedId()) and checkDist()
                end
            }
        },
        distance = 2.0
    })
end)

function ChopBlip(x, y, z)
    local blip = AddBlipForRadius(x, y, z, 150.0)
    SetBlipColour(blip, 3)
    SetBlipAlpha(blip, 130)
    SetBlipAsShortRange(blip, true)
    table.insert(bliptable, blip)
end

function ChopBlip2(x, y, sprite, colour, scale, text)
    local blip = AddBlipForCoord(x, y)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
    table.insert(bliptable, blip)
end