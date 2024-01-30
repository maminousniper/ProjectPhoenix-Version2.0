lib.callback.register('av_dealership:getVehicleBack', function(source,data)
    local src = source
    local identifier = data['identifier']
    local dealership = data['name']
    local plates = data['plates']
    local exists = MySQL.single.await('SELECT * FROM '..Config.VehiclesTable..' WHERE '..Config.OwnerColumn..' = ? AND plate = ?', {
        identifier, plates
    })
    if exists then
        if Config.Framework == "QBCore" then
            MySQL.update('UPDATE '..Config.VehiclesTable..' SET license = ?, '..Config.OwnerColumn..' = ? WHERE plate = ?', {
                dealership,
                dealership,
                plates
            }, function(affectedRows)
                TriggerClientEvent("av_dealership:notification",src, Lang['title'], Lang['vehicle_recovered'], "success")
            end)
        elseif Config.Framework == "ESX" then
            MySQL.update('UPDATE '..Config.VehiclesTable..' SET '..Config.OwnerColumn..' = ? WHERE plate = ?', {
                dealership,
                plates
            }, function(affectedRows)
                TriggerClientEvent("av_dealership:notification",src, Lang['title'], Lang['vehicle_recovered'], "success")
            end)
        else

        end
    else
        print("^1[ERROR] Dealership "..dealership.." tried to recover a vehicle but it doesn't exist in "..Config.VehiclesTable..", plates: "..plates.."^7")
        TriggerClientEvent("av_dealership:notification",src, Lang['title'], Lang['vehicle_not_found'], "error")
    end
    MySQL.query.await('DELETE FROM `av_financing` WHERE `plates` = ?', {
        plates
    })
    return getPayments(dealership)
end)

lib.callback.register('av_dealership:isFinanced', function(source,plates)
    return isFinanced(plates)
end)

lib.callback.register('av_dealership:getPayments', function(source,dealership)
    return getPayments(dealership)
end)