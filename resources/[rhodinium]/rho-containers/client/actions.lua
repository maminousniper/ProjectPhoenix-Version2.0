--                _
--               | |
--   _____      _| | _____  ___ _ __
--  / __\ \ /\ / / |/ / _ \/ _ \ '_ \
--  \__ \\ V  V /|   <  __/  __/ |_) |
--  |___/ \_/\_/ |_|\_\___|\___| .__/
--                             | |
--                             |_|
-- https://github.com/swkeep
local function LoadAnimationDict( animation )
    RequestAnimDict(animation)
    while not HasAnimDictLoaded(animation) do Wait(25) end
end

local function makeEntityFaceCoord( entity, coord )
    local p1 = GetEntityCoords(entity, true)

    SetEntityHeading(entity, GetHeadingFromVector_2d((coord.x - p1.x), (coord.y - p1.y)))
end

local function open_animation()
    if Framework() == 2 then Wait(1000) end
    LoadAnimationDict("amb@prop_human_bum_bin@idle_b")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 1, false, false, false)
end

local function close_aimation()
    LoadAnimationDict("amb@prop_human_bum_bin@idle_b")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
    Wait(1500)
    ClearPedTasks(PlayerPedId())
end

local function Close()
    local duration = 1
    close_aimation()
end

local function open_stash( metadata )
    local id = "Container_" .. metadata.random_id
    
    exports["ox_inventory"]:openInventory("stash", {
        id = id
        })
    open_animation()
    

    Wait(1500)
    repeat Wait(100) until IsNuiFocused() == false
    Close()
end

RegisterNetEvent("keep-containers:client:open", function( metadata )
    if not metadata then return end
    local duration = 1 
    if lib.progressCircle({
        duration = 2000,
        position = "bottom",
        label = 'Opening container',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_ped'
        },
    }) then
        open_stash(metadata)
    else
        print("Do stuff when cancelled")
    end

end)
