-- PLEASE READ THE DOCS BEFORE INSTALLING THE RESOURCE!!! 
-- PLEASE READ THE DOCS BEFORE INSTALLING THE RESOURCE!!! 
-- PLEASE READ THE DOCS BEFORE INSTALLING THE RESOURCE!!! 
-- https://docs.av-scripts.com/guides/dealerships/installation
-- https://docs.av-scripts.com/guides/dealerships/installation
-- https://docs.av-scripts.com/guides/dealerships/installation

Config = {}
Config.Debug = false -- Used to display some extra prints for debug
Config.Framework = "QBCore" -- Available options: "QBCore" or "ESX"
Config.UseQBCoreVehicles = true -- true it will grab the info from QBShared vehicles table (models, name, price, category)
Config.AdminCommand = "admin:dealership" -- Command used for admin panel
Config.AdminPermission = "admin" -- Needed permission to access admin panel
Config.PlayerCommand = "payments" -- Command for players to pay their financing / you can set to false (without " ") and just use the finance desk zones
Config.VehiclesTable = "player_vehicles" -- "player_vehicles" in QBCore or "owned_vehicles" in ESX
Config.OwnerColumn = "citizenid" -- "citizenid" in QBCore or "owner" in ESX
Config.ModsColumn = "mods" -- column where vehicle mods are stored, "vehicle" in ESX and "mods" for QBCore
Config.ModelColumn = "vehicle" -- "vehicle" for QBCore and "model" in ESX (import esx_db.sql first!!)
Config.TargetSystem = "qtarget" -- Available options: "qb-target", "qtarget" or false (without " "), if using ox_target just set "qtarget"
Config.MetadataInventory = true -- false if your inventory doesn't use metadata, read the docs for this
Config.BuyVehicleCommand = "buyvehicle" -- If not Config.MetadataInventory use this command to buy vehicles, contract item will NOT work for you!
Config.AccountName = "bank" -- Used to deposit/withdraw money from dealership and pay for vehicles
Config.ContractItem = "contract" -- Item used to buy vehicles from players
Config.ShowroomVehicle = {`kamacho`, `akuma`} -- Vehicle used when creating showroom zones for dealership, use up/down arrow to change model
Config.SpeedUnit = "mph" -- "mph" or "kph" (miles or kilometers)
Config.TruckModel = `packer` -- Vehicle used for contracts
Config.ContractCoords = {1201.2113, -3188.8677, 6.0281, 176.8985} -- Coords where to collect the vehicles from contracts
Config.ContractCoords = { -- Coords where to collect the vehicles from contracts
  {1201.2113, -3188.8677, 6.0281, 176.8985}, -- LS Docks
  {2671.1240, 3517.2488, 52.7084, 65.6758}, -- Youtools 
}
Config.TrailerModel = `tr4`
Config.ShowroomRenderDistance = 100 -- Distance between you and the showroom so the vehicles can be rendered
Config.DisableVehiclesWithWeapons = true -- If true it will ignore all vehicles with weapons when running /veh_data
Config.DriveTestNeedsStock = true -- true = the dealership requires stock of the vehicle for a test drive, false = they can test drive any vehicle from the warehouse
Config.TestDriveTime = 2 -- In minutes, total time you have for test drive before the vehicle gets deleted by the server
Config.TpInside = true -- true/false, if u want the player to be tp inside test vehicle?
Config.MaxPayments = 12 -- Max number of payments for financing, 1 per day (12 payments = 12 days)
Config.Unemployed = "unemployed" -- Used when a dealership fires an employee
Config.LateDays = 2 -- After X days the UI will show the payment as late (in yellow).
Config.RepossessDays = 3 -- When the customer has X days (or more) since their last payment the dealership will have a button to auto repossess the vehicle (needs to be higher than Config.LateDays).
Config.MinSellPrice = { -- The min sell price for a vehicle (basePrice * Config.MinSellPrice) 
  ['new'] = 0.5, -- applies to all vehicles in warehouse tab
  ['preowned'] = 0.25 -- applies to all vehicles in pre owned tab
} 
-- (example: if a veh basePrice is $1,000 the min price an employee can sell it will be 1000 * 0.5 = $500)
-- if the veh is pre owned the min price will be 1000 * 0.25 = $250
Config.BlipsAlwaysOn = true -- true will make dealerships available by default, they still can turn it off/on

Config.Categories = { -- Based on the veh category we will use basePrice at the moment of registering vehicles with /veh_data command
    ["0"] = {value = "compacts", label = "Compacts", basePrice = 1000},
    ["1"] = {value = "sedans", label = "Sedans", basePrice = 1000},
    ["2"] = {value = "suvs", label = "SUVs", basePrice = 1000},
    ["3"] = {value = "coupes", label = "Coupes", basePrice = 1000},
    ["4"] = {value = "muscle", label = "Muscle", basePrice = 1000},
    ["5"] = {value = "sportsclassic", label = "Sports Classics", basePrice = 1000},
    ["6"] = {value = "sports", label = "Sports", basePrice = 1000},
    ["7"] = {value = "super", label = "Super", basePrice = 1000},
    ["8"] = {value = "motorcycle", label = "Motorcycles", basePrice = 1000},
    ["9"] = {value = "offroad", label = "Off-road", basePrice = 1000},
    ["10"] = {value = "industrial", label = "Industrial", basePrice = 1000},
    ["11"] = {value = "utility", label = "Utility", basePrice = 1000},
    ["12"] = {value = "vans", label = "Vans", basePrice = 1000},
    ["13"] = {value = "cycles", label = "Cycles", basePrice = 1000},
    ["14"] = {value = "boats", label = "Boats", basePrice = 1000},
    ["15"] = {value = "helicopters", label = "Helicopters", basePrice = 1000},
    ["16"] = {value = "planes", label = "Planes", basePrice = 1000},
    ["17"] = {value = "service", label = "Service", basePrice = 1000},
    ["18"] = {value = "emergency", label = "Emergency", basePrice = 1000},
    ["19"] = {value = "military", label = "Military", basePrice = 1000},
    ["20"] = {value = "commercial", label = "Commercial", basePrice = 1000},
    ["21"] = {value = "trains", label = "Trains", basePrice = 1000},
    ["22"] = {value = "openwheel", label = "Open Wheel", basePrice = 1000},
    ["23"] = {value = "import", label = "Imports", basePrice = 1000},
    ["24"] = {value = "police", label = "Police", basePrice = 1000},
}

Config.blacklisted = { -- when using /veh_data the command will ignore all vehicles from this categories:
    [10] = true, --industrial
    [17] = true, --service
    [18] = true, --emergency
    [19] = true, --military
    [21] = true, --trains
}