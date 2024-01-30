Config = {}

Config.Debug = false         -- Set to true for debug mode (shows client/server tables in console)

Config.GKSPhone = false      -- Set to true if using gks phone, false for qb-phone

Config.LockOnFlag = true    -- Set to true to lock front plate reader on flagged status
Config.NotifDuration = 6000  -- Time until scan notification disappears (default = 6sec)
Config.OxTarget = true      -- Set True if using ox-target, false will use qb-target

Config.AllowedVehicles = {
    [1] = {model = "npolvic", label = 'Ford Crown Victoria'},
    [2] = {model = 'npolstang', label = 'Ford Mustang 2021'},
    [3] = {model = 'npolvette', label = 'Chevrolet Corvette C8'},
    [4] = {model = 'npolchar', label = 'Charger Hellcat'},
    [5] = {model = 'npolchal', label = 'Challenger'},
    [6] = {model = 'npolexp', label = 'Explorer'},

}

Config.GTAVSounds = {        -- Frontend sounds from GTAV (https://wiki.gtanet.work/index.php?title=FrontEndSoundlist)
    good = {
        name = "5_Second_Timer",
        ref = "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS",
    },
    bad = {
        name = "Event_Message_Purple",
        ref = "GTAO_FM_Events_Soundset",
    },
}