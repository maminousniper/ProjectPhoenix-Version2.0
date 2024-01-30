local QBCore = exports[Config.CoreName]:GetCoreObject()
local props = {
	['prop_micro_01'] = {item = 'stolenmicro'},
	['prop_coffee_mac_02'] = {item = 'stolencoffee'},
}

local x,y,z
local started = false


QBCore.Functions.CreateCallback('qb-houserobbery:server:GetCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if (v.PlayerData.job.type == Config.PoliceJobType) and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		num = math.random(111,999)
		started = true
	end
end)



-- Functions
local function ResetHouseStateTimer(house)
    local num = Config.ResetHouseTimer
    local time = tonumber(num)
    SetTimeout(time, function()
		Config.Houses[house].Opened = false
        Config.Houses[house].Robbed = false
        TriggerClientEvent('qb-houserobbery:client:cleanHouseStatus', -1, house, Config.Houses[house].Opened, Config.Houses[house].Robbed)
    end)
end

RegisterNetEvent('qb-houserobbery:server:policeCloseDoor', function(house)
	Config.Houses[house].Opened = false
	Config.Houses[house].Robbed = false
	TriggerClientEvent('qb-houserobbery:client:cleanHouseStatus', -1, house, Config.Houses[house].Opened, Config.Houses[house].Robbed)
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-houserobbery:server:GetHouseConfig', function(_, cb)
    cb(Config.Houses)
end)

QBCore.Functions.CreateCallback('qb-houserobbery:server:RobbedHoused', function(_, cb, houseid)
	if Config.Houses[houseid].Robbed then
		cb(true)
	else
		cb(false)
	end
end)

QBCore.Functions.CreateCallback('qb-houserobbery:server:interiorRobbed', function(_, cb, houseid)
	for i = 1, #Config.Houses[houseid].Items do
		if Config.Houses[houseid].Items[i].robbed then
			cb(i)
		end
	end
end)

-- Events

RegisterNetEvent('qb-houserobbery:server:noiseLevel', function(houseId, level)
	Config.Houses[houseId].NoiseLevel = level
	if Config.Houses[houseId].NoiseLevel > 100 then
		Config.Houses[houseId].alarmTriggered = true
	end
	TriggerClientEvent('qb-houserobbery:client:noiseLevel', -1, houseId, level)
end)

RegisterNetEvent('qb-houserobbery:server:updateInterior', function(house, i, delete)
	Config.Houses[house].Items[i].robbed = true
	TriggerClientEvent('qb-houserobbery:client:updateInterior', -1, house, i, delete)
end)

RegisterNetEvent('qb-houserobbery:server:updateInteriorSafeFailed', function(house, i, delete)
	Config.Houses[house].Items[i].robbed = false
	TriggerClientEvent('qb-houserobbery:client:updateInteriorSafeFailed', -1, house, i, delete)
end)

RegisterNetEvent('qb-houserobbery:server:interiorItems', function(house, coords, items, objects)
	if Config.Houses[house].InteriorCoords == nil and not next(Config.Houses[house].Items) and not next(Config.Houses[house].InteriorObjects) then
		Config.Houses[house].InteriorCoords = coords
		Config.Houses[house].Items = items
		Config.Houses[house].InteriorObjects = objects
		TriggerClientEvent('qb-houserobbery:client:interiorItems', -1, house, coords, items, objects)
	end
end)


RegisterNetEvent('qb-houserobbery:server:enterHouse', function(house)
    local src = source
	Config.Houses[house].Opened = true
	TriggerClientEvent('qb-houserobbery:client:enterHouse', src)
	TriggerClientEvent('qb-houserobbery:client:updateOpenStatus', -1, house, Config.Houses[house].Opened)
end)

RegisterNetEvent('qb-houserobbery:server:robHouseStatus', function(house)
    local src = source
	if not house then return end
    if not Config.Houses[house].Robbed then
        ResetHouseStateTimer(house)
    end
	Config.Houses[house].Robbed = true
	TriggerClientEvent('qb-houserobbery:client:updateRobStatus', -1, house)
end)

RegisterNetEvent('qb-houserobbery:server:breakLockpick', function(itemName)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.Functions.RemoveItem(itemName, 1) then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[itemName], "remove")
    end
end)

RegisterServerEvent('qb-houserobbery:item', function(itemReward)
	local src = source
	local player = QBCore.Functions.GetPlayer(src)
	if itemReward == 'random' then
		local lucky = math.random(1,#Config.ItemsReward)
		local items = Config.ItemsReward[lucky]
		for i = 1, #items do
			if items[i].type == 'item' then
 				player.Functions.AddItem(items[i].itemName, items[i].itemQty)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[items[i].itemName], "add", items[i].itemQty)
			elseif items[i].type == 'cash' then
				player.Functions.AddMoney("cash", items[i].itemQty)
				TriggerClientEvent('QBCore:Notify', src, Config.Lang['money_found']..items[i].itemQty, "success")
			end
		end
	elseif itemReward == 'safe' then
 		local lucky = math.random(1,#Config.SafeRewards)
		local items = Config.SafeRewards[lucky]
		for i = 1, #items do
			if items[i].type == 'item' then
 				player.Functions.AddItem(items[i].name, items[i].amount)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[items[i].name], "add")
			elseif items[i].type == 'cash' then
 				player.Functions.AddMoney("cash", items[i].amount)
				TriggerClientEvent('QBCore:Notify', src, Config.Lang['money_found']..items[i].amount, "success")
			 end
		end
	elseif itemReward == 'tv' then
 		player.Functions.AddItem('stolentv', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stolentv'], "add", 1)
	elseif itemReward == 'telescope' then
 		player.Functions.AddItem('stolenscope', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stolenscope'], "add", 1)
	elseif itemReward == 'art' then
 		player.Functions.AddItem('stolenart', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stolenart'], "add", 1)
	elseif itemReward == 'laptop' then
		player.Functions.AddItem('stolenlaptop', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stolenlaptop'], "add", 1)
	else
 		local item = props[itemReward].item
		player.Functions.AddItem(item, 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
	end
end)

QBCore.Functions.CreateUseableItem(Config.LockpickItem, function(source)
    TriggerClientEvent("qb-houserobbery:client:openDoor", source)
end)




