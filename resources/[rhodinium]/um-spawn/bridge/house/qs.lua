if not um.main.property.houseStatus or GetResourceState('qs-housing') ~= 'started' then return end

Debug('qs-housing for house')

lib.callback.register('getHouses', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', { citizenid })

    local found = houses[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')

    return found and houses or false
end)
