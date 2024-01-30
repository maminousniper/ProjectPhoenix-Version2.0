if not um.main.property.apartmentStatus or GetResourceState('qb-apartments') ~= 'started' then return end

Debug('qb-apartments for apartments')

lib.callback.register('getApartments', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local apartments = MySQL.query.await('SELECT * FROM apartments WHERE citizenid = ?', { citizenid })

    local found = apartments[1] ~= nil
    Debug(found and 'Apartments: Found Apartments' or 'Apartments: Not Found')

    return found and apartments[1] or false
end)