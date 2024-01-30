local currentProp = nil

RegisterNetEvent('av_restaurant:useItem')
AddEventHandler('av_restaurant:useItem', function(metadata)
    local ped = PlayerPedId()
    local type = metadata['type']
    local ingredients = metadata['ingredients']
    local prop = metadata['prop']
    local vehicle = GetVehiclePedIsIn(ped, false)
    if prop and Config.Animations[prop] then
        local animData = Config.Animations[prop]
        local movement = 1
        if animData['canWalk'] then
            movement = 63
        end
        if vehicle ~= 0 then
            movement = 51
        end
        lib.requestAnimDict(animData['dict'], 10000)
        TaskPlayAnim(ped, animData['dict'], animData['animation'], 1.0, 1.0, -1, movement, 0, 0, 0, 0)
        if animData['prop'] then
            local hash = animData['prop']
            if IsModelInCdimage(hash) then
                lib.requestModel(animData['prop'], 20000)
                local coords = GetEntityCoords(ped)
                currentProp = CreateObject(hash, coords, true, true, true)
                while not currentProp do Wait(0) end
                AttachEntityToEntity(currentProp, ped, GetPedBoneIndex(ped, animData['bone']), animData['offset'][1], animData['offset'][2], animData['offset'][3], animData['offset'][4], animData['offset'][5], animData['offset'][6], true, true, false, false, 1, true)
            else
                print("[WARNING] Prop model "..animData['prop'].." doesn't exist in your server, this is NOT a script error.")
            end
        end
        Wait(animData['time'])
        while DoesEntityExist(currentProp) do
            SetEntityAsMissionEntity(currentProp)
            DeleteEntity(currentProp)
            Wait(1)
        end
        currentProp = nil
        ClearPedTasks(ped)
    else
        if type == 'drink' then
            lib.requestAnimDict("mp_player_intdrink", 10000)
            TaskPlayAnim(ped, "mp_player_intdrink", "loop_bottle", 1.0, 1.0, -1, 51, 0, 0, 0, 0)
            Wait(Config.DrinkAnimDuration)
            ClearPedTasks(ped)
        end
        if type == 'food' then
            lib.requestAnimDict("mp_player_inteat@burger", 10000)
            TaskPlayAnim(ped, "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0, 1.0, -1, 51, 0, 0, 0, 0)
            Wait(Config.EatAnimDuration)
            ClearPedTasks(ped)
        end
        if type == 'joint' then
            if not IsPedInAnyVehicle(ped,true) then
                local model = GetEntityModel(ped)
                if model == -1667301416 then -- Female
                    lib.requestAnimDict("amb@world_human_smoking@female@idle_a", 10000)
                    TaskPlayAnim(ped, "amb@world_human_smoking@female@idle_a", "idle_b", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
                    Wait(Config.JointAnimDuration)
                    ClearPedTasks(ped)
                else
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_DRUG_DEALER', 0, true)
                    Wait(Config.JointAnimDuration)
                    ClearPedTasks(ped)
                end
            end
        end
    end
    EatDrink(type, ingredients)
    if ingredients then
        triggerBuff(ingredients)
    end
end)