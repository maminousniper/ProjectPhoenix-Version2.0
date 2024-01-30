function ExecuteCallback(name, delay, data)
    local p = promise.new()
    p:resolve(lib.callback.await(name, delay, data))
    return Citizen.Await(p)
end

function RegisterCallback(name, cb)
    return lib.callback.register(name, cb)
end
