local canUseContract = {}

CreateThread(function()
    if Config.Framework == "QBCore" and Config.MetadataInventory then
        QBCore.Functions.CreateUseableItem(Config.ContractItem, function(source, item)
            local src = source
            local identifier = getIdentifier(src)
            local metadata, slot = getMetadata(item,item)
            if metadata and metadata.dealership then
                if hasPermission(identifier,metadata.dealership) then
                    TriggerClientEvent("av_dealership:useContract",src,metadata.dealership)
                else
                    TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['no_permission'],"error")
                end
            end
        end)
        return
    end
    if Config.Framework == "ESX" and Config.MetadataInventory then
        ESX.RegisterUsableItem(Config.ContractItem, function(source,item,info)
            local src = source
            local identifier = getIdentifier(src)
            local metadata, slot = getMetadata(item,info)
            if metadata and metadata.dealership then
                if hasPermission(identifier,metadata.dealership) then
                    TriggerClientEvent("av_dealership:useContract",src,metadata.dealership)
                else
                    TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['no_permission'],"error")
                end
            end
        end)
        return
    else
        -- Do your own register item
    end
    if not Config.MetadataInventory then
        RegisterCommand(Config.BuyVehicleCommand, function(source,_)
            local src = source
            local identifier = getIdentifier(src)
            local dealership = canUseContract[identifier]
            if dealership then
                if hasPermission(identifier,dealership) then
                    TriggerClientEvent("av_dealership:useContract",src,dealership)
                else
                    TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['no_permission'],"error")
                end
            else
                TriggerClientEvent("av_dealership:notification",source, Lang['title'], Lang['no_access_command'], "error")
            end
        end)
    end
end)

RegisterServerEvent("av_dealership:giveContract", function(dealer)
    local src = source
    if Config.MetadataInventory then
        if dealership_data[dealer] then
            addItem(src,Config.ContractItem,1,{dealership = dealer})
            TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['contract_printed'],"success")
        end
    else
        local identifier = getIdentifier(src)
        canUseContract[identifier] = dealer
        TriggerClientEvent("av_dealership:notification",src,Lang['title'],Lang['contract_printed'],"success")
    end
end)

RegisterServerEvent("av_dealership:buyPreowned", function(input, plates, dealer, netId)
    local src = source
    local myDealer = dealership_data[dealer]
    if myDealer then
        local myFunds = getFunds(dealer)
        if tonumber(myFunds) >= tonumber(input) then
            local vehOwned = MySQL.single.await('SELECT * FROM '..Config.VehiclesTable..' WHERE plate = ?', {
                plates
            })
            if vehOwned then
                if GetResourceState("av_boosting") == "started" then
                    if vehOwned and vehOwned['vinscratch'] then
                        if tonumber(vehOwned['vinscratch']) == 1 then
                            TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['is_vinscratch'], "error")
                            return
                        end
                    end
                end
                local owner = vehOwned[Config.OwnerColumn]
                if owner then
                    local Player = getSourceByIdentifier(owner)
                    if Player then
                        local ownerPed = GetPlayerPed(Player)
                        local myPed = GetPlayerPed(src)
                        local dist = #(GetEntityCoords(ownerPed) - GetEntityCoords(myPed))
                        if dist <= 10 then
                            local acceptOffer = lib.callback.await('av_dealership:acceptOffer', tonumber(Player), input)
                            if acceptOffer then
                                if tonumber(myFunds) >= tonumber(input) then
                                    removeFunds(dealer,tonumber(input))
                                    addMoney(Player,Config.AccountName, tonumber(input))
                                    local received = string.format(Lang['vehicle_sold'], input)
                                    if Config.Framework == "QBCore" then
                                        MySQL.update('UPDATE '..Config.VehiclesTable..' SET license = ?, '..Config.OwnerColumn..' = ? WHERE plate = ?', {
                                            dealer,
                                            dealer,
                                            plates
                                        }, function()
                                            TriggerClientEvent("av_dealership:notification",tonumber(src), Lang['title'], Lang['purchased_vehicle_dealer'], "success")
                                            TriggerClientEvent("av_dealership:notification",tonumber(Player), Lang['title'], received, "success")
                                            local veh = NetworkGetEntityFromNetworkId(netId)
                                            if veh and DoesEntityExist(veh) then
                                                while DoesEntityExist(veh) do
                                                    DeleteEntity(veh)
                                                    Wait(500)
                                                end
                                            end
                                        end)
                                    elseif Config.Framework == "ESX" then
                                        MySQL.update('UPDATE '..Config.VehiclesTable..' SET '..Config.OwnerColumn..' = ? WHERE plate = ?', {
                                            dealer,
                                            plates
                                        }, function()
                                            TriggerClientEvent("av_dealership:notification",tonumber(src), Lang['title'], Lang['purchased_vehicle_dealer'], "success")
                                            TriggerClientEvent("av_dealership:notification",tonumber(Player), Lang['title'], received, "success")
                                            local veh = NetworkGetEntityFromNetworkId(netId)
                                            if veh and DoesEntityExist(veh) then
                                                while DoesEntityExist(veh) do
                                                    DeleteEntity(veh)
                                                    Wait(500)
                                                end
                                            end
                                        end)
                                    else
                                        -- add your own query to update the vehicle table and set the dealership as owner
                                    end
                                    SaveResourceFile(GetCurrentResourceName(), "dealerships.json", json.encode(dealership_data), -1)
                                else
                                    TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['cant_buy_this'], "error")
                                end
                            else
                                TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['offer_declined'], "error")
                            end
                        else
                            TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['owner_not_found'], "error")
                        end
                    else
                        TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['owner_not_found'], "error")
                    end
                else
                    print("[ERROR] Tried to buy a vehicle but there's no owner identifier, maybe wrong column name for identifier? "..Config.OwnerColumn)
                end
            else
                TriggerClientEvent("av_dealership:notification", src, Lang['title'], Lang['cant_buy_this'], "error")
            end
        else
            local msg = string.format(Lang['no_funds'], myFunds)
            TriggerClientEvent("av_dealership:notification", src, Lang['title'], msg, "error")
        end
    end
end)