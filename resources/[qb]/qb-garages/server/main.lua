local QBCore = exports['qb-core']:GetCoreObject()
local OutsideVehicles = {}
local VehicleSpawnerVehicles = {}

local function TableContains (tab, val)
    if type(val) == "table" then
        for _, value in ipairs(tab) do
            if TableContains(val, value) then
                return true
            end
        end
        return false
    else
        for _, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
    end
    return false
end

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicle", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if not OutsideVehicles[plate] then cb(nil) return end
     MySQL.query('SELECT * FROM player_vehicles WHERE citizenid = ? and plate = ?', {pData.PlayerData.citizenid, plate}, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

--impoundlot stuff
QBCore.Functions.CreateCallback('qb-garages:server:GetDepotVehiclesPD', function(source, cb)
    local state = 2
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE state = ?', {state}, function(result)
        if result[1] ~= nil then
            cb(result)
        else
            cb(result)
        end
    end)
end)

QBCore.Functions.CreateCallback('qb-garage:server:getVehicleAllowedToSpawn', function(source, cb, plate)
    exports.oxmysql:execute('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
        if result[1].timeImpounded ~= nil then
            local daysToImpound = tonumber(result[1].timeImpounded) -- Convert timeImpounded to a number
            local savedTime = result[1].timestamp -- Get the saved time in seconds
            local currentTime = os.time()
            local timeDifference = currentTime - savedTime -- Calculate the time difference in seconds
            local difference = daysToImpound - timeDifference
            local totalSeconds = difference
            local days = math.floor(totalSeconds / (24 * 60 * 60))
            local hours = math.floor((totalSeconds % (24 * 60 * 60)) / (60 * 60))
            local minutes = math.floor((totalSeconds % (60 * 60)) / 60)
            local seconds = totalSeconds % 60

            print(days .. " days, " .. hours .. " hours, " .. minutes .. " minutes, " .. seconds .. " seconds")

            if timeDifference > daysToImpound then
                cb(true) -- If more days have passed than the time impounded, return true
                return -- Add this line to exit the function after calling the callback
            else
                TriggerClientEvent('QBCore:Notify', source, "This vehicle still has time remaining, And wont be released until the timer is up! " .. days .. " days, " .. hours .. " hours, " .. minutes .. " minutes, " .. seconds .. " seconds remaining", 'error')
                cb(false)
            end
        end

        cb(true) -- Return true as impound time wasnt present.
    end)
end)

RegisterServerEvent('qb-police:server:returntoimpound')
AddEventHandler('qb-police:server:returntoimpound', function(data)
    local src = source
	local plate = data.plate
    local state = 0
    TriggerClientEvent('QBCore:Notify', src, "Vehicle has been released to the impound", 'success')
    exports.oxmysql:execute('UPDATE player_vehicles SET state = ? WHERE plate = ? AND garage = ?', {state, plate, "pillboxgarage"})
end)

--

QBCore.Functions.CreateCallback("qb-garages:server:GetVehicleLocation", function(source, cb, plate)
    local src = source
    local vehicles = GetAllVehicles()
    for _, vehicle in pairs(vehicles) do
        local pl = GetVehicleNumberPlateText(vehicle)
        if pl == plate then
            cb(GetEntityCoords(vehicle))
            return
        end
    end
    local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    local veh = result[1]
    if veh then
        if Config.StoreParkinglotAccuratly and veh.parkingspot then
            local location = json.decode(veh.parkingspot)
            cb(vector3(location.x, location.y, location.z))
        else
            local garageName = veh and veh.garage
            local garage = Config.Garages[garageName]
            if garage and garage.blipcoords then
                cb(garage.blipcoords)
            elseif garage and garage.Zone and garage.Zone.Shape and garage.Zone.Shape[1] then
                cb(vector3(garage.Zone.Shape[1].x, garage.Zone.Shape[1].y, garage.Zone.minZ))
            else
                local result = MySQL.query.await('SELECT * FROM houselocations WHERE name = ?', {garageName})
                if result and result[1] then
                    local coords = json.decode(result[1].garage)
                    if coords then
                        cb(vector3(coords.x, coords.y, coords.z))
                    else
                        cb(nil)
                    end
                else
                    cb(nil)
                end
            end
        end
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:CheckSpawnedVehicle", function(source, cb, plate)
    cb(VehicleSpawnerVehicles[plate] ~= nil and VehicleSpawnerVehicles[plate])
end)

RegisterNetEvent("qb-garage:server:UpdateSpawnedVehicle", function(plate, value)
    VehicleSpawnerVehicles[plate] = value
end)

QBCore.Functions.CreateCallback('qb-garage:server:spawnvehicle', function (source, cb, vehInfo, coords, warp)
    local veh = QBCore.Functions.SpawnVehicle(source, vehInfo.vehicle, coords, warp)

    if not veh or not NetworkGetNetworkIdFromEntity(veh) then
        print('ISSUE HERE', veh, NetworkGetNetworkIdFromEntity(veh))
    end

    local plate = vehInfo.plate

    local hasFakePlate = exports['brazzers-fakeplates']:getFakePlateFromPlate(plate)
    SetEntityHeading(veh, coords.w)

    local vehProps = {}
    local result = MySQL.query.await('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then vehProps = json.decode(result[1].mods) end
    local netId = NetworkGetNetworkIdFromEntity(veh)
    OutsideVehicles[plate] = {netID = netId, entity = veh}

    print(hasFakePlate)

    if hasFakePlate then 
        SetVehicleNumberPlateText(veh, hasFakePlate)
        TriggerClientEvent("vehiclekeys:client:SetOwner", source, hasFakePlate)
    else 
        SetVehicleNumberPlateText(veh, plate)
        TriggerClientEvent("vehiclekeys:client:SetOwner", source, plate)
    end
    
    cb(netId, vehProps)
end)

local function GetVehicles(citizenid, garageName, state, cb)
    local result = nil
    if not Config.GlobalParking then
        result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND garage = @garage AND state = @state', {
            ['@citizenid'] = citizenid,
            ['@garage'] = garageName,
            ['@state'] = state
        })
    else
        result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND state = @state', {
            ['@citizenid'] = citizenid,
            ['@state'] = state
        })
    end
    cb(result)
end

local function GetDepotVehicles(citizenid, state, garage, cb)
    local result = MySQL.Sync.fetchAll("SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND (state = @state OR garage = @garage OR garage IS NULL or garage = '')", {
        ['@citizenid'] = citizenid,
        ['@state'] = state,
        ['@garage'] = garage
    })
    cb(result)
end

local function GetVehicleByPlate(plate)
    local vehicles = GetAllVehicles() -- Get all vehicles known to the server
    for _, vehicle in pairs(vehicles) do
        local pl = GetVehicleNumberPlateText(vehicle)
        if pl == plate then
            return vehicle
        end
    end
    return nil
end

QBCore.Functions.CreateCallback("qb-garage:server:GetGarageVehicles", function(source, cb, garage, garageType, category)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local playerGang = pData.PlayerData.gang.name;

    if garageType == "public" then        --Public garages give player cars in the garage only
        GetVehicles(pData.PlayerData.citizenid, garage, 1, function(result)
            local vehs = {}
            if result[1] then
                for _, vehicle in pairs(result) do
                    if vehicle.parkingspot then
                        local spot = json.decode(vehicle.parkingspot)
                        if spot and spot.x then
                            vehicle.parkingspot = vector3(spot.x, spot.y, spot.z)
                        end
                    end
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end
                    vehs[#vehs + 1] = vehicle
                end
                cb(vehs)
            else
                cb(nil)
            end
        end)
    elseif garageType == "depot" then    --Depot give player cars that are not in garage only
        GetDepotVehicles(pData.PlayerData.citizenid, 0, garage, function(result)
            local tosend = {}
            if result[1] then
                if type(category) == 'table' then
                    if TableContains(category, {'car'}) then
                        category = 'car'
                    elseif TableContains(category, {'plane', 'helicopter'}) then
                        category = 'air'
                    elseif TableContains(category, 'boat') then
                        category = 'sea'
                    end
                end
                for _, vehicle in pairs(result) do
                    if GetVehicleByPlate(vehicle.plate) or not QBCore.Shared.Vehicles[vehicle.vehicle] then
                        goto skip
                    end
                    if vehicle.depotprice == 0 then
                        vehicle.depotprice = Config.DepotPrice
                    end

                    vehicle.parkingspot = nil
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end

                    if category == "air" and ( QBCore.Shared.Vehicles[vehicle.vehicle].category == "helicopters" or QBCore.Shared.Vehicles[vehicle.vehicle].category == "planes" ) then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "sea" and QBCore.Shared.Vehicles[vehicle.vehicle].category == "boats" then
                        tosend[#tosend + 1] = vehicle
                    elseif category == "car" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "helicopters" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "planes" and QBCore.Shared.Vehicles[vehicle.vehicle].category ~= "boats" then
                        tosend[#tosend + 1] = vehicle
                    end
                    ::skip::
                end
                cb(tosend)
            else
                cb(nil)
            end
        end)
    else                            --House give all cars in the garage, Job and Gang depend of config
        local shared = ''
        if not TableContains(Config.SharedJobGarages, garage) and not (Config.SharedHouseGarage and garageType == "house") and not ((Config.SharedGangGarages == true or (type(Config.SharedGangGarages) == "table" and Config.SharedGangGarages[playerGang])) and garageType == "gang") then
            shared = " AND citizenid = '"..pData.PlayerData.citizenid.."'"
        end
         MySQL.query('SELECT * FROM player_vehicles WHERE garage = ? AND state = ?'..shared, {garage, 1}, function(result)
            if result[1] then
                local vehs = {}
                for _, vehicle in pairs(result) do
                    local spot = json.decode(vehicle.parkingspot)
                    if vehicle.parkingspot then
                        vehicle.parkingspot = vector3(spot.x, spot.y, spot.z)
                    end
                    if vehicle.damage then
                        vehicle.damage = json.decode(vehicle.damage)
                    end
                    vehs[#vehs + 1] = vehicle
                end
                cb(vehs)
            else
                cb(nil)
            end
        end)
    end
end)



QBCore.Functions.CreateCallback("qb-garage:server:checkOwnership", function(source, cb, plate, type, house, gang)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    if type == "public" then        --Public garages only for player cars
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
            if result[1] then
                cb(true)
            else
                MySQL.query('SELECT * FROM player_vehicles WHERE fakeplate = ? AND citizenid = ?', {plate, pData.PlayerData.citizenid}, function(fakeplate)
                    if fakeplate[1] then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            end
        end)
    elseif type == "house" then     --House garages only for player cars that have keys of the house
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then
                local hasHouseKey = exports['ps-housing']:IsOwner(src, house)
                if hasHouseKey then
                    cb(true)
                else
                    cb(false)
                end
            else
                MySQL.query('SELECT * FROM player_vehicles WHERE fakeplate = ?', {plate}, function(fakeplate)
                    if fakeplate[1] then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            end
        end)
    elseif type == "gang" then        --Gang garages only for gang members cars (for sharing)
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
            if result[1] then
                --Check if found owner is part of the gang
                local resultplayer = MySQL.single.await('SELECT * FROM players WHERE citizenid = ?', { result[1].citizenid })
                if resultplayer then
                    local playergang = json.decode(resultplayer.gang)
                    if playergang.name == gang then
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
            else
                MySQL.query('SELECT * FROM player_vehicles WHERE fakeplate = ?', {plate}, function(fakeplate)
                    if fakeplate[1] then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            end
        end)
    else                            --Job garages only for cars that are owned by someone (for sharing and service) or only by player depending of config
        local shared = ''
        if not Config["SharedGarages"] then
            shared = " AND citizenid = '"..pData.PlayerData.citizenid.."'"
        end
        MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?'..shared, {plate}, function(result)
            if result[1] then
                cb(true)
            else
                MySQL.query('SELECT * FROM player_vehicles WHERE fakeplate = ?'..shared, {plate}, function(fakeplate)
                    if fakeplate[1] then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            end
        end)
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetVehicleProperties", function(source, cb, plate)
    local properties = {}
    local result = MySQL.query.await('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then
        properties = json.decode(result[1].mods)
    end
    cb(properties)
end)

RegisterNetEvent('qb-garage:server:updateVehicle', function(state, fuel, engine, body, properties, plate, garage, location, damage)
    local hasFakePlate = exports['brazzers-fakeplates']:getPlateFromFakePlate(plate)
    if hasFakePlate then plate = hasFakePlate end
    Wait(100)

    if location and type(location) == 'vector3' then
        if Config.StoreDamageAccuratly then
            MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ?, parkingspot = ?, damage = ? WHERE plate = ?',{state, garage, fuel, engine, body, json.encode(properties), json.encode(location), json.encode(damage), plate})
        else
            MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ?, parkingspot = ? WHERE plate = ?',{state, garage, fuel, engine, body, json.encode(properties), json.encode(location), plate})
        end
    else
        if Config.StoreDamageAccuratly then
            MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ?, damage = ? WHERE plate = ?',{state, garage, fuel, engine, body, json.encode(properties), json.encode(damage), plate})
        else
            MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, fuel = ?, engine = ?, body = ?, mods = ? WHERE plate = ?', {state, garage, fuel, engine, body, json.encode(properties), plate})
        end
    end
end)


RegisterNetEvent('qb-garage:server:updateVehicleState', function(state, plate, garage)
    local hasFakePlate = exports['brazzers-fakeplates']:getPlateFromFakePlate(plate)
    if hasFakePlate then plate = hasFakePlate end
    Wait(100)

    MySQL.update('UPDATE player_vehicles SET state = ?, garage = ?, depotprice = ? WHERE plate = ?',{state, garage, 0, plate})
end)

RegisterNetEvent('qb-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local citizenId = ply.PlayerData.citizenid
    OutsideVehicles[citizenId] = Vehicles
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicles", function(source, cb)
    local ply = QBCore.Functions.GetPlayer(source)
    local citizenId = ply.PlayerData.citizenid
    if OutsideVehicles[citizenId] and next(OutsideVehicles[citizenId]) then
        cb(OutsideVehicles[citizenId])
    else
        cb({})
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        if Config.AutoRespawn then
            MySQL.update('UPDATE player_vehicles SET state = 1 WHERE state = 0', {})
        end
    end
end)

RegisterNetEvent('qb-garage:server:PayDepotPrice', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]

    
    local vehicle = data.vehicle

     MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate}, function(result)
        if result[1] then
            local vehicle = result[1]
            local depotPrice = vehicle.depotprice ~= 0 and vehicle.depotprice or Config.DepotPrice
            if cashBalance >= depotPrice then
                Player.Functions.RemoveMoney("cash", depotPrice, "paid-depot")
            elseif bankBalance >= depotPrice then
                Player.Functions.RemoveMoney("bank", depotPrice, "paid-depot")
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_enough"), 'error')
            end
        end
    end)
end)

RegisterNetEvent('qb-garages:server:parkVehicle', function(plate)
    local vehicle = GetVehicleByPlate(plate)
    if vehicle then
        DeleteEntity(vehicle)
    end
end)

--External Calls
--Call from qb-vehiclesales
QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
     MySQL.query('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
        if result[1] then
            cb(true, result[1].balance)
        else
            cb(false)
        end
    end)
end)

--Call from qb-phone
QBCore.Functions.CreateCallback('qb-garage:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}

     MySQL.query('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid}, function(result)
        if result[1] then
            for k, v in pairs(result) do
                local VehicleData = QBCore.Shared.Vehicles[v.vehicle]
                if not VehicleData then goto continue end
                local VehicleGarage = Lang:t("error.no_garage")
                if v.garage ~= nil then
                    if Config.Garages[v.garage] ~= nil then
                        VehicleGarage = Config.Garages[v.garage].label
                    elseif Config.HouseGarages[v.garage] then
                        VehicleGarage = Config.HouseGarages[v.garage].label
                    end
                end

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                end
                
                local fullname 
                if VehicleData["brand"] ~= nil then
                    fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
                else
                    fullname = VehicleData["name"]
                end
                local spot = json.decode(v.parkingspot)
                Vehicles[#Vehicles+1] = {
                    fullname = fullname,
                    brand = VehicleData["brand"],
                    model = VehicleData["name"],
                    plate = v.plate,
                    garage = VehicleGarage,
                    state = v.state,
                    fuel = v.fuel,
                    engine = v.engine,
                    body = v.body,
                    parkingspot = spot and vector3(spot.x, spot.y, spot.z) or nil,
                    damage = json.decode(v.damage)
                }
                ::continue::
            end
            cb(Vehicles)
        else
            cb(nil)
        end
    end)
end)

local function GetRandomPublicGarage()
    for garageName, garage in pairs(Config.Garages)do
        if garage.type == 'public' then
            return garageName -- return the first garageName
        end
    end
end


-- Command to restore lost cars (garage: 'None' or something similar)
QBCore.Commands.Add("restorelostcars", "Restores cars that were parked in a grage that no longer exists in the config or is invalid (name change or removed).", {{name = "destination_garage", help = "(Optional) Garage where the cars are being sent to."}}, false,
function(source, args)
    local src = source
    if next(Config.Garages) ~= nil then
        local destinationGarage = args[1] and args[1] or GetRandomPublicGarage()
        if Config.Garages[destinationGarage] == nil then
            TriggerClientEvent('QBCore:Notify', src, 'Invalid garage name provided', 'error', 4500)
            return
        end

        local invalidGarages = {}
         MySQL.query('SELECT garage FROM player_vehicles', function(result)
            if result[1] then
                for _,v in ipairs(result) do
                    if Config.Garages[v.garage] == nil then
                        if v.garage then
                            invalidGarages[v.garage] = true
                        end
                    end
                end
                for garage,_ in pairs(invalidGarages) do
                    MySQL.update('UPDATE player_vehicles set garage = ? WHERE garage = ?',{destinationGarage, garage})
                end
                MySQL.update('UPDATE player_vehicles set garage = ? WHERE garage IS NULL OR garage = \'\'',{destinationGarage})
            end
        end)
    end
end, Config.RestoreCommandPermissionLevel)

if Config.EnableTrackVehicleByPlateCommand then
    QBCore.Commands.Add(Config.TrackVehicleByPlateCommand, 'Track vehicle', {{name='plate', help='Plate'}}, true, function(source, args)
    TriggerClientEvent('qb-garages:client:TrackVehicleByPlate', source, args[1])
    end, Config.TrackVehicleByPlateCommandPermissionLevel)
end

--[[ QBCore.Commands.Add("pgarage", "Player's Vehicles", {}, false, function(source, args)
    local src = source
    if args[1] then
        local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local pcid = Player.PlayerData.citizenid
        local pname = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.." ["..pcid.."]"
        local result = nil
        result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid', {
            ['@citizenid'] = pcid
        })
        if result[1] then
            local menuoptions = {}
            for k, v in pairs(result) do
                local enginePercent = v.engine / 10
                local bodyPercent = v.engine / 10
                if v.state == 1 then 
                    state = "Stored"
                else
                    state = "Out"
                end
                menuoptions[#menuoptions+1] = {
                    title = string.upper(v.vehicle).." ("..v.plate..")",
                    description = Lang:t('menu.text.depot', {
                        value = state,
                        value2 = v.plate,
                        value3 = enginePercent,
                        value4 = bodyPercent
                    }),
                    progress = v.fuel,
                    colorScheme = "green",
                    event = "qb-garages:client:managecar",
                    args = {
                        v.vehicle, v.plate, v
                    }
                }
            end
            TriggerClientEvent('qb-garages:client:openmanage', src, pname, menuoptions)
        end
    end
end) ]]