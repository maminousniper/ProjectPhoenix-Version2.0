RPC.register("rho-drifting:server:checkVehicle", function(src, plate)
    local result = exports.oxmysql:executeSync('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] == '[]' or result[1] == nil then return end
    if result[1].driftEnabled == 1 then
        return true
    else
        return false
    end
end)
