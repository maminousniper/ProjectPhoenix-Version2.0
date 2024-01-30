local QBCore = exports['qb-core']:GetCoreObject()

NoVPN = {}
CreateThread(function ()
    for _, v in pairs(Config.JobCenter) do
        if v.vpn == false then
            NoVPN[#NoVPN+1] = v
        end
    end
end)

RegisterNUICallback('GetJobCentersJobs', function(data, cb)
    local result = QBCore.Functions.HasItem("vpn", 1)
    if result then
        cb(Config.JobCenter)
    else
        cb(NoVPN)
    end
end)

RegisterNUICallback('CasinoPhoneJobCenter', function(data)
    TriggerEvent(data.event)
end)

RegisterNetEvent('qb-phone:jobcenter:tow', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set',
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(-191.48, -1158.67)
end)

RegisterNetEvent('qb-phone:jobcenter:fish', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set',
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(-335.15, 6105.79)
end)

RegisterNetEvent('qb-phone:jobcenter:postop', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set', 
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(1197.04, -3253.67) 
end)

RegisterNetEvent('qb-phone:jobcenter:chopshop', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set', 
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(354.34, -796.96) 
end)

RegisterNetEvent('qb-phone:jobcenter:sanitation', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set',
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(-353.53, -1545.81)
end)

RegisterNetEvent('qb-phone:jobcenter:pdimpound', function()
    TriggerEvent('qb-phone:client:CustomNotification',
        'JOB CENTER',
        'GPS Waypoint Set',
        'fas fa-briefcase',
        '#2496f2',
        5000
    )
    SetNewWaypoint(442.05, -1013.97)
end)