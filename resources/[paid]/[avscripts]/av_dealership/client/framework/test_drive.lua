local inTestVehicle = false

RegisterNUICallback("testDrive", function(data,cb)
    local model = data['model']
    local dealership = data['dealership']
    if model and dealership then
        model = GetHashKey(model)
        if model and IsModelInCdimage(model) then
            local spawn = getTestCoords(dealership)
            if spawn and (spawn["coords"] and spawn["rotation"]) then
                local isClear = checkSpawn(spawn['coords'])
                if isClear then
                    SendNUIMessage({
                        action = "close"
                    })
                    lib.requestModel(model, 15000)
                    local test_vehicle = CreateVehicle(model, spawn['coords'].x, spawn['coords'].y, spawn['coords'].z, spawn['rotation'].z, true, true)
                    while not test_vehicle do Wait(5) end
                    giveKeys(test_vehicle)
                    if data['mods'] then
                        vehicleMods(test_vehicle, data['mods'])
                    end
                    setFuel(test_vehicle)
                    local netId = NetworkGetNetworkIdFromEntity(test_vehicle)
                    TriggerServerEvent("av_dealership:testDrive", netId)
                    Wait(250)
                    if Config.TpInside then
                        DoScreenFadeOut(100)
                        Wait(1000)
                        TaskWarpPedIntoVehicle(PlayerPedId(), test_vehicle, -1)
                        Wait(1000)
                        DoScreenFadeIn(50)
                    end
                    local message = string.format(Lang['test_drive'], Config.TestDriveTime)
                    TriggerEvent("av_dealership:notification", Lang['title'], message, 'inform')
                    SetModelAsNoLongerNeeded(model)
                else
                    TriggerEvent("av_dealership:notification", Lang['title'], Lang['spawn_blocked'], "error")
                end
            else
                TriggerEvent("av_dealership:notification", Lang['title'], Lang['no_test_coords'], "error")
            end
        else
            print("[ERROR] Vehicle model "..data.." doesn't exist in game")
        end
    end
    cb("ok")
end)

lib.onCache('vehicle', function(veh)
    if veh then
        local state = Entity(veh).state
        if state and state.test then
            inTestVehicle = true
            while inTestVehicle do
                local message = string.format(Lang['test_time'], state.test)
                lib.showTextUI(message)
                Wait(2000)
                if lib.isTextUIOpen() then
                    lib.hideTextUI()
                end
            end
        end
    else
        if inTestVehicle then
            inTestVehicle = false
            if lib.isTextUIOpen() then
                lib.hideTextUI()
            end
        end
    end
end)