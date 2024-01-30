local ActiveChopping = {}

local VehicleChopBones = {
    {name = "wheel_lf", index = 0, type = "tyre"},
    {name = "wheel_rf", index = 1, type = "tyre"},
    {name = "wheel_lm", index = 2, type = "tyre"},
    {name = "wheel_rm", index = 3, type = "tyre"},
    {name = "wheel_lr", index = 4, type = "tyre"},
    {name = "wheel_rr", index = 5, type = "tyre"},
    {name = "wheel_lm1", index = 2, type = "tyre"},
    {name = "wheel_rm1", index = 3, type = "tyre"},
    {name = "door_dside_f", index = 0, type = "door"},
    {name = "door_pside_f", index = 1, type = "door"},
    {name = "door_dside_r", index = 2, type = "door"},
    {name = "door_pside_r", index = 3, type = "door"},
    {name = "bonnet", index = 4, type = "door"},
    {name = "boot", index = 5, type = "door"},
}

function AnimationTask(entity, coordsType, coordsOrigin, coordsDist, animationType, animDict, animName, animFlag)
    local self = {}

    self.active = true

    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local playerCoords, coords = GetEntityCoords(playerPed)

        if animationType == "scenario" then
            TaskStartScenarioInPlace(playerPed, animDict, 0, true)
        elseif animationType == "normal" then
            LoadAnimationDic(animDict)
        end

        while self.active do
            local idle = 100

            playerCoords = GetEntityCoords(playerPed)

            if coordsType == "bone" then
                coords = GetWorldPositionOfEntityBone(entity, coordsOrigin)
            else
                coords = GetEntityCoords(entity)
            end

            if animationType == "normal" and not IsEntityPlayingAnim(playerPed, animDict, animName, 3) then
                TaskPlayAnim(playerPed, animDict, animName, -8.0, -8.0, -1, animFlag, 0, 0, 0, 0)
            end

            if #(coords - playerCoords) > coordsDist then
                self.abort()
            end

            Citizen.Wait(idle)
        end

        if animationType == "scenario" then
            ClearPedTasks(playerPed)
        else
            StopAnimTask(playerPed, animDict, animName, 1.5)
        end
    end)

    self.abort = function()
        self.active = false
    end

    return self
end

function GetValidBones(entity, list)
    local bones = {}

    for _, bone in ipairs(list) do
        local boneID = GetEntityBoneIndexByName(entity, bone.name)

        if boneID ~= -1 then
            if bone.type == "door" and not IsVehicleDoorDamaged(entity, bone.index) or bone.type == "tyre" and not IsVehicleTyreBurst(entity, bone.index, 1) then
                bone.id = boneID
                bones[#bones + 1] = bone
            end

        end
    end

    return bones
end

function GetClosestBone(entity, list)
    local playerCoords, bone, coords, distance = GetEntityCoords(PlayerPedId())

    for _, element in pairs(list) do
        local boneCoords = GetWorldPositionOfEntityBone(entity, element.id or element)
        local boneDistance = GetDistanceBetweenCoords(playerCoords, boneCoords, true)

        if not coords then
            bone, coords, distance = element, boneCoords, boneDistance
        elseif distance > boneDistance then
            bone, coords, distance = element, boneCoords, boneDistance
        end
    end

    if not bone then
        bone = {id = GetEntityBoneIndexByName(entity, "bodyshell"), type = "remains", name = "bodyshell"}
        coords = GetWorldPositionOfEntityBone(entity, bone.id)
        distance = #(coords - playerCoords)
    end

    return bone, coords, distance
end

function ChopVehicleTyre(vehicle, boneID, tyreIndex)
    if IsVehicleTyreBurst(vehicle, tyreIndex, 1) then return end

    local task = AnimationTask(vehicle, "bone", boneID, 1.2, "normal", "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1)

    local finished = 0
    QBCore.Functions.Progressbar("ScrappingCar", "Scrapping Car", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        finished = 100
        Wait(100)
        local success = finished == 100 and task.active == true

        task.abort()
        ClearPedTasks(PlayerPedId())
        if success then
            SetVehicleTyreBurst(vehicle, tyreIndex, true, 1000.0)
        end
    
        return success
    end)
end

function ChopVehicleDoor(vehicle, boneID, doorIndex)
    if IsVehicleDoorDamaged(vehicle, doorIndex) then return end

    SetVehicleDoorOpen(vehicle, doorIndex, 0, 1)

    local task = AnimationTask(vehicle, "bone", boneID, 1.6, "scenario", "WORLD_HUMAN_WELDING")

    local finished = 0

    QBCore.Functions.Progressbar("ScrappingCar2", "Scrapping Car", 14000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        finished = 100
        Wait(100)
        local success = finished == 100 and task.active == true

        task.abort()
        ClearPedTasks(PlayerPedId())
        if success then
            SetVehicleDoorBroken(vehicle, doorIndex, 1)
        end
    
        return success
    end)
end

function ChopVehicleRemains(vehicle, boneID)
    local task = AnimationTask(vehicle, "bone", boneID, 1.8, "normal", "mp_car_bomb", "car_bomb_mechanic", 17)

    local finished = 0

    QBCore.Functions.Progressbar("ScrappingCar3", "Scrapping Car", 25000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        finished = 100
        Wait(100)

        local success = finished == 100 and task.active == true

        task.abort()
        ClearPedTasks(PlayerPedId())
        if success then
            TriggerEvent('rho-chopshop-finished', vehicle)
        end
    
        return success
    end)
end

RegisterNetEvent('delete-car', function(veh)
    DeleteEntity(veh)
end)

function ChopVehiclePart(vehicle)
    if not DoesEntityExist(vehicle) then return end

    local vehicleModel = GetEntityModel(vehicle)

    local boneList = GetValidBones(vehicle, VehicleChopBones)

    local bone, coords, distance = GetClosestBone(vehicle, boneList)

    local success = false

    PedFaceCoord(PlayerPedId(), coords)

    if bone.type == "tyre" and distance < 1.2 then
        success = ChopVehicleTyre(vehicle, bone.id, bone.index)
    elseif bone.type == "door" and distance < 1.6 then
        success = ChopVehicleDoor(vehicle, bone.id, bone.index)
    elseif bone.type == "remains" and distance < 1.8 then
        success = ChopVehicleRemains(vehicle)
    end

    return success, bone.type, vehicleModel
end

function InteractiveChopping(vehicle)
    if ActiveChopping[vehicle] then return end

    local state = { active = true }
    local netId = NetworkGetNetworkIdFromEntity(vehicle)

    ActiveChopping[vehicle] = state

    local boneList = GetValidBones(vehicle, VehicleChopBones)

    Citizen.CreateThread(function()
        while state.active do
            boneList = GetValidBones(vehicle, VehicleChopBones)

            Citizen.Wait(100)
        end
    end)

    Citizen.CreateThread(function()
        while state.active do
            local idle = 500

            local bone, coords, distance = GetClosestBone(vehicle, boneList)

            if not IsInsideVehicle and distance and distance <= 10.0 then
                local inDistance, chopText

                if bone.type == "door" and distance <= 1.6 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Door"
                elseif bone.type == "tyre" and distance <= 1.6 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Tyre"
                elseif bone.type == "remains" and distance <= 1.8 then
                    inDistance, chopText = true, "Press ~w~~g~[E]~w~ to Chop Vehicle Remains"
                end

                if inDistance then
                    Draw3DText(coords.x, coords.y, coords.z, chopText)

                    if IsControlJustReleased(0, 38) then
                        local success, boneType, vehicleModel = ChopVehiclePart(vehicle)

                        if success then
                            TriggerServerEvent('chopshop:chopVehicle')
                        end
                    end
                end

                idle = 0
            end

            if not distance or distance > 10.0 then
                state.active = false
            end

            Citizen.Wait(idle)
        end

        ActiveChopping[vehicle] = nil
    end)
end

exports('InteractiveChopping', InteractiveChopping)

function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)   
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        offset = offset - 1
        if vehicle ~= 0 then break end
    end
    
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    if distance > 25 then vehicle = nil end
    return vehicle ~= nil and vehicle or 0
end

RegisterCommand('chop', function ()
    if canChop then
        local coordA = GetEntityCoords(PlayerPedId(), 1)
        local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
        local curVeh = getVehicleInDirection(coordA, coordB)
        if curVeh == nil then return end
        local dist = checkDist()
        if dist then
            TriggerServerEvent('chopshop:check', GetVehicleNumberPlateText(curVeh), curVeh)
        else
            TriggerEvent('notify', 'You are not in correct zone!', 2)
        end
    end
end, false)

RegisterNetEvent('chopshop:check:client', function(cb, curVeh)
    if cb then
        InteractiveChopping(curVeh)
    end
end)