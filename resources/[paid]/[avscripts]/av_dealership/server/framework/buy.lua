local props = {
    pearlescentColor = 3,modTransmission = -1,modBackWheels = -1,modSpoilers = -1,neonEnabled = {false, false, false, false},fuelLevel = 100.0,
    wheelSize = 0.0,modKit17 = -1,modExhaust = -1,modWindows = -1,modFender = -1,tankHealth = 1000.0,modAirFilter = -1,tireHealth = {["1"] = 1000.0, ["2"] = 1000.0, ["3"] = 1000.0, ["0"] = 1000.0},
    modPlateHolder = -1,modSpeakers = -1,tyreSmokeColor = {255, 255, 255},modArmor = -1,modSeats = -1,modBrakes = -1,modHydrolic = -1,color2 = 0,wheels = 7,modGrille = -1,
    dashboardColor = 0,tireBurstState = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["0"] = false},modDoorSpeaker = -1,modSuspension = -1,modLivery = -1,modTrimA = -1,
    modHood = -1,modDashboard = -1,modKit19 = -1,modCustomTiresR = false,doorStatus = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["0"] = false},windowTint = -1,
    bodyHealth = 1000.0,modAPlate = -1,headlightColor = 255,modEngine = -1,modAerials = -1,plateIndex = 0,modTurbo = false,modHorns = -1,modRoof = -1,modArchCover = -1,modShifterLeavers = -1,
    modFrontBumper = -1,modStruts = -1,modTrunk = -1,tireBurstCompletely = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["0"] = false},modSmokeEnabled = false,
    modTrimB = -1,color1 = 0,modOrnaments = -1,modKit47 = -1,modXenon = false,modKit49 = -1,modRightFender = -1,modSteeringWheel = -1,modVanityPlate = -1,modCustomTiresF = false,
    wheelWidth = 0.0,modEngineBlock = -1,modDial = -1,wheelColor = 156,xenonColor = 255,modTank = -1,interiorColor = 0,modKit21 = -1,modSideSkirt = -1,dirtLevel = 0.0,
    windowStatus = {["1"] = true, ["2"] = true, ["3"] = true, ["4"] = false, ["5"] = false, ["6"] = true, ["7"] = true, ["0"] = true},liveryRoof = -1,engineHealth = 1000.0,modFrame = -1,
    modFrontWheels = -1,modRearBumper = -1
}

function saveVehicle(playerId, model, plates, preowned, garage, dealer)
    local category = vehicle_data[model]['category']
    props['model'] = model
    props['plate'] = plates
    if preowned then
        local exists = MySQL.single.await('SELECT * FROM '..Config.VehiclesTable..' WHERE '..Config.OwnerColumn..' = ? AND plate = ?', {
            dealer, plates
        })
        if exists then
            if not garage then garage = Config.DefaultGarage end
            if Config.Framework == "QBCore" then
                local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
                MySQL.update('UPDATE '..Config.VehiclesTable..' SET license = ?, '..Config.OwnerColumn..' = ?, garage = ?, state = 1 WHERE plate = ?', {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    garage,
                    plates
                }, function()
                    TriggerClientEvent("av_dealership:notification",tonumber(playerId), Lang['title'], Lang['vehicle_purchased'], "success")
                end)
            elseif Config.Framework == "ESX" then
                local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
                MySQL.update('UPDATE '..Config.VehiclesTable..' SET '..Config.OwnerColumn..' = ? WHERE plate = ?', {
                    xPlayer.identifier,
                    plates
                }, function()
                    TriggerClientEvent("av_dealership:notification",tonumber(playerId), Lang['title'], Lang['vehicle_purchased'], "success")
                end)
            else

            end
        else
            print("^1[ERROR] Dealership "..dealer.." tried to sold a pre owned vehicle but it doesn't exist in "..Config.VehiclesTable..", plates: "..plates.."^7")
            print("^1[ERROR] Dealership "..dealer.." tried to sold a pre owned vehicle but it doesn't exist in "..Config.VehiclesTable..", plates: "..plates.."^7")
        end
    else
        if not garage then garage = Config.DefaultGarage end
        if Config.Framework == "QBCore" then
            local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
            if Player then
                MySQL.insert('INSERT INTO '..Config.VehiclesTable..' (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                    Player.PlayerData.license,
                    Player.PlayerData.citizenid,
                    model,
                    GetHashKey(model),
                    json.encode(props),
                    plates,
                    garage,
                    1
                })
                TriggerClientEvent("av_dealership:notification",tonumber(playerId), Lang['title'], Lang['vehicle_purchased'], "success")
            end
        elseif Config.Framework == "ESX" then
            local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
            if xPlayer then
                local type = Config.Types[category]
                if not type then type = Config.DefaultType end
                MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type, model) VALUES (?, ?, ?, ?, ?, ?)', {
                    xPlayer.identifier,
                    plates,
                    json.encode(props),
                    1,
                    type,
                    model
                })
                TriggerClientEvent("av_dealership:notification",tonumber(playerId), Lang['title'], Lang['vehicle_purchased'], "success")
            end
        else
            -- Your custom query to add the vehicle in database
            print('Please modify line 33 server/framework/buy.lua')
        end
    end
end