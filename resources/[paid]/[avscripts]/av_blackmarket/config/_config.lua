Config = {}
Config.TargetSystem = "qb-target" -- qb-target or qtarget, if using ox_target it will automatically convert it
Config.BlipCoords = {2168.10, 3330.53, 46.81}
Config.BlipIcon = 306
Config.BlipScale = 0.7
Config.BlipColor = 3

Config.Categories = {
    ['hacker'] = { 
        label = "Hacker", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            return true
        end,
        items = {
            {name = "dongle", label = "Dongle", stock = 20, price = 10, account = "gne", accountLabel = "GNE"},
            {name = "hacking_device", label = "Hacking Device", stock = 5, price = 12, account = "gne", accountLabel = "GNE"},
            {name = "fakeplate", label = "Fake Plate", stock = 5, price = 35, account = "gne", accountLabel = "GNE"},
        }
    }, 
    ['illegal'] = { 
        label = "Illegals", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] then -- If is member of any gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "thermite", label = "Thermite", stock = 20, price = 4, account = "gne", accountLabel = "GNE"},
        }
    }, 
    ["drugs"] = { 
        label = "Drugs", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] then -- If is member of any gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "maleseed", label = "Male Seed", category = "drugs", stock = 50, price = 6, account = "gne", accountLabel = "GNE"},
            {name = "qualityscales", label = "High Quality Scales", category = "drugs", stock = 50, price = 12, account = "gne", accountLabel = "GNE"},
        }
    },
    ["weapons"] = { 
        label = "Weapons", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] == "ballas" then -- If is member of Ballas gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "weapon_pistol", label = "Pistol", category = "weapons", stock = 5, price = 5000, account = "gne", accountLabel = "GNE"},
        }
    },
}