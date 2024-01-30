Config = Config or {}
Config.DefaultGarage = "pillboxgarage" -- Just in case the seller doesn't select any garage we will use this as default
-- This is an example using some garages from qb-garages, add your own:
Config.Garages = {
    {value = "pillboxgarage", label = "Pillbox Garage"},
    {value = "motelgarage", label = "Motel Parking"},
    {value = "sapcounsel", label = "San Andreas Parking"},
    {value = "spanishave", label = "Spanish Ave Parking"},
}

-- Used for ESX garage (table "owned_vehicles" > field "type")
Config.DefaultType = "car"
Config.Types = {
    ['boats'] = "boat",
    ['helicopters'] = "helicopter",
}