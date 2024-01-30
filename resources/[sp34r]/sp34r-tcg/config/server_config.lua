ESX, QBCore = nil

Citizen.CreateThread(function()
	if Config.Framework == 'esx' then
		ESX = exports['es_extended']:getSharedObject()
	
		ESX.RegisterUsableItem('binder', function(src)
			local binder = getCards(src)
			TriggerClientEvent("dx_tcg:client:openBinder", src, binder)
		end)
	
		ESX.RegisterUsableItem('tcgpack', function(src)
			-- RemoveItem(src, 'tcgpack', 1)
			local Player = ESX.GetPlayerFromId(src)

			if Player == nil then
				return
			end

			Player.removeInventoryItem('tcgpack', 1)
			
			TriggerClientEvent("dx_tcg:client:openPack", src, 'season1')
		end)
	
		function GetIdentifier(src)
			local Player = ESX.GetPlayerFromId(src)
			return Player and Player.identifier or nil
		end

	elseif Config.Framework == 'qbcore' then
		QBCore = exports['qb-core']:GetCoreObject()

		QBCore.Functions.CreateUseableItem('binder', function(src)
			local binder = getCards(src)
			TriggerClientEvent("dx_tcg:client:openBinder", src, binder)
		end)

		QBCore.Functions.CreateUseableItem('tcgpack', function(src)
			RemoveItem(src, 'tcgpack', 1)
			TriggerClientEvent("dx_tcg:client:openPack", src, 'season1')
		end)

		function GetIdentifier(src)
			local Player = QBCore.Functions.GetPlayer(src)
			return Player and Player.PlayerData.citizenid or nil
		end

	end
end)
