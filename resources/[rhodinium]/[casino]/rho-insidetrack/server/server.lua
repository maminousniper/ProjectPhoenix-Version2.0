
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("insidetrack:server:getbalance", function(source, cb)
    print("UIM ELL?")
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local chipAmount = exports.ox_inventory:GetItemCount(src, 'casino_goldchip')
    local minAmount = 100
    if chipAmount ~= nil then 
        if chipAmount >= minAmount then
            cb(chipAmount)
        else
            return TriggerClientEvent('QBCore:client:closeBetsNotEnough', src)
        end
    else
        return TriggerClientEvent('QBCore:client:closeBetsZeroChips', src)
    end
end)

RegisterServerEvent("insidetrack:server:placebet", function(bet)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local chipAmount = exports.ox_inventory:GetItemCount(src, 'casino_goldchip')
    if chipAmount ~= nil then 
        if chipAmount >= bet then
            Player.Functions.RemoveItem("casino_goldchip", bet)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['casino_goldchip'], "remove", bet)
            TriggerClientEvent('QBCore:Notify', src, "You placed a "..bet.." casino chips bet")
        else
            return TriggerClientEvent('QBCore:client:closeBetsNotEnough', src)
        end
    else
        return TriggerClientEvent('QBCore:client:closeBetsZeroChips', src)
    end
end) 

RegisterServerEvent("insidetrack:server:winnings", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        if Player.Functions.AddItem('casino_goldchip', amount, nil, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["casino_goldchip"], "add", amount)
            TriggerClientEvent('QBCore:Notify', src, "You Won "..amount.." casino chips!")
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
        end
    end
end) 

