
if GetResourceState("qs-inventory") ~= "started" then return end

Inventory = exports['qs-inventory']

function AddItem(src, item, count, metadata)
    Inventory:AddItem(src, item, count, nil, metadata)
end

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, slot, metadata)
end

function HaveItem(src, item)
    local result = Inventory:GetItemTotalAmount(src, item) >= 1
    return result
end

if Config.Framework == 'qb-core' then
    function GetItemMetadata(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            local inventoryItem = exports['qs-inventory']:GetItemBySlot(source, item.slot)
            if inventoryItem and inventoryItem.name:lower() == item.name:lower() then
                return inventoryItem.info
            end
        end
        return nil
    end

    exports['qs-inventory']:CreateUsableItem(Config.ItemsName['photo'], function(source, item)
        local metadata = GetItemMetadata(source, item)
        if metadata ~= nil then
            local slot = item.slot
            local photo = metadata.photo
            TriggerClientEvent('dx_polaroid:client:photoMenu', src, {
				img = photo.img,
				date = photo.date,
				msg = photo.msg,
				slot = slot,
			})
        end
    end)
end

if Config.Framework == 'esx' then
    function GetItemMetadata(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local inventoryItem = exports['qs-inventory']:GetItemBySlot(source, item.slot)
            if inventoryItem and inventoryItem.name:lower() == item.name:lower() then
                return inventoryItem.info
            end
        end
        return nil
    end

    exports['qs-inventory']:CreateUsableItem(Config.ItemsName['photo'], function(source, item)
        local metadata = GetItemMetadata(source, item)
        if metadata ~= nil then
            local slot = item.slot
            local photo = metadata.photo
            TriggerClientEvent('dx_polaroid:client:photoMenu', src, {
				img = photo.img,
				date = photo.date,
				msg = photo.msg,
				slot = slot,
			})
        end
    end)
end