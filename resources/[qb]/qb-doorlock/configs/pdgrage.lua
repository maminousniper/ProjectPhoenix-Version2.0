Config.DoorList['131'] = {
    distance = 8,
    doorRate = 1.0,
    locked = true,
    audioRemote = false,
    authorizedJobs = { ['police'] = 0 },
    doorType = 'doublesliding',
    doors = {
        {objName = -1635161509, objYaw = 269.99160766602, objCoords = vec3(410.025787, -1024.219971, 29.220200)},
        {objName = -1868050792, objYaw = 270.0, objCoords = vec3(410.025787, -1024.225952, 29.220221)}
    },
    pickable = false,
    audioLock = {['file'] = 'GarageClose.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'GarageOpen.ogg', ['volume'] = 0.7},
    --autoLock = 1000, -- Auto lock after this many miliseconds
    locked = true,
    remoteTrigger = true, -- true or false | If you want to be able to remote trigger a door with H, put this here
}