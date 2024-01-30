QBCore, ESX = nil, nil
if Config.Core == "QBCore" then
	QBCore = exports[Config.CoreFolderName]:GetCoreObject()
	lib.hideTextUI()
	Citizen.CreateThread(function()
		while QBCore == nil do
			TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
			Citizen.Wait(200)
		end
	end)
elseif Config.Core == "ESX" then
	ESX = exports[Config.CoreFolderName]:getSharedObject()
end


RegisterNetEvent(Config.PlayerLoadedEvent)
AddEventHandler(Config.PlayerLoadedEvent, function()
    local p = promise.new()
    TriggerCallback('snipe-beekeeping:server:getTables', function(tabledata)
		p:resolve(tabledata)
    end)

    BeehiveTable = Citizen.Await(p)
	isSpawned = true
end)

RegisterNetEvent(Config.PlayerUnloadEvent)
AddEventHandler(Config.PlayerUnloadEvent, function()
	isSpawned = false
    if BeehiveTable then
		for k, v in pairs(BeehiveTable) do
			DeleteEntity(v.obj)
			v.obj = nil
		end
	end
end)

local BeeHiveProps = {`beehive_closed`, `beehive_open`}

CreateThread(function()
    exports[Config.Target]:AddTargetModel(BeeHiveProps, {
        options = {
            {
                event = "snipe-beekeeping:client:OpenOptions",
                icon = "fas fa-circle", 
                label =  "Beehive", 
            },
        },
        distance = 1.0
    })
end)


function ShowNotification(msg, type)
    if Config.Core =="QBCore" and Config.Notify['QBCore'] then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify['okokNotify'] then
        exports['okokNotify']:Alert(Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        exports.pNotify:SendNotification({text = msg, type = type, layout = Config.pNotifyLayout, timeout = 5000})
    elseif Config.Core =="ESX" and Config.Notify['ESX'] then
        ESX.ShowNotification(msg)
    
    end
end

RegisterNetEvent("snipe-beekeeping:client:OpenOptions")
AddEventHandler("snipe-beekeeping:client:OpenOptions", function(data)
    
    local index = 0
	if BeehiveTable then
		for k, v in ipairs(BeehiveTable) do
			if v.obj == data.entity then
                if Config.OnlyOwnerCanCheckBeehive then
                    local p = promise.new()
                    TriggerCallback("snipe-beekeeping:server:canOpenBeehive", function(result)
                        p:resolve(result)
                    end, v.citizenid)
                    local result = Citizen.Await(p)
                    
                    if result then
                        index = k
                        OpenOptions(v, index)
                    else
                        ShowNotification(Config.Locale["not_your_beehive"])
                    end
                else
                    index = k
                    OpenOptions(v, index)
                end
			end
		end
	end
end)
