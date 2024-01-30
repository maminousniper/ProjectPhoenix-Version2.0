ESX, QBCore = nil, nil
adminWebhook = "Your_Webhook_Goes_Here"

CreateThread(function()
    if Config.Framework == "ESX" then
        ESX = exports['es_extended']:getSharedObject()
    end
    if Config.Framework == "QBCore" then
        QBCore = exports['qb-core']:GetCoreObject()
    end
    RegisterCommand("veh_data", function(source,args)
        local src = source
        if getPermission(src, Config.AdminPermission) then
            local model = args[1]
            TriggerClientEvent("av_dealership:veh_data", src, model)
        else
            TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['no_permission'],"error")
        end
    end)
    RegisterCommand(Config.AdminCommand, function(source,_)
        local src = source
        if getPermission(src, Config.AdminPermission) then
            TriggerClientEvent("av_dealership:adminPanel", src)
        else
            TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['no_permission'],"error")
        end
    end)
end)

lib.callback.register('av_dealership:GetESXJobs', function(source)
    local list = {}
    local jobs = ESX.GetJobs()
    for k, v in pairs(jobs) do
        list[#list+1] = {
            value = v['name'],
            label = v['label']
        }
    end
    return list
end)
