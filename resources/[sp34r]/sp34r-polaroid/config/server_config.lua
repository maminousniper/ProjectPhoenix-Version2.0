
ServerConfig = {}

ServerConfig.DiscordWebHook = 'https://discord.com/api/webhooks/970480716183920680/xYJvU6295ISemqHgHYgS-mBJHm74bsfdKENSCWHNw_rCYgeeB9kEH5_NuojQW6ofajII'  --DISCORD WEBHOOK URL

Citizen.CreateThread(function()
	
	lib.callback.register('dx_polaroid:server:getWebhook', function()
		return ServerConfig.DiscordWebHook
	end)

	lib.callback.register('dx_polaroid:ui:haveitem', function(source, item)
		return HaveItem(source, item)
	end)

    if Config.Framework == 'esx' then
		ESX = exports['es_extended']:getSharedObject()

		ESX.RegisterUsableItem(Config.ItemsName['album'], function(src)
			local album = getCurrentAlbum(src)
            TriggerClientEvent("dx_polaroid:client:openAlbum", src, album)
        end)

		if not Config.UseQsInventory then -- If qs-inventory is not started
			ESX.RegisterUsableItem(Config.ItemsName['photo'], function(src, item, metadata)
				local photo = metadata.metadata.photo
				local slot = metadata.slot
				TriggerClientEvent('dx_polaroid:client:photoMenu', src, {
					img = photo.img,
					date = photo.date,
					msg = photo.msg,
					slot = slot,
				})
			end)
		end

        ESX.RegisterUsableItem(Config.ItemsName['polaroid'], function(src)
            TriggerClientEvent("dx_polaroid:client:openPolaroid", src)
        end)

		ESX.RegisterUsableItem(Config.ItemsName['printerpolaroid'], function(src)
			TriggerClientEvent("dx_polaroid:client:openPrinter", src)
        end)

		function GetIdentifier(src)
			local Player = ESX.GetPlayerFromId(src)
			return Player and Player.identifier or nil
		end

    elseif Config.Framework == 'qbcore' then

        QBCore = exports['qb-core']:GetCoreObject()

		QBCore.Functions.CreateUseableItem(Config.ItemsName['album'], function(src)
			local album = getCurrentAlbum(src)
			TriggerClientEvent("dx_polaroid:client:openAlbum", src, album)
		end)

		if not Config.UseQsInventory then -- If qs-inventory is not started
			QBCore.Functions.CreateUseableItem(Config.ItemsName['photo'], function(src, item)
				local photo = Config.UseOxInventory and item.metadata.photo or item.info.photo
				local slot = item.slot
				TriggerClientEvent('dx_polaroid:client:photoMenu', src, {
					img = photo.img,
					date = photo.date,
					msg = photo.msg,
					slot = slot,
				})
			end)
		end

        QBCore.Functions.CreateUseableItem(Config.ItemsName['polaroid'], function(src)
			TriggerClientEvent("dx_polaroid:client:openPolaroid", src)
		end)

		QBCore.Functions.CreateUseableItem(Config.ItemsName['printerpolaroid'], function(src)
			TriggerClientEvent("dx_polaroid:client:openPrinter", src)
		end)

		function GetIdentifier(src)
			local Player = QBCore.Functions.GetPlayer(src)
			return Player and Player.PlayerData.citizenid or nil
		end
    end
end)
