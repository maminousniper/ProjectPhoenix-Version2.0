if Config.Framework == 'QBCore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'ESX' then
    ESXItems = {}
end

lib.callback.register('av_restaurant:getItems', function(source, data)
    local job = GetJob(source)
    local items = MySQL.query.await('SELECT * FROM av_items WHERE job = ? AND type = ?', {job, data['type']})
    return items
end)

function registerItem(src, item)
    if not isBoss(src) then return end
    local job = GetJob(src)
    local name = item['name']:gsub("[%c%p%s]", "")
    name = string.lower(name)
    local label = item['name']
    local type = item['type']
    local image = item['image']
    local description = item['description']
    local ingredients = item['ingredients']
    if ingredients then
        ingredients = json.encode(ingredients)
    end
    local matches = MySQL.query.await("SELECT name FROM av_items WHERE name = ?", {name})
    local weight = Config.ItemsWeight[type] or Config.DefaultItemWeight
    local prop = item['prop'] or false
    if not matches[1] and not VerifyItem(name) then
        MySQL.insert('INSERT INTO av_items (job, name, label, type, image, description, weight, ingredients, prop) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            job, name, label, type, image, description, weight, ingredients, prop
        }, function(res)
            if res then
                if Config.Framework == 'QBCore' then
                    TriggerEvent('av_restaurant:QBItem',{name = name, label = label, weight = weight, image = image, description = description})
                    if Config.Framework == "ox_inventory" then
                        TriggerClientEvent('av_laptop:notificationUI',src,Lang['ESX_Restart'],"warning",Lang['app_title'])
                    else
                        TriggerClientEvent('av_laptop:notificationUI',src,Lang['item_added'],"success",Lang['app_title'])
                    end
                elseif Config.Framework == 'ESX' then
                    TriggerClientEvent('av_laptop:notificationUI',src,Lang['ESX_Restart'],"warning",Lang['app_title'])
                end
                TriggerEvent('inventory:refresh')
                RegisterItem(name,type)
            end
        end)
    else
        TriggerClientEvent('av_laptop:notificationUI',src,Lang['item_duplicated'],"error",Lang['app_title'])
    end
end

RegisterServerEvent('av_restaurant:craftEnd')
AddEventHandler('av_restaurant:craftEnd', function(job,item,type,ingredients,image,label,prop)
    local src = source
    local job = GetJob(src)
    local info = {
        type = type,
        ingredients = ingredients,
        prop = prop
    }
    if type == "box" then
        info['serial'] = randomString(10)
    end
    if item and job then
        if Config.UseIngredients and ingredients then
            local hasIngredients = 0
            local totalIngredients = #ingredients
            for k, v in pairs(ingredients) do
                if not hasItem(src,v) then
                    TriggerClientEvent('av_restaurant:notification',src,Lang['missing_ingredients'])
                    return
                end
                hasIngredients += 1
            end
            if hasIngredients >= totalIngredients then
                for k, v in pairs(ingredients) do
                    removeItem(src, v, 1)
                end
            end
        end
        if Config.Framework == 'ESX' then
            if ESXItems[item] then
                AddItem(src,item,1,info)
            else
                TriggerClientEvent('av_restaurant:notification',src,Lang['ESX_Restart'])
            end
        else
            AddItem(src,item,1,info)
        end
        addDish(job, item, image, label)
    end
end)

RegisterServerEvent("av_restaurants:updatePlayer", function(field, value)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.SetMetaData(field, value)
    TriggerClientEvent('hud:client:UpdateNeeds', src, value, Player.PlayerData.metadata[field])
end)

function randomString(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomString = ""
    local charsetLength = string.len(charset)

    for i = 1, length do
        local randomIndex = math.random(1, charsetLength)
        randomString = randomString .. string.sub(charset, randomIndex, randomIndex)
    end

    return randomString
end