local currentCarryObject = nil

local function onLoad()
    LocalPlayer.state:set('carryItem', nil, true)
    TriggerServerEvent("carryItem:onUpdateInventory")
end

RegisterNetEvent('esx:playerLoaded', onLoad)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', onLoad)
RegisterNetEvent('ox:playerLoaded', onLoad)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        if currentCarryObject then
            DeleteEntity(currentCarryObject)
            ClearPedTasks(cache.ped)
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        LocalPlayer.state:set('carryItem', nil, true)
        TriggerServerEvent("carryItem:onUpdateInventory")
    end
end)

AddStateBagChangeHandler("carryItem", nil, function(bagName, key, propData, _unused, replicated)
    local ply = GetPlayerFromStateBagName(bagName)
    local plyPed = GetPlayerPed(ply)

    if ply == 0 or plyPed ~= cache.ped then return end

    if propData == nil then
        DeleteEntity(currentCarryObject)
        currentCarryObject = nil
        ClearPedTasks(cache.ped)
        return
    end

    if currentCarryObject then
        DeleteEntity(currentCarryObject)
        currentCarryObject = nil
    end

    lib.requestModel(propData.prop.model) 

    local plyPos = GetEntityCoords(cache.ped)
    lib.requestModel(propData.prop.model, 1000)
    currentCarryObject = CreateObject(propData.prop.model, plyPos.x, plyPos.y, plyPos.z + 0.2, true, true, true)
    SetEntityCollision(currentCarryObject, false, false)

    local placement = propData.prop.placement

    AttachEntityToEntity(
        currentCarryObject,
        cache.ped,
        GetPedBoneIndex(cache.ped, propData.prop.bone),
        placement.pos.x,
        placement.pos.y,
        placement.pos.z,
        placement.rot.x,
        placement.rot.y,
        placement.rot.z,
        true,
        true,
        false,
        true,
        1,
        true
    )

    if propData.dictionary ~= nil then
        lib.requestAnimDict(propData.dictionary, 1000)
    end

    while currentCarryObject do
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(cache.ped)) then
            ClearPedTasks(cache.ped)
            
        end
        if not IsEntityPlayingAnim(cache.ped, propData.dictionary, propData.animation, 3) then ---@todo may need to add dead checks and other things here as well
            TaskPlayAnim(cache.ped, propData.dictionary, propData.animation, 2.0, 2.0, -1, propData.flag, 0, false, false,
                false)
        end
        if propData.blockAttack then
            DisableControlAction(0, 24, true) -- disable attack
            DisableControlAction(0, 25, true) -- disable aim
            DisableControlAction(0, 47, true) -- disable weapon
            DisableControlAction(0, 58, true) -- disable weapon
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 142, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
        end

        if propData.blockCar and IsPedGettingIntoAVehicle(ped) then
            ClearPedTasksImmediately(ped) -- Stops all tasks for the ped
        end

        if propData.blockRun then
            DisableControlAction(0, 22, true) -- disable jumping
            DisableControlAction(0, 21, true) -- disable sprinting
        end
        Wait(5)
    end
end)

AddEventHandler('ox_inventory:updateInventory', function()
    TriggerServerEvent('carryItem:onUpdateInventory')
end)