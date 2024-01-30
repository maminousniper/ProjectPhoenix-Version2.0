allJobs = {}

CreateThread(function()
    if Config.Framework == "ESX" then
        ESX = exports['es_extended']:getSharedObject()
    end
    if Config.Framework == "QBCore" then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    for k, v in pairs(QBCore.Shared.Jobs) do
        allJobs[#allJobs+1] = {
            value = k,
            label = v['label']
        }
    end
    init()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    Wait(2000)
    ESXJobs()
    init()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if Config.Framework == 'QBCore' then
            while not QBCore do
                Wait(100)
            end
            for k, v in pairs(QBCore.Shared.Jobs) do
                allJobs[#allJobs+1] = {
                    value = k,
                    label = v['label']
                }
            end
        elseif Config.Framework == 'ESX' then
            ESXJobs()
        end
    end
end)

function ESXJobs()
    lib.callback('av_dealership:GetESXJobs', false, function(data)
        for k, v in pairs(data) do
            allJobs[#allJobs+1] = v
        end
    end)
end

local radar = true
CreateThread(function()
    while true do
        if inMenu and radar then
            radar = false
            DisplayRadar(radar)
            TriggerEvent('hide_hud_event')
        end
        if not inMenu and not radar then
            radar = true
            DisplayRadar(radar)
            TriggerEvent('display_hud_event')
        end
        Wait(2000)
    end
end)