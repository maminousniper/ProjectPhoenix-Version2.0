local placeObject = exports['Renewed-Lib']:getLib().placeObject

local cSpots ={
    vec3(-5.5781, -1.1628, -0.0600), -- 1
    vec3(-4.8274, -1.1627, -0.0600), -- 2
    vec3(-4.0767, -1.1628, -0.0600), -- 3
    vec3(-3.3260, -1.1628, -0.0600), -- 4
    vec3(-2.5754, -1.1627, -0.0600), -- 5
    vec3(-1.8247, -1.1628, -0.0550), -- 6
    vec3(-1.0740, -1.1628, -0.0500), -- 7
    vec3(-0.3234, -1.1627, -0.0500), -- 8
    vec3(0.4273, -1.1628, -0.0600),  -- 9
    vec3(1.1780, -1.1627, -0.0600),  -- 10
    vec3(1.9287, -1.1628, -0.0600),  -- 11
    vec3(2.6794, -1.1628, -0.0600),  -- 12
    vec3(3.4300, -1.1627, -0.0600),  -- 13
    vec3(4.1807, -1.1628, -0.0600),  -- 14
    vec3(4.9314, -1.1628, -0.0600),  -- 15
    vec3(5.6821, -1.1627, -0.0600),  -- 16
    vec3(-5.5782, -0.3813, -0.0600), -- 17
    vec3(-4.8275, -0.3812, -0.0600), -- 18
    vec3(-4.0769, -0.3813, -0.0600), -- 19
    vec3(-3.3262, -0.3813, -0.0600), -- 20
    vec3(-2.5755, -0.3812, -0.0600), -- 21
    vec3(-1.8248, -0.3813, -0.0600), -- 22
    vec3(-1.0741, -0.3813, -0.0470), -- 23
    vec3(-0.3235, -0.3813, -0.0400), -- 24
    vec3(0.4272, -0.3813, -0.0530),  -- 25
    vec3(1.1779, -0.3812, -0.0520),  -- 26
    vec3(1.9286, -0.3813, -0.0400),  -- 27
    vec3(2.6792, -0.3813, -0.0470),  -- 28
    vec3(3.4299, -0.3812, -0.0600),  -- 29
    vec3(4.1806, -0.3813, -0.0600),  -- 30
    vec3(4.9313, -0.3813, -0.0600),  -- 31
    vec3(5.6819, -0.3813, -0.0600),  -- 32
    vec3(-5.5783, 0.4002, -0.0600),  -- 33
    vec3(-4.8276, 0.4001, -0.0600),  -- 34
    vec3(-4.0770, 0.4002, -0.0600),  -- 35
    vec3(-3.3264, 0.4002, -0.0600),  -- 36
    vec3(-2.5757, 0.4002, -0.0600),  -- 37
    vec3(-1.8250, 0.4002, -0.0600),  -- 38
    vec3(-1.0743, 0.4001, -0.0600),  -- 39
    vec3(-0.3237, 0.4002, -0.0550),  -- 40
    vec3(0.4270, 0.4002, -0.0450),   -- 41
    vec3(1.1777, 0.4001, -0.0450),   -- 42
    vec3(1.9284, 0.4002, -0.0450),   -- 43
    vec3(2.6791, 0.4001, -0.0400),   -- 44
    vec3(3.4297, 0.4002, -0.0400),   -- 45
    vec3(4.1804, 0.4002, -0.0600),   -- 46
    vec3(4.9311, 0.4001, -0.0600),   -- 47
    vec3(5.6818, 0.4002, -0.0600),   -- 48
    vec3(-5.5784, 1.1816, -0.0600),  -- 49
    vec3(-4.8277, 1.1816, -0.0600),  -- 50
    vec3(-4.0771, 1.1816, -0.0600),  -- 51
    vec3(-3.3264, 1.1816, -0.0600),  -- 52
    vec3(-2.5757, 1.1816, -0.0600),  -- 53
    vec3(-1.8251, 1.1816, -0.0600),  -- 54
    vec3(-1.0744, 1.1816, -0.0600),  -- 55
    vec3(-0.3237, 1.1817, -0.0600),  -- 56
    vec3(0.4270, 1.1816, -0.0600),   -- 57
    vec3(1.1777, 1.1816, -0.0600),   -- 58
    vec3(1.9284, 1.1816, -0.0600),   -- 59
    vec3(2.6791, 1.1816, -0.0600),   -- 60
    vec3(3.4297, 1.1816, -0.0600),   -- 61
    vec3(4.1804, 1.1817, -0.0600),   -- 62
    vec3(4.9311, 1.1816, -0.0600),   -- 63
    vec3(5.6817, 1.1817, -0.0600)    -- 64
}

local function createnew(coords, heading)
    lib.requestModel(`np_garden_001`)
    local object = CreateObject(`np_garden_001`, coords.x, coords.y, coords.z, false, false, false)
    SetEntityHeading(object, heading)
    SetEntityVisible(object, false)

    local points = {}

    for i = 1, #cSpots do
        local spot = cSpots[i]

        points[#points + 1] = GetOffsetFromEntityInWorldCoords(object, spot.x, spot.y, spot.z)
    end

    DeleteEntity(object)

    return points
end

lib.callback.register('Renewed-Farming:client:placeFarm', function()
    local coords, heading = placeObject(`np_garden_001`, 30.0, true, nil, nil, vec3(0.0, 0.0, -0.5))

    if not coords then return false end

    local locations = createnew(coords, heading)

    return vec4(coords.x, coords.y, coords.z, heading), locations
end)


AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
        DeleteObject(testObj)
   end
end)