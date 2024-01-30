---- MRPD Doors ----

Config.DoorList['bollards'] = {
    authorizedJobs = { ['police'] = 0 },
    pickable = false,
    distance = 10,
    doors = {
        {objName = -1868050792, objYaw = 269.99661254883, objCoords = vec3(410.025787, -1024.225952, 29.220221)},
        {objName = -1635161509, objYaw = 270.0, objCoords = vec3(410.025787, -1024.219971, 29.220200)}
    },
    doorRate = 1.0,
    audioRemote = true,
    doorType = 'garage',
    locked = true,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['garagedoor1'] = {
    distance = 10,
    pickable = false,
    objYaw = 0.0,
    audioRemote = false,
    doorRate = 1.0,
    objCoords = vec3(452.300507, -1000.771667, 26.696609),
    authorizedJobs = { ['police'] = 0 },
    doorType = 'garage',
    locked = true,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    fixText = false,
    objName = 2130672747,
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['garagedoor2'] = {
    distance = 10,
    pickable = false,
    objYaw = 0.0,
    audioRemote = false,
    doorRate = 1.0,
    objCoords = vec3(431.411926, -1000.771667, 26.696609),
    authorizedJobs = { ['police'] = 0 },
    doorType = 'garage',
    locked = true,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    fixText = false,
    objName = 2130672747,
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['backgate'] = {
    doorRate = 1.0,
    objName = -1603817716,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['police'] = 0 },
    objCoords = vec3(488.894806, -1017.211975, 27.149349),
    doorType = 'sliding',
    locked = true,
    distance = 6,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

---- Tuner Doors ----

Config.DoorList['Tuner Gate 1'] = {
    doorRate = 1.0,
    objName = -456733639,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['mechanic'] = 0 },
    objCoords = vec3(154.8404, -3023.889, 8.649611),
    doorType = 'sliding',
    locked = true,
    distance = 5,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['Tuner Gate 2'] = {
    doorRate = 1.0,
    objName = -456733639,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['mechanic'] = 0 },
    objCoords = vec3(154.866, -3034.051, 9.118645),
    doorType = 'sliding',
    locked = true,
    distance = 5,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

---- Hayes Auto ----

Config.DoorList['Hayes Gate 1'] = {
    doorRate = 1.0,
    objName = 1715394473,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['mechanic'] = 0 },
    objCoords = vec3(-1414.8680419921876, -436.36761474609377, 34.77352142333984),
    doorType = 'sliding',
    locked = true,
    distance = 4,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['Hayes Gate 2'] = {
    doorRate = 1.0,
    objName = 1715394473,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['mechanic'] = 0 },
    objCoords = vec3(-1421.1180419921876, -440.2720031738281, 34.77352142333984),
    doorType = 'sliding',
    locked = true,
    distance = 4,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

Config.DoorList['Hayes Gate 3'] = {
    doorRate = 1.0,
    objName = 1715394473,
    audioRemote = false,
    fixText = false,
    pickable = false,
    authorizedJobs = { ['mechanic'] = 0 },
    objCoords = vec3(-1427.3260498046876, -444.151611328125, 34.77352142333984),
    doorType = 'sliding',
    locked = true,
    distance = 4,
    objYaw = 90.0,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000,
}

