QBCore = exports[Config['CoreName']]:GetCoreObject()

local ChoppedCarPlates = {}

RegisterServerEvent('chopshop:chopVehicle', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.AddItem(Config['ChopItem']['Name'],Config['ChopItem']['Amount'],false,info) then
        TriggerClientEvent('inventory:client:ItemBox', src, Config['ChopItem']['Name'], "add", Config['ChopItem']['Amount'])
    end
end)

RegisterServerEvent('chopshop:check', function(plaka, curVeh)
    local src = source
    if not ChoppedCarPlates[plaka] then
        table.insert(ChoppedCarPlates, plaka)
        TriggerClientEvent('chopshop:check:client', source, true, curVeh)
    else
        TriggerClientEvent('chopshop:check:client', source, false, curVeh)
        QBCore.Functions.Notify(src, 'This vehicle is already chopping.', 'error', 5000)
    end
end)

QBCore.Functions.CreateCallback('rho-chopshop-check-group', function(src, cb)
    local group = exports[Config['PhoneName']]:GetGroupByMembers(src)
    if group ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('rho-chopshop-startjobforgroup', function(veh, coord, randomveh, netid)
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local Stages = {
        [1] = {name = "Head to the location and steal the "..randomveh, isDone = false , id = 1},
        [2] = {name = "Head to the chopping location", isDone = false , id = 2},
        [3] = {name = "Chop the vehicle", isDone = false , id = 3},
        [4] = {name = "Leave the area and get back here", isDone = false , id = 4},
    }
    exports[Config['PhoneName']]:setJobStatus(groupID, "Chop Shop", Stages)
    
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    for i=1, #m do
        if m[i] then
            print(veh)
            TriggerClientEvent("rho-chopshop-jobstatus", m[i], veh, coord, randomveh, netid)
        end
    end
end)

RegisterServerEvent('rho-chopshop-getted-intothecar', function(randomveh)
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local Stages = {
        [1] = {name = "Head to the location and steal the "..randomveh, isDone = true , id = 1},
        [2] = {name = "Head to the chopping location", isDone = false , id = 2},
        [3] = {name = "Chop the vehicle", isDone = false , id = 3},
        [4] = {name = "Leave the area and get back here", isDone = false , id = 4},
    }
    exports[Config['PhoneName']]:setJobStatus(groupID, "Chop Shop", Stages)
    
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    for i=1, #m do
        if m[i] then
            TriggerClientEvent("rho-chopshop-gotothezone", m[i], randomveh)
        end
    end
end)

RegisterServerEvent('rho-chopshop-correctzone', function(randomveh)
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local Stages = {
        [1] = {name = "Head to the location and steal the "..randomveh, isDone = true , id = 1},
        [2] = {name = "Head to the chopping location", isDone = true , id = 2},
        [3] = {name = "Chop the vehicle", isDone = false , id = 3},
        [4] = {name = "Leave the area and get back here", isDone = false , id = 4},
    }
    exports[Config['PhoneName']]:setJobStatus(groupID, "Chop Shop", Stages)
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    for i=1, #m do
        if m[i] then
            TriggerClientEvent("rho-chopshop-can-chop", m[i], randomveh)
        end
    end
end)

RegisterServerEvent('rho-chopshop-delete', function()
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    for i=1, #m do
        if m[i] then
            TriggerClientEvent("rho-chopshop-delete-target", m[i])
        end
    end
end)

RegisterServerEvent('rho-chopshop-leave', function(randomveh, car)
    TriggerClientEvent('delete-car', -1, car)
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local Stages = {
        [1] = {name = "Head to the location and steal the "..randomveh, isDone = true , id = 1},
        [2] = {name = "Head to the chopping location", isDone = true , id = 2},
        [3] = {name = "Chop the vehicle", isDone = true , id = 3},
        [4] = {name = "Leave the area and get back here", isDone = false , id = 4},
    }
    exports[Config['PhoneName']]:setJobStatus(groupID, "Chop Shop", Stages)
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    for i=1, #m do
        if m[i] then
            TriggerClientEvent("rho-chopshop-getbackhere", m[i], randomveh)
        end
    end
end)

RegisterServerEvent('rho-chopshop-getrewards', function()
    local src = source
    local groupID = exports[Config['PhoneName']]:GetGroupByMembers(src)
    local m = exports[Config['PhoneName']]:getGroupMembers(groupID)
    if not m then return end
    exports[Config['PhoneName']]:NotifyGroup(groupID, 'Job finished, Good Job, this is your gift!', 'success')
    local random = math.random(2, 4)
    for i=1, #m do
        if m[i] then
            local user = QBCore.Functions.GetPlayer(m[i])
            user.Functions.AddItem(Config['MarkedBills']['Name'], Config['MarkedBills']['Amount'])
            TriggerClientEvent("rho-chopshop-clear", m[i])
        end
    end
    exports[Config['PhoneName']]:resetJobStatus(groupID) 
end)