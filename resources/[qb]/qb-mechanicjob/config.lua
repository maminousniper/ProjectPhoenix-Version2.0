Config = {}

-- **** IMPORTANT ****
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Targets = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    -- "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = Lang:t('labels.engine'),
    ["body"] = Lang:t('labels.bodsy'),
    ["radiator"] = Lang:t('labels.radiator'),
    ["axle"] = Lang:t('labels.axle'),
    ["brakes"] = Lang:t('labels.brakes'),
    ["clutch"] = Lang:t('labels.clutch'),
    ["fuel"] = Lang:t('labels.fuel'),
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

--A CLASS PARTS
Config.RepairCostAmountA = {
    ["engine"] = {
        item = "afixengine", 
    },
    ["body"] = {
        item = "afixbody",
    },
    ["radiator"] = {
        item = "afixradiator",
    },
    ["axle"] = { 
        item = "afixaxle",
    },
    ["brakes"] = {
        item = "afixbrakes",
    },
    ["clutch"] = {
        item = "afixclutch",
    },
    ["fuel"] = {
        item = "afixinjector",
    },
}

--B CLASS PARTS
Config.RepairCostAmountB = {
    ["engine"] = {
        item = "bfixengine", 
    },
    ["body"] = {
        item = "bfixbody",
    },
    ["radiator"] = {
        item = "bfixradiator",
    },
    ["axle"] = { 
        item = "bfixaxle",
    },
    ["brakes"] = {
        item = "bfixbrakes",
    },
    ["clutch"] = {
        item = "bfixclutch",
    },
    ["fuel"] = {
        item = "bfixinjector",
    },
}

--C CLASS PARTS
Config.RepairCostAmountC = {
    ["engine"] = {
        item = "cfixengine", 
    },
    ["body"] = {
        item = "cfixbody",
    },
    ["radiator"] = {
        item = "cfixradiator",
    },
    ["axle"] = { 
        item = "cfixaxle",
    },
    ["brakes"] = {
        item = "cfixbrakes",
    },
    ["clutch"] = {
        item = "cfixclutch",
    },
    ["fuel"] = {
        item = "cfixinjector",
    },
}

--D CLASS PARTS
Config.RepairCostAmountD = {
    ["engine"] = {
        item = "dfixengine", 
    },
    ["body"] = {
        item = "dfixbody",
    },
    ["radiator"] = {
        item = "dfixradiator",
    },
    ["axle"] = { 
        item = "dfixaxle",
    },
    ["brakes"] = {
        item = "dfixbrakes",
    },
    ["clutch"] = {
        item = "dfixclutch",
    },
    ["fuel"] = {
        item = "dfixinjector",
    },
}

--S CLASS PARTS
Config.RepairCostAmountS = {
    ["engine"] = {
        item = "sfixengine", 
    },
    ["body"] = {
        item = "sfixbody",
    },
    ["radiator"] = {
        item = "sfixradiator",
    },
    ["axle"] = { 
        item = "sfixaxle",
    },
    ["brakes"] = {
        item = "sfixbrakes",
    },
    ["clutch"] = {
        item = "sfixclutch",
    },
    ["fuel"] = {
        item = "sfixinjector", 
    },
}

--M CLASS PARTS
Config.RepairCostAmountM = {
    ["engine"] = {
        item = "mfixengine", 
    },
    ["body"] = {
        item = "mfixbody",
    },
    ["radiator"] = {
        item = "mfixradiator",
    },
    ["axle"] = { 
        item = "mfixaxle",
    },
    ["brakes"] = {
        item = "mfixbrakes",
    },
    ["clutch"] = {
        item = "mfixclutch",
    },
    ["fuel"] = {
        item = "mfixinjector",
    },
}

Config.Businesses = {
    "Hayes Autos Repairs",
}

Config.Plates = {
    [1] = {
        coords = vector4(-340.95, -128.24, 39, 160.0),
        boxData = {
            heading = 340,
            length = 5,
            width = 2.5,
            debugPoly = false
        },
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(-327.91, -144.34, 38.86, 70.34),
        boxData = {
            heading = 249,
            length = 6.5,
            width = 5,
            debugPoly = false
        },
        AttachedVehicle = nil,
    },
}

Config.Blip = {
    ['showBlip'] = true, -- change to false if you want to disable blip
    ['sprite'] = 478,
    ['display'] = 4,
    ['scale'] = 0.7,
    ['asShortRange'] = true,
    ['colour'] = 12,
    ['alpha'] = 0.7
}

Config.Locations = {
    ["exit"] = vector3(-1417.11, -445.35, 35.91), 
    ["duty"] = vector3(-323.39, -129.6, 39.01),
    ["stash"] = vector3(-319.49, -131.9, 38.98),
    ["vehicle"] = vector4(-370.51, -107.88, 38.35, 72.56),
}

Config.Vehicles = {
    ["flatbed"] = "Flatbed",
    ["towtruck"] = "Towtruck",
    ["minivan"] = "Minivan (Rental Car)",
    ["blista"] = "Blista",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
