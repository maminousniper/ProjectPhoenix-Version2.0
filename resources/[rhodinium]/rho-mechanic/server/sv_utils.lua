local QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

function hasItemFunction(source, name, amount)
    if Config.Inventory == 'qb' then
        return exports[Config.InventoryFolder]:HasItem(source, name, amount)
    elseif Config.Inventory == 'ox' then
        item = exports.ox_inventory:GetItem(source, name, nil, true)
        if tonumber(item) >= amount then
            return true
        end
        return false
    else
        print('uknown inventory')
    end
end

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.scalar.await('SELECT plate FROM ' .. Config.vehicleDataBase .. ' WHERE plate = ?', {plate})
    if result then retval = true end
    return retval
end