if not um.main.property.apartmentStatus or GetResourceState('ps-housing') ~= 'started' then return end

Debug('ps-housing for apartments')

lib.callback.register('getApartments', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local apartments = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ? AND apartment IS NOT NULL', { citizenid })

    local found = apartments[1] ~= nil
    Debug(found and 'Apartments: Found Apartments' or 'Apartments: Not Found')

    return found and apartments[1] or false
end)