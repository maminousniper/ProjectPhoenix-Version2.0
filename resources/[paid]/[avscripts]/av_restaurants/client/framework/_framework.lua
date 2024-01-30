if Config.Framework == 'QBCore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

function EatDrink(type, ingredients)
    if type == 'food' then
        local value = Config.EatValue
        if ingredients and Config.MultiplyValuePerIngedient then
            value = value * #ingredients
        end
        if Config.Framework == 'QBCore' then
            TriggerServerEvent("av_restaurants:updatePlayer", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + value)
        elseif Config.Framework == 'ESX' then
            TriggerEvent('esx_status:add','hunger',value * 5000)
        end
    elseif type == 'drink' then
        local value = Config.DrinkValue
        if ingredients and Config.MultiplyValuePerIngedient then
            value = value * #ingredients
        end
        if Config.Framework == 'QBCore' then
            TriggerServerEvent("av_restaurants:updatePlayer", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + value)
        elseif Config.Framework == 'ESX' then
            TriggerEvent('esx_status:add','thirst',value * 5000)
        end
    elseif type == 'joint' then
        local value = Config.JointValue
        if ingredients and Config.MultiplyValuePerIngedient then
            value = value * #ingredients
        end
        if Config.Framework == 'QBCore' then
            TriggerServerEvent('hud:server:RelieveStress', value)
        elseif Config.Framework == 'ESX' then
        -- ESX Status doesn't have any stress event (?)
        end
    end
end

RegisterNetEvent('av_restaurant:notification')
AddEventHandler('av_restaurant:notification', function(msg)
    lib.notify({
        title = 'Restaurants',
        description = msg,
        type = 'inform'
    })
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if Config.Framework == 'QBCore' then
            for k, v in pairs(QBCore.Shared.Jobs) do
                jobList[#jobList+1] = k
            end
        elseif Config.Framework == 'ESX' then
            local data = lib.callback.await('av_restaurant:GetESXJobs', 1000)
            for k, v in pairs(data) do
                jobList[#jobList+1] = k
            end
        end
    end
end)