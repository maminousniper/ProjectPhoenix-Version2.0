Config = {}

Config.Settings = {
  ['sql'] = 'oxmysql', -- Why use anything else?
  ['Job'] = {
    ['UseJob'] = true,
    ['BossOnly'] = true,
  },
  ['Notify'] = 'ps-ui', -- qb-core, qb-drawtext, ps-ui
  ['Payments'] = {
    ['UsePayment'] = true,
    ['RenewedBanking'] = true,
    ['moneyType'] = 'bank', -- bank, cash
  },
}

Config.engineLocations = {
  --[[ ["TestingZone"] = { -- THis name should be unique no duplicates
    ["coords"] = vector3(1172.31, 2661.94, 37.99), -- The coords of the zone
    ["size"] = 10.0, -- How big is the zone?
    ["heading"] = 0.0, -- Heading
    ["debug"] = false, -- Should zone be debugged?
    ["authorizedJob"] = "mechanic", -- job authorized to engine swap
    ["inVehicle"] = "Press E to engineswap", -- The name if a user is in a vehicle
    ["outVehicle"] = "You need to be in a vehicle!", -- Message if user is not in a vehicle
  }, ]]
  ["customsMain"] = { -- THis name should be unique no duplicates
    ["coords"] = vector3(149.38, -3043.71, 7.04), -- The coords of the zone
    ["size"] = 2.0, -- How big is the zone?
    ["heading"] = 0.0, -- Heading
    ["debug"] = false, -- Should zone be debugged?
    ["authorizedJob"] = "mechanic", -- job authorized to engine swap
    ["inVehicle"] = "Press E to engineswap", -- The name if a user is in a vehicle
    ["outVehicle"] = "You need to be in a vehicle!", -- Message if user is not in a vehicle
  },
}
 
Config.Swaps = {
  [`r34sound`] = { 	
    custom = true,
    price = 5000,
    label = 'RB26DE Twin Turbo', 	
    soundname = 'r34sound', 
  },
  [`f20c`] = { 	
    custom = true,
    price = 5000, 	
    label = 'Civic F20C', 	
    soundname = 'f20c', 
  },
  [`aq2jzgterace`] = { 	
    custom = true,
    price = 5000, 	
    label = 'Supra 2JZ GTE Twin Turbo', 	
    soundname = 'aq2jzgterace', 
  },
  [`rotary7`] = { 	
    custom = true,
    price = 5000, 	
    label = 'RX7 13B-REW Twin-Rotor Twin Turbo', 	
    soundname = 'rotary7', 
  },
  [`fordvoodoo`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Ford Mustang v8',   
    soundname = 'fordvoodoo',    
  },
  [`f10m5`] = {   	
    custom = true,
    price = 5000, 	
    label = 'BMW M5 f10 ',   	
    soundname = 'f10m5',    
  },
  [`lfasound`] = {   	
    custom = true, 
    price = 5000, 	
    label = 'LFA V10',   	
    soundname = 'lfasound',    
  },
  [`elegyx`] = {   	
    custom = true,   	
    price = 5000,	
    label = 'GTR R35',   	
    soundname = 'elegyx',    
  },
  [`ta028viper`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Viper V10',   	
    soundname = 'ta028viper',    
  },
  [`porsche57v10`] = {   	
    custom = true,   	
    price = 5000,
    label = 'Porsche 57 V10',   	
    soundname = 'porsche57v10',    
  },
  [`s15sound`] = {   	
    custom = true,
    price = 5000, 	
    label = 'S15 SR20',   	
    soundname = 's15sound',    
  },
  [`gt3rstun`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Flat 6',   	
    soundname = 'gt3rstun',    
  },
  [`m297zonda`] = {   	
    custom = true,  	
    price = 5000,
    label = 'Zonda V12',   	
    soundname = 'm297zonda',    
  },
  [`aq06nhonc30a`] = {   	
    custom = true,   	
    price = 5000,
    label = 'NSX',   	
    soundname = 'aq06nhonc30a',    
  },
  [`p60b40`] = {   	
    custom = true,
    price = 5000, 	
    label = 'BMW Engine M3',   	
    soundname = 'p60b40',    
  },
  [`aqls7raceswap`] = {   	
    custom = true,
    price = 5000, 	
    label = 'C7 V8',   	
    soundname = 'aqls7raceswap',    
  },
  [`aqtoy2jzstock`] = {   	
    custom = true,   	
    price = 5000,  
    label = 'Supra 2JZ GTE',   	
    soundname = 'aqtoy2jzstock',    
  },
  [`bgw16`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Bugatti W16',   	
    soundname = 'bgw16',    
  },
  [`cvpiv8`] = {   	
    custom = true,
    price = 5000, 	
    label = 'cvpi V8',   
    soundname = 'cvpiv8',    
  },
  [`cw2019`] = {   	
    custom = true, 
    price = 5000, 	
    label = 'Senna engine',   	
    soundname = 'cw2019',    
  },
  [`ea888`] = {   	
    custom = true,
    price = 5000, 	
    label = 'VW EA-888',   	
    soundname = 'ea888',    
  },
  [`ecoboostv6`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Ford explorer V6',   	
    soundname = 'ecoboostv6',    
  },
  [`ftypesound`] = {   	
    custom = true,  	
    price = 5000,
    label = 'Ftype engine',   	
    soundname = 'ftypesound',    
  },
  [`hemisound`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Hemi V8 engine',   	
    soundname = 'dodgehemihellcat',    
  },
  [`lambov10`] = {   	
    custom = true,   	
    price = 5000,   	
    label = 'lambo V10',   	
    soundname = 'lambov10',    
  },
  [`lgcy04murciv12`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Lambo V12',   	
    soundname = 'lgcy04murciv12',    
  },
  [`mbnzc63eng`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Mercedes C63 V8',   	
    soundname = 'mbnzc63eng',   
  },
  [`n4g63t`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Evo engine',   	
    soundname = 'n4g63t',    
  },
  [`npcul`] = {   	
    custom = true,   	
    price = 5000, 	
    label = 'RRoyce',   	
    soundname = 'npcul',    
  },
  [`npolchar`] = {   	
    custom = true,
    price = 5000, 	
    label = 'charger V8',   	
    soundname = 'npolchar',    
  },
  [`s85b50`] = {   	
    custom = true,   	
    price = 5000,   	
    label = 'Victor V8',   	
    soundname = 's85b50',    
  },
  [`subaruej20`] = {   	
    custom = true,
    price = 5000, 	
    label = 'subaru boxer',   	
    soundname = 'subaruej20',    
  },
  [`ta488f154`] = {   	
    custom = true,
    price = 5000, 	
    label = 'F488 V8',   	
    soundname = 'ta488f154',    
  },
  [`taaud40v8`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Audi v8',   	
    soundname = 'taaud40v8',    
  },
  [`trumpetzr`] = {   	
    custom = true,
    price = 5000, 	
    label = 'VQ Straight 6',   	
    soundname = 'trumpetzr',    
  },
  [`sultanrsv8`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Sultan RS V8',   	
    soundname = 'sultanrsv8',    
  },
  
  -- bikes
  [`suzukigsx`] = {   	
    custom = true,
    price = 5000,  	
    label = 'Bike suzukigsx',   	
    soundname = 'suzukigsxr1k',    
  },
  [`tayamahar1`] = {   	
    custom = true,
    price = 5000, 	
    label = 'Bike tayamahar1',   	
    soundname = 'tayamahar1',    
  },
  [`s1000rr`] = {   	
    custom = true,
    price = 5000,	
    label = 'Bike bmws1krreng',   	
    soundname = 'bmws1krreng',    
  },
}
