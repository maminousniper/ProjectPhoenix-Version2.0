function ExecuteCallback(name, delay, data)
    local p = promise.new()
    p:resolve(lib.callback.await(name, delay, data))
    return Citizen.Await(p)
end

function RegisterCallback(name, cb)
    return lib.callback.register(name, cb)
end

function AddBoxZone(coords, size, options)
    return exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        options = options
    })
end

function RemoveZone(id)
    exports.ox_target:removeZone(id)
end

function Notify(title, text, type)
    lib.notify({
        title = title,
        description = text,
        type = text
    })
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    OnEnterSync()
end)
