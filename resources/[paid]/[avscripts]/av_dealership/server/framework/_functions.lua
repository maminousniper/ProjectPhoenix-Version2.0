-- Get Player ID by identifier
function getSourceByIdentifier(identifier)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then
            return Player.PlayerData.source
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            return xPlayer.source
        end
    end
    return false
end

function getPlayerByIdentifier(identifier)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if Player then
            return Player
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            return xPlayer
        end
    end
    return false
end

-- Get Player Permission Level
function getPermission(src, level)
    if Config.Framework == "QBCore" then
        if IsPlayerAceAllowed(src, level) or QBCore.Functions.HasPermission(src, level) then
            return true
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getGroup() == level
    else
        -- do your own permission check
        return false
    end
end

-- Get Player Identifier
function getIdentifier(src)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            return Player.PlayerData.citizenid
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            return xPlayer.identifier
        end
    end
    return false
end

-- Add Item to player
function addItem(src,item,amount,info)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.AddItem(item,amount,false,info) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
            return true
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.canCarryItem(item,amount) then
            xPlayer.addInventoryItem(item,amount,info)
            return true
        end
    end
    return false
end

function getMetadata(item,info)
    if item and item.info then
        return item.info, item.slot
    end
    if info and info.metadata then
        return info.metadata, info.slot
    end
end

-- Get Player Object
function getPlayer(src)
    if Config.Framework == "QBCore" then
        return QBCore.Functions.GetPlayer(src)
    elseif Config.Framework == "ESX" then
        return ESX.GetPlayerFromId(src)
    end
end

-- Get Player money
function getMoney(src, account)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.money[account]
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.getAccount(account) then
            return xPlayer.getAccount(account).money
        else
            return false
        end
    end
end

-- Add Money
function addMoney(src, account, amount)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney(account,amount)
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addAccountMoney(account,amount)
    end
end

-- Add Money to Offline Player
function addMoneyOffline(identifier, account, amount)
    if Config.Framework == "QBCore" then
        local result = MySQL.query.await('SELECT * FROM players WHERE citizenid = ?', {identifier})
        if result and result[1] then
            local RecieverMoney = json.decode(result[1].money)
            RecieverMoney[account] = (RecieverMoney[account] + amount)
            MySQL.update.await('UPDATE players SET money = ? WHERE citizenid = ?', {json.encode(RecieverMoney), identifier})
        end
    elseif Config.Framework == "ESX" then
        local result = MySQL.query.await('SELECT * FROM users WHERE identifier = ?', {identifier})
        if result and result[1] then
            local RecieverMoney = json.decode(result[1].accounts)
            RecieverMoney[account] = (RecieverMoney[account] + amount)
            MySQL.update.await('UPDATE users SET accounts = ? WHERE identifier = ?', {json.encode(RecieverMoney), identifier})
        end
    end
end

-- Remove money from player
function removeMoney(src, account, amount)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney(account,amount)
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeAccountMoney(account,amount)
    end
end

-- Get Player Job
function getJob(src)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.PlayerData.job
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        local job = xPlayer.getJob()
        local data = {
            name = job.name,
            grade = {
                level = tostring(job.grade),
                name = job.grade_label
            }
        }
        return data
    end
end

-- Get Player Name
function getName(src)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            return Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            return xPlayer.getName()
        end
    end
    return false
end

function setJob(target,job)
    target = tonumber(target)
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(target)
        if Player then
            Player.Functions.SetJob(job, 0)
            local jobData = QBCore.Shared.Jobs[job]['grades']['0']
            local info = {
                name = jobData['name'],
                onduty = true,
                isboss = false,
                payment = jobData['payment'],
                grade = {name = jobData['name'], level = 0}
            }
            MySQL.update.await('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(info),Player.PlayerData.citizenid})
            return true
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(target)
        if xPlayer then
            xPlayer.setJob(job,0)
            MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {job,0,xPlayer.identifier})
            return true
        end
    end
    return false
end

function setJobGrade(identifier,job,grade)
    if Config.Framework == "QBCore" then
        local Player = getPlayerByIdentifier(identifier)
        local jobData = QBCore.Shared.Jobs[job]['grades'][grade]
        if Player then
            Player.Functions.SetJob(job,grade)
        end
        local info = {
            name = job,
            onduty = true,
            isboss = jobData['isboss'],
            payment = jobData['payment'],
            grade = {name = jobData['name'], level = grade}
        }
        MySQL.update.await('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(info),identifier})
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            xPlayer.setJob(job,grade)
        end
        MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {job, grade, identifier})
    end
end

function fireOnlineEmployee(xTarget, jobName)
    if Config.Framework == "QBCore" then
        xTarget.Functions.SetJob(Config.Unemployed,0)
    elseif Config.Framework == "ESX" then
        xTarget.setJob(Config.Unemployed,0)
        MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {Config.Unemployed,0,xTarget.identifier})
    end
end

function fireOfflineEmployee(identifier, jobName)
    if Config.Framework == "QBCore" then
        local job = QBCore.Shared.Jobs[Config.Unemployed]
        local newJob = {
            name = Config.Unemployed,
            label = job['label'],
            isboss = false,
            payment = job['grades']['0']['payment'],
            grade = {name = job['grades']['0']['name'], level = 0}
        }
        MySQL.update.await('UPDATE players SET job = ? WHERE citizenid = ?', {json.encode(newJob),identifier})
    elseif Config.Framework == "ESX" then
        MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {Config.Unemployed, 0, identifier})
    end
end

function isBoss(source)
    if Config.Framework == 'QBCore' then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.PlayerData.job.isboss
    elseif Config.Framework == 'ESX' then
		local xPlayer = ESX.GetPlayerFromId(source)
		return (xPlayer.job.grade_name == "boss")
    end
    return false
end

function Discord(webhook, message)
    PerformHttpRequest(webhook, function() end, 'POST', json.encode({ username = 'AV Scripts', embeds = message}), { ['Content-Type'] = 'application/json' })
end

function getGrades(job)
    local options = {}
    if Config.Framework == "QBCore" then
        local jobData = QBCore.Shared.Jobs[job]['grades']
        for k, v in pairs(jobData) do
            options[#options+1] = {
                value = k,
                label = v['name']
            }
        end
    end
    if Config.Framework == "ESX" then
        local res = MySQL.query.await('SELECT * FROM job_grades WHERE job_name = ?', {job})
        for k, v in pairs(res) do
            options[#options+1] = {value = tostring(v['grade']), label = tostring(v['label'])}
        end
    end
    return options
end

function getPhone(source)
    local phone = ""
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            phone = Player.PlayerData.charinfo.phone 
        end
    elseif Config.Framework == "ESX" then
        -- Add your get phone function here to retrieve a player phone number
    end
    return phone
end

function Round(value, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

function isFinanced(plates)
    if plates and type(plates) == "string" then
        local exists = MySQL.single.await('SELECT * FROM `av_financing` WHERE plates = ?', {
            plates
        })
        if exists then
            return true
        end
        return false
    end
    print("^1[ERROR] export isFinanced() received null as argument, expected string (plates)^7")
    print("^1[ERROR] export isFinanced() received null as argument, expected string (plates)^7")
    print("^1[ERROR] export isFinanced() received null as argument, expected string (plates)^7")
    return false
end

exports("isFinanced", isFinanced)