
--[[ Example
    ['Innocence'] = {
    settings = {
        label = 'Bennys Motorworks', -- Text label for anything that wants it
        welcomeLabel = "Welcome to Benny's Motorworks!", -- Welcome label in the UI
        enabled = true, -- If the location can be used at all
    },
    blip = {
        label = 'Bennys Motorworks',
        coords = vector3(-205.6992, -1312.7377, 31.1588),
        sprite = 72,
        scale = 0.65,
        color = 0,
        display = 4,
        enabled = true,
    },
    categories = { -- Only include the categories you want. A category not listed defaults to FALSE.
        mods = true, -- Performance Mods
        repair = true,
        armor = true,
        respray = true,
        liveries = true,
        wheels = true,
        tint = true,
        plate = true,
        extras = true,
        neons = true,
        xenons = true,
        horn = true,
        turbo = true,
        cosmetics = true, -- Cosmetic Mods
    },
    drawtextui = {
        text = "Bennys Motorworks",
    },
    restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "any", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        gang = "any", -- Allowed gang. Can be an array of strings for multiple gangs. Any for all gangs
        allowedClasses = {}, -- Array of allowed classes. Empty will allow any but denied classes.
        deniedClasses = {}, -- Array of denied classes.
    },
    zones = {
        { coords = vector3(-212.55, -1320.56, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
        { coords = vector3(-222.47, -1329.73, 31.0), length = 6.0, width = 4.4, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
    }
},

Vehicle Classes:
0: Compacts     1: Sedans       2: SUVs         3: Coupes       4: Muscle       5: Sports Classics
6: Sports       7: Super        8: Motorcycles  9: Off-road     10: Industrial  11: Utility
12: Vans        13: Cycles      14: Boats       15: Helicopters 16: Planes      17: Service
18: Emergency   19: Military    20: Commercial  21: Trains
 ]]

Config.Locations = {
    --[[ ['Innocence'] = {
        settings = {
            label = 'Bennys Motorworks',
            welcomeLabel = "Welcome to Benny's Motorworks!",
            enabled = true,
        },
        blip = {
            label = 'Bennys Motorworks',
            coords = vector3(-205.6992, -1312.7377, 31.1588),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            armor = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Bennys Motorworks"
        },
        craft = vector4(-217.3398, -1318.981, 30.86243, 82.97017),
        job = 'mechanic',
        restrictions = {},
        zones = {
            { coords = vector3(-212.55, -1320.56, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
            { coords = vector3(-222.47, -1329.73, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
        }
    },

    ['Popular'] = {
        settings = {
            label = 'Customs Motorworks',
            welcomeLabel = "Welcome to Customs Motorworks!",
            enabled = true,
        },
        blip = {
            label = 'Bennys Motorworks',
            coords = vector3(725.8828, -1088.7747, 22.1693),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Customs Motorworks"
        },
        craft = vector4(738.4687, -1078.092, 22.16873, 318.8235),
        job = 'mechanic',
        restrictions = {},
        zones = {
            { coords = vector3(732.99, -1075.0, 22.17), length = 6.0, width = 4.0, heading = 180.0, minZ = 21.0, maxZ = 25.0 },
            { coords = vector3(731.47, -1088.91, 22.17), length = 6.0, width = 4.0, heading = 90.0, minZ = 21.0, maxZ = 25.0 },
        }
    },

    ['Harmony'] = {
        settings = {
            label = 'Harmony Motorworks',
            welcomeLabel = "Welcome to Harmony Motorworks!",
            enabled = true,
        },
        blip = {
            label = 'Bennys Motorworks',
            coords = vector3(1178.3921, 2640.5449, 37.7539),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Harmony Motorworks"
        },
        craft = vector4(1175.485, 2634.914, 38.00024, 178.3753),
        job = 'mechanic',
        restrictions = {},
        zones = {
            { coords = vector3(1182.11, 2640.3, 37.75), length = 6.0, width = 4.0, heading = 0.0, minZ = 36.0, maxZ = 40.0 },
            { coords = vector3(1174.78, 2640.17, 37.75), length = 6.0, width = 4.0, heading = 0.0, minZ = 36.0, maxZ = 40.0 },
        }
    },

    ['Paleto'] = {
        settings = {
            label = 'Billys Motorworks',
            welcomeLabel = "Welcome to Billys Motorworks!",
            enabled = true,
        },
        blip = {
            label = 'Bennys Motorworks',
            coords = vector3(108.3242, 6624.0996, 31.7873),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Billys Motorworks"
        },
        craft = vector4(105.6461, 6629.52, 32.04002, 31.52158),
        job = 'mechanic',
        restrictions = {},
        zones = {
            { coords = vector3(110.93, 6626.51, 31.79), length = 6.0, width = 4.0, heading = 225.0, minZ = 30.5, maxZ = 34.5 },
            { coords = vector3(105.8, 6621.43, 31.79), length = 6.0, width = 4.0, heading = 225.0, minZ = 30.5, maxZ = 34.5 },
        }
    }, ]]

    ['Tunershop'] = {
        settings = {
            label = 'Tunershop',
            welcomeLabel = "Welcome to the Tunershop!",
            enabled = true,
        },
        blip = {
            label = 'Tunershop',
            coords = vector3(140.6093, -3030.3933, 7.0409),
            sprite = 446,
            scale = 0.65,
            color = 83,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Tunershop",
            icon = "material-icons",
            materialIcon = 'construction',
        },
        craft = vector4(134.82102, -3051.248, 7.5844068, 176.07765),
        job = 'mechanic',
        restrictions = {},
        zones = {
            { coords = vector3(144.96, -3030.46, 7.06), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
            { coords = vector3(135.92, -3030.5, 7.04), length = 6.0, width = 4.0, heading = 180.0, minZ = 6.0, maxZ = 10.0 },
        }
    },
}