local MySQL = MySQL
local db = {}

local INSERT_FARM = 'INSERT INTO `farms` (`x`, `y`, `z`, `heading`, spots) VALUES (?, ?, ?, ?, ?)'
function db.createFarm(coords, spots)
    return MySQL.prepare.await(INSERT_FARM, { coords.x, coords.y, coords.z, coords.w, json.encode(spots) })
end

local GET_FARMS = 'SELECT * FROM `farms`'
function db.getFarms()
    return MySQL.query.await(GET_FARMS)
end

return db