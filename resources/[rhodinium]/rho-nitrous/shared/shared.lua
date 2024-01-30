Config = Config or {}

-- SETTINGS
Config.ConnectNitrous = 7500 -- Time in miliseconds it takes to connect the bottle of nitrous (ProgressBar)
Config.TurboNeeded = true -- Toggle if you want turbo required to be on the vehicle to install a nitrous bottle
Config.NoBikes = false -- Toggle if you want nitrous on bikes
Config.EngineOff = true -- Toggle if you require the engine to be off to install nitrous

Config.IncreasePressure = true -- Increasing pressure requires the player to purge to be able to use nitrous again
Config.PressureMultiplier = 4 -- If enabled above, then this is the multiplier for increasing pressure when using nitrous
Config.PurgeConsumptionMultiplier = 6 -- If enabled above then when purging this is the multiplier to relieve the pressure

Config.DecreaseNitrous = true -- Do you wanna decrease nitrous on usage ?

Config.ScreenShake = true -- Screenshake effect
Config.ScreenSpeed = 85.0 -- MPH for vehicle to be at to start the effect

-- Config for flow rate ( 10 stages ) | Only modify if you know what you're doing
Config.FlowRate = {
    [1] = {
        flow = 0.3, -- Size of the purge flow for this flow rate
        power = 5.0, -- Amount of power the vehicle does for this flow rate
        consumption = 1.15, -- How much nitrous is consumed at this flow rate
    },
    [2] = {
        flow = 0.4,
        power = 7.0,
        consumption = 1.2,
    },
    [3] = {
        flow = 0.4,
        power = 10.0,
        consumption = 1.25,
    },
    [4] = {
        flow = 1.8,
        power = 13.0,
        consumption = 1.3,
    },
    [5] = {
        flow = 0.6,
        power = 15.0,
        consumption = 1.35,
    },
    [6] = {
        flow = 0.7,
        power = 17.0,
        consumption = 1.4,
    },
    [7] = {
        flow = 0.8,
        power = 20.0,
        consumption = 1.45,
    },
    [8] = {
        flow = 1.0,
        power = 23.0,
        consumption = 1.5,
    },
    [9] = {
        flow = 1.2,
        power = 26.0,
        consumption = 1.55,
    },
    [10] = {
        flow = 1.4,
        power = 30.0,
        consumption = 1.6,
    },
}

Config.Language = {
    modepurge = 'Mode: Purge',
    modenitrous = 'Mode: Nitrous',
    progressbarfill = 'Filling Nitrous',
    progressbarload = 'Loading Nitrous',
    nobikes = 'Cannot load nitrous on a bike',
    turboneeded = 'You\'re missing turbo in this vehicle',
    engineoff = 'Engine must remain off',
    flowrate = 'Nitrous Flowrate: ',
    canceled = 'Canceled',
}