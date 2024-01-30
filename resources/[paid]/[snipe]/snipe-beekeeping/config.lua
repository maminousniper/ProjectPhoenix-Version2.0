Config = {}

Config.Core = "QBCore" -- ESX or QBCore
Config.CoreFolderName = "qb-core"  -- es_extended || qb-core

Config.PlayerLoadedEvent = "QBCore:Client:OnPlayerLoaded" -- esx:playerLoaded || QBCore:Client:OnPlayerLoaded
Config.PlayerUnloadEvent = "QBCore:Client:OnPlayerUnload" -- esx:onPlayerLogout || QBCore:Client:OnPlayerUnload     

Config.Inventory = "ox" -- qb | ox | qs
Config.Target = "qtarget"  -- || qb-target || qtarget (if you use ox_target, just select qb-target if using QBCore and qtarget if using ESX)

Config.Progress = "ox" -- qb | ox

-- You will get soil hash in f8 when you enable Config.Debug
Config.SoilHash = {
    [510490462] = true
}

Config.BeehiveProps = {
    ["closed"] = {
        Prop = "beehive_closed",
    },
    ["open"] = {
        Prop = "beehive_open",
    },
}

Config.LimitBeehives = true -- Set to true if you want to limit the number of beehives a player can have at a time.
Config.OnlyOwnerCanCheckBeehive = true -- Set to true if you want only the owner of the beehive to be able to check the beehive progress.
Config.MaxBeehives = 1 -- Maximum number of beehives a player can have at a time.

--[[
    If you set Config.AllowHiveReuse to true, then Config.DeleteHarvestedBeehives should be false else the beehive might be removed.
    If there are way too many props and players are not destroying, I would suggest to Destroy the beehives because it might cause Crashing issues.
    Do not keep both true at the same time.
    If you keep both false, players will be able to use the beehive once and it wont delete automatically unless they destroy it.
    The best combination is to keep Config.AllowHiveReuse to false and Config.DeleteHarvestedBeehives to true.
]]--
Config.DeleteHarvestedBeehives = true -- deletes harvested beehives at the next cycle. 
Config.AllowHiveReuse = false -- allows beehives to be used again after bee harvesting. you need to add queen beehive again and progress resets to 0.

Config.MinimumPercentForOpenProp = 70 -- the minimum percent of progress to change the prop from closed to open Beehive

Config.GrowthRate = 10 --Increase in progress of beehive in % every cycle
Config.CycleTime = 15  --Cycle time in minutes

Config.Debug = false -- Only set to true while testing because this spams a print statement with the soil hash. Used to gather soil hash to add in Config.

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
    ['ESX'] = false,
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "Container" --Title that displays on okoknotify

Config.Locale = {
    --notify and progressbar
    ["cancel"] = "Cancelled..",
    ["placing_info"] = "Press E to place or Backspace to cancel. Arrow Keys to Rotate",
    ["placing"] = "Placing Beehive",
    ["destroying"] = "Destroying Beehive",
    ["too_far"] = "You are trying to place the beehive too far!",
    ["adding_queen_bee"] = "Adding Queen Bee",
    ["no_queen_bee"] = "You dont have Queen Bee",
    ["inventory_full_error"] = "Not enough space to carry!",
    ["harvesting_honey"] = "Harvesting Honey",
    ["invalid_hash"] = "Soil Not Suitable",

    -- menu related
    ["menu_title"] = "Beehive",
    ["menu_progress"] = "Progress",
    ["menu_queen_bee"] = "Queen Bee",
    ["menu_harvest"] = "Harvest",
    ["menu_destroy"] = "Destroy",
    ["menu_queen_bee_added"] = "Queen Bee Added",
    ["menu_add_queen_bee"] = "Add Queen Bee",
    ["menu_harvest_honey"] = "Harvest Honey",
    ["menu_honey_harvested"] = "Honey Harvested, This container is empty",

    ["not_your_beehive"] = "This is not your beehive",
    ["already_placed_beehive"] = "You have already placed a beehive",
    ["not_ready_error"] = "Beehive is not ready yet!",

    ["already_harvested"] = "This beehive is already harvested, cannot add queen bee to it"
}

Config.BeehiveItemName = "beehive" --the item name of the beehive

Config.Items = {
    QueenBee = "queen_bee", -- item name of queen bee (added for testing)

    ReturnItems = {
        [1] = {itemName = "honey", amount = math.random(1,10)}, -- 
        [2] = {itemName = "wax", amount = 10}, 
        [3] = {itemName = "jelly", amount = 10},
    }
}

-- Animation dictionary and name for each progressbar. You can change it according to your liking if you want.

Config.Animations = {
    ["placing"] = {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        animName = "machinic_loop_mechandplayer",
    },
    ["destroy"] = {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        animName = "machinic_loop_mechandplayer",
    },
    ["harvest"] = {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        animName = "machinic_loop_mechandplayer",
    },
    ["adding_queen_bee"] = {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        animName = "machinic_loop_mechandplayer",
    }
}