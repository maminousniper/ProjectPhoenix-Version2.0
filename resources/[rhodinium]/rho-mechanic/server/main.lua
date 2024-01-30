-----------------------
----   Variables   ----
-----------------------
local QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

-----------------------
---- Server Events ----
-----------------------

local function getCategoryIndexById(id, list)
    for a,b in next, list do
        if b.id == tonumber(id) then
            return a
        end
    end
end

RegisterNetEvent('qb-customs:server:attemptPurchase', function(type, upgradeLevel)
    local source = source
    TriggerClientEvent('qb-customs:client:purchaseSuccessful', source)
end)

RegisterNetEvent("qb-customs:server:updateVehicle", function(myCar)
    if IsVehicleOwned(myCar.plate) then
        local src = source
        MySQL.update('UPDATE ' .. Config.vehicleDataBase .. ' SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

RegisterNetEvent("qb-customs:server:getReceipt", function(myCar, veh, licensePlate)
    local src = source
    local carInfo = {
        myCar = myCar,
        veh = veh,
        licensePlate = licensePlate
    }
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.car = carInfo

    if #info.car.myCar >= 1 then
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.ReceiptItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.ReceiptItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.ReceiptItem, 1, info)
        else
            print('error inventory unknown')
        end
    end
end)



RegisterNetEvent('qb-customs:server:UpdateLocation', function(location, type, key, value)
    Config.Locations[location][type][key] = value
    TriggerClientEvent('qb-customs:client:UpdateLocation', -1, location, type, key, value)
end)

QBCore.Functions.CreateCallback('qb-customs:server:GetLocations', function(_, cb)
	cb(Config.Locations)
end)

QBCore.Functions.CreateCallback('qb-customs:server:canUpgradeThisCar', function(_, cb, plate)
    -- cb(IsVehicleOwned(plate))
    cb(true)
end)

QBCore.Functions.CreateUseableItem(Config.ReceiptItem, function(source, item)
    local src = source
    if Config.Inventory == 'qb' then
        local carInfo = item.info.car
        TriggerClientEvent('rho-mechanic:activeReceiptMenu', src, carInfo)
    elseif Config.Inventory == 'ox' then
        local carInfo = item.metadata.car
        TriggerClientEvent('rho-mechanic:activeReceiptMenu', src, carInfo)
    else
        print('unkown inventory')
    end
end)

RegisterNetEvent('rho-mechainc:server:getSprayForVehicle', function(vehColorData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.vehColor = vehColorData
    continue = true
    for i,v in next, Config.CustomMaterials['spray'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end 
    if continue then
        if Config.CustomMaterials['spray'].money then
            if Config.CustomMaterials['spray'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['spray'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['spray'] do
            if Config.Inventory == 'qb' then
                if type(b) == 'table' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                end
            elseif Config.Inventory == 'ox' then
                if type(b) == 'table' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                end
            else
                print('unkown inventory')
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.SprayItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.SprayItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.SprayItem, 1, info)
        else
            print('inventory unkown')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getModByID', function(vehUpgrades, materials)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.vehUpgrade = vehUpgrades
    info.description = 'Upgrade type: ' .. vehUpgrades.modID
    local modCategory = vehUpgrades.categoryID
    local index = getCategoryIndexById(modCategory, Config.vehicleCustomisation)
    local itemName = Config.vehicleCustomisation[index].itemname
    local continue = true
    for i,v in next, materials do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end 
    if continue then
        if materials.money then
            if materials.money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', materials.money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for i,v in next, materials do
            if type(v) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(v.name, v.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[v.name], "remove", v.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, v.name, v.amount)
                else
                    print('unkown inventory')
                end
            end
        end 
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(itemName, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[itemName], "add")
            end
        elseif Config.Inventory == 'ox' then
            local metadata = {}
            metadata.vehUpgrade = vehUpgrades
            local success, response = exports.ox_inventory:AddItem(src, itemName, 1, metadata)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getNeonMod', function(vehNeons)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.neonData = vehNeons
    local continue = true
    info.description = 'Neon Activation'
    for i,v in next, Config.CustomMaterials['neon'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        if Config.CustomMaterials['neon'].money then
            if Config.CustomMaterials['neon'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['neon'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['neon'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.NeonItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.NeonItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.NeonItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getXenonMod', function(vehXenon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local continue = true
    info.xenonData = vehXenon
    for i,v in next, Config.CustomMaterials['xenon'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        info.description = 'Xenon Activation'
        if Config.CustomMaterials['xenon'].money then
            if Config.CustomMaterials['xenon'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['xenon'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['xenon'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.XenonItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.XenonItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.XenonItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getTyreSmoke', function(tyreSmokeData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.tyreSmoke = tyreSmokeData
    local continue = true
    for i,v in next, Config.CustomMaterials['tyreSmoke'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        if Config.CustomMaterials['tyreSmoke'].money then
            if Config.CustomMaterials['tyreSmoke'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['tyreSmoke'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['tyreSmoke'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.TyreSmokeItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.TyreSmokeItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.TyreSmokeItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getWindowTint', function(windowData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local continue = true
    for i,v in next, Config.CustomMaterials['neon'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        info.windowTint = windowData
        if Config.CustomMaterials['windowtint'].money then
            if Config.CustomMaterials['windowtint'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['windowtint'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['windowtint'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.WindowTintItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.WindowTintItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.WindowTintItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getExtraMod', function(extraData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local continue = true
    for i,v in next, Config.CustomMaterials['neon'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        info.extraData = extraData
        if Config.CustomMaterials['extra'].money then
            if Config.CustomMaterials['extra'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['extra'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['extra'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.ExtraItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.ExtraItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.ExtraItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

RegisterNetEvent('rho-mechainc:server:getWheelMod', function(wheelData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local continue = true
    for i,v in next, Config.CustomMaterials['neon'] do
        if type(v) == 'table' then
            if not hasItemFunction(src, v.name, v.amount) then
                continue = false
                break
            end
        end
    end
    if continue then
        info.wheelData = wheelData
        if Config.CustomMaterials['wheels'].money then
            if Config.CustomMaterials['wheels'].money <= Player.PlayerData.money.cash then
                Player.Functions.RemoveMoney('cash', Config.CustomMaterials['wheels'].money, "Bought car part")
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.notEnoughMoney, "error")
                return
            end
        end
        for a,b in next, Config.CustomMaterials['wheels'] do
            if type(b) == 'table' then
                if Config.Inventory == 'qb' then
                    Player.Functions.RemoveItem(b.name, b.amount)
                    if Config.UseItemBox then
                        TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[b.name], "remove", b.amount)
                    end
                elseif Config.Inventory == 'ox' then
                    local success = exports.ox_inventory:RemoveItem(src, b.name, b.amount)
                else
                    print('unkown inventory')
                end
            end
        end
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.WheelItem, 1, false, info)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.WheelItem], "add")
            end
        elseif Config.Inventory == 'ox' then
            local success, response = exports.ox_inventory:AddItem(src, Config.WheelItem, 1, info)
        else
            print('unkown inventory')
        end
    else
        TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.missingItem, "error")
    end
end)

QBCore.Functions.CreateUseableItem(Config.TyreSmokeItem, function(source, item)
    local src = source
    if Config.Inventory == 'qb' then
        if item.info.tyreSmoke then
            TriggerClientEvent('rho-mechanic:client:changeTyreSmoke', src, item.info.tyreSmoke, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.tyreSmoke then
            TriggerClientEvent('rho-mechanic:client:changeTyreSmoke', src, item.metadata.tyreSmoke, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)

QBCore.Functions.CreateUseableItem(Config.WindowTintItem, function(source, item)
    local src = source
    if Config.Inventory == 'qb' then
        if item.info.windowTint then
            TriggerClientEvent('rho-mechanic:client:changeVehWindowTint', src, item.info.windowTint, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.windowTint then
            TriggerClientEvent('rho-mechanic:client:changeVehWindowTint', src, item.metadata.windowTint, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)

QBCore.Functions.CreateUseableItem(Config.ExtraItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == 'qb' then
        if item.info.extraData then
            TriggerClientEvent('rho-mechanic:client:changeVehExtra', src, item.info.extraData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.extraData then
            TriggerClientEvent('rho-mechanic:client:changeVehExtra', src, item.metadata.extraData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)


QBCore.Functions.CreateUseableItem(Config.WheelItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Config.Inventory == 'qb' then
        if item.info.wheelData then
            TriggerClientEvent('rho-mechanic:client:changeVehWheel', src, item.info.wheelData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.wheelData then
            TriggerClientEvent('rho-mechanic:client:changeVehWheel', src, item.metadata.wheelData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)

QBCore.Functions.CreateUseableItem(Config.NeonItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == 'qb' then
        if item.info.neonData then
            TriggerClientEvent('rho-mechanic:client:changeVehNeonColour', src, item.info.neonData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.neonData then
            TriggerClientEvent('rho-mechanic:client:changeVehNeonColour', src, item.metadata.neonData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.neonData, "error")
        end
    else
        print('unkown inventory')
    end
end)

QBCore.Functions.CreateUseableItem(Config.XenonItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == 'qb' then
        if item.info.xenonData then
            TriggerClientEvent('rho-mechanic:client:changeXenonColour', src, item.info.xenonData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.xenonData then
            TriggerClientEvent('rho-mechanic:client:changeXenonColour', src, item.metadata.xenonData, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)

QBCore.Functions.CreateUseableItem(Config.SprayItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == 'qb' then
        if item.info.vehColor then
            TriggerClientEvent('rho-mechanic:client:changeVehColour', src, item.info.vehColor, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    elseif Config.Inventory == 'ox' then
        if item.metadata.vehColor then
            TriggerClientEvent('rho-mechanic:client:changeVehColour', src, item.metadata.vehColor, item.slot)
        else
            TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
        end
    else
        print('unkown inventory')
    end
end)

for i,v in next, Config.vehicleCustomisation do
    QBCore.Functions.CreateUseableItem(v.itemname, function(source, item)
        local src = source
        if Config.Inventory == 'qb' then
            if item.info.vehUpgrade then
                TriggerClientEvent('rho-mechanic:client:changeVehMod', src, item.info.vehUpgrade, item.name, item.slot)
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
            end
        elseif Config.Inventory == 'ox' then
            if item.metadata.vehUpgrade then
                TriggerClientEvent('rho-mechanic:client:changeVehMod', src, item.metadata.vehUpgrade, item.name, item.slot)
            else
                TriggerClientEvent(Config.EventPrefix .. ':Notify', src, Config.Text.errors.itemError, "error")
            end
        else
            print('unkown inventory')
        end
    end)
end

RegisterNetEvent('rho-mechanic:server:removeTheSpray', function(slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemBySlot(slot)
    if item.name == Config.SprayItem then
        if Config.Inventory == 'qb' then
            Player.Functions.RemoveItem(Config.SprayItem, 1, slot)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.SprayItem], "remove")
            end
        elseif Config.Inventory == 'ox' then
            local success = exports.ox_inventory:RemoveItem(src, Config.SprayItem, 1)
        else
            print('unkown inventory')
        end
    else
        if Config.Inventory == 'qb' then
            Player.Functions.RemoveItem(Config.SprayItem, 1)
            if Config.UseItemBox then
                TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[Config.SprayItem], "remove")
            end
        elseif Config.Inventory == 'ox' then
            local success = exports.ox_inventory:RemoveItem(src, Config.SprayItem, 1)
        else
            print('unkown inventory')
        end
    end
end)

RegisterNetEvent('rho-mechanic:server:removeTheMod', function(slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemBySlot(slot)
    if Config.Inventory == 'qb' then
        Player.Functions.RemoveItem(item.name, 1, slot)
        if Config.UseItemBox then
            TriggerClientEvent(Config.UseItemBox, src, QBCore.Shared.Items[item.name], "remove")
        end
    elseif Config.Inventory == 'ox' then
        local success = exports.ox_inventory:RemoveItem(src, item.name, 1)
    else
        print('unkown inventory')
    end
end)