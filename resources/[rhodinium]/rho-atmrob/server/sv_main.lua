local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('rho-atmrob:reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(3000, 4000)
    Player.Functions.AddMoney('cash', random)
end)


RegisterServerEvent("rho-atmrob:clrspawn")
AddEventHandler("rho-atmrob:clrspawn", function()
    TriggerClientEvent("rho-atmrob:clrspawn", -1)
end)

RegisterServerEvent("rho-atmrob:attro1")
AddEventHandler("rho-atmrob:attro1", function(pr1, pr2)
    TriggerClientEvent("rho-atmrob:attro1", -1, pr1, pr2)
end)

RegisterServerEvent("rho-atmrob:attro2")
AddEventHandler("rho-atmrob:attro2", function(dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
    TriggerClientEvent("rho-atmrob:attro2", -1, dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
end)

RegisterServerEvent("rho-atmrob:propas")
AddEventHandler("rho-atmrob:propas", function(psa)
    TriggerClientEvent("rho-atmrob:propas", -1, psa)
end)

RegisterServerEvent("rho-atmrob:deles")
AddEventHandler("rho-atmrob:deles", function(sda)
    TriggerClientEvent("rho-atmrob:deles", -1, sda)
end)

RegisterServerEvent("rho-atmrob:delesr")
AddEventHandler("rho-atmrob:delesr", function(rope)
    TriggerClientEvent("rho-atmrob:delesr", -1, rope)
end)

QBCore.Functions.CreateUseableItem(RHO.RopeItemName, function(source)
    TriggerClientEvent("rho-atmrob:policecheck", source)
end)

