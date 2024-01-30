local WebHooks = "" -- add your webhook url
QBCore = nil
ESX = nil
QS = nil
CreateThread(function()
    if Config.Core == "ESX" and Config.Inventory == "qs" then
        TriggerEvent('qs-core:getSharedObject', function(library) QS = library end) 
    end
end)

if Config.Core == "QBCore" then
    TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    end
elseif Config.Core == "ESX" then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    if ESX == nil then
        ESX = exports[Config.CoreFolderName]:getSharedObject()
    end
end

function ShowNotification(source, msg, type)
    if Config.Core =="QBCore" and Config.Notify['QBCore'] then
        TriggerClientEvent(Config.Core..':Notify', source, msg, type)
    elseif Config.Notify['okokNotify'] then
        TriggerClientEvent('okokNotify:Alert', source, Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = msg,
            type = type,
            timeout = 5000,
            layout = Config.pNotifyLayout
        })
    elseif Config.Core =="ESX" and Config.Notify['ESX'] then
        TriggerClientEvent('esx:showNotification', source, msg)
    end
end

CreateCallback("snipe-beekeeping:server:hasItem", function(source, cb, item)
    local src = source
    local retval = HasItem(src, item)
    cb(retval)
end)

function GetPlayerIdentifer(source)
    if Config.Core == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.PlayerData.citizenid
    elseif Config.Core == "ESX" then
        local player = ESX.GetPlayerFromId(source)
        local identifier = player.identifier
        return identifier
    end
end


CreateCallback("snipe-beekeeping:server:canOpenBeehive", function(source, cb, citizenid)
    local identifier = GetPlayerIdentifer(source)
    cb(identifier == citizenid)
end)


function SendLogs(src, title, message)
    local colorcode = 5763719
    if title == "Beehive removed" then
        colorcode = 16711680
    end
    local description = ""
    if src == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(src).."** ("..src..")\n"..message
    end
    local embedData = {
        {
            ["title"] = "Beehive Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
                ["name"] = 'Snipe Beehive Logs',
            },
        }
    }
    PerformHttpRequest(WebHooks, function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end