function registerTarget(data)
   if Config.TargetSystem then
        exports[Config.TargetSystem]:AddBoxZone(data['name'], vector3(data['coords']['x'], data['coords']['y'], data['coords']['z']), data['height'], data['width'], {
            name = data['name'],
            heading = data['heading'],
            debugPoly = false,
            minZ = data['minZ'],
            maxZ = data['maxZ'],
        }, {
            options = data['options'],
            distance = data['distance']
        })
    end
end

function removeTarget(name)
    if Config.TargetSystem then
        exports[Config.TargetSystem]:RemoveZone(name)
    end
end