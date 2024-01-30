RegisterNetEvent("av_dealership:useContract", function(dealer)
    local myCoords = GetEntityCoords(PlayerPedId())
    local vehicles = lib.getNearbyVehicles(myCoords, 5.0, false)
    if vehicles then
        local closestVehicle = nil
        for k, v in pairs(vehicles) do
            if #(myCoords - vector3(v['coords'].x, v['coords'].y, v['coords'].z)) <= 5 then
                closestVehicle = v['vehicle']
                break
            end
        end
        if closestVehicle and DoesEntityExist(closestVehicle) then
            local netId = NetworkGetNetworkIdFromEntity(closestVehicle)
            local plates = GetVehicleNumberPlateText(closestVehicle)
            TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", -1, true)
            local input = lib.inputDialog(Lang['contract'], {
                {type = 'number', label = Lang['contract_price'], description = Lang['contract_description'], icon = 'fa-solid fa-hand-holding-dollar', required = true},
            })
            if (input and input[1]) and plates then
                TriggerServerEvent("av_dealership:buyPreowned", input[1], plates, dealer, netId)
            end
            ClearPedTasks(PlayerPedId())
        else
            TriggerEvent("av_dealership:notification",Lang['title'],Lang['no_vehicles'], "error")
        end
    else
        TriggerEvent("av_dealership:notification",Lang['title'],Lang['no_vehicles'], "error")
    end
end)

lib.callback.register('av_dealership:acceptOffer', function(price)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", -1, true)
    local cb = false
    local message = string.format(Lang['offer_message'], price)
    local res = lib.alertDialog({
        header = "**"..Lang['offer_header'].."**",
        content = message,
        centered = true,
        cancel = true
    })
    if res == "confirm" then
        cb = true
    end
    ClearPedTasks(PlayerPedId())
    return cb
end)