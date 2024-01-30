return {
	General = {
		name = 'Shop',
		blip = {
			id = 59, colour = 69, scale = 0.7
		}, inventory = {
			{ name = 'tosti', price = 2 },
			{ name = 'water_bottle', price = 2 },
			{ name = 'kurkakola', price = 4 },
			{ name = 'twerks_candy', price = 3 },
			{ name = 'snikkel_candy', price = 3 },
			{ name = 'sandwich', price = 5 },
			{ name = 'bandage', price = 25 },
			{ name = 'lighter', price = 2 },
			{ name = 'rolling_paper', price = 2 },
			{ name = 'lotto', price = 15 },
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15), 
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
		}, 
		targets = {
            {ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(24.75847, -1346.602, 28.49694), heading = 272.207, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-3039.448, 584.5909, 6.908854), heading = 251.66, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-3242.87, 1000.262, 11.83063), heading = 357.483, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1728.334, 6415.639, 34.03714), heading = 243.168, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1697.099, 4923.278, 41.06363), heading = 331.944, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1960.049, 3740.639, 31.34366), heading = 312.863, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(548.7919, 2670.823, 41.15641), heading = 93.237, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(2677.721, 3279.919, 54.24104), heading = 329.508, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(2556.696, 381.1273, 107.6228), heading = 354.50, distance = 3.0, },
			{ped = `a_m_m_indian_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(373.032, 326.7628, 102.5662), heading = 259.85, distance = 3.0, },
        }
	},

	Liquor = {
		name = 'Liquor Store',
		blip = {
			id = 93, colour = 69, scale = 0.7
		}, inventory = {
			{ name = 'beer', price = 7 },
			{ name = 'whiskey', price = 10 },
			{ name = 'vodka', price = 15 },
		}, locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-1393.409, -606.624, 30.319)
		}, 

		targets = {
            {ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1134.15, -982.9755, 45.41585), heading = 279.048, distance = 3.0, },
			{ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-1221.4, -908.1018, 11.32634), heading = 40.962, distance = 3.0, },
			{ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-1486.604, -377.4891, 39.16338), heading = 145.281, distance = 3.0, },
			{ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-2966.206, 391.3649, 14.0433), heading = 83.715, distance = 3.0, },
			{ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1165.369, 2711.059, 38.15765), heading = 177.52, distance = 3.0, },
			{ped = `a_m_m_hillbilly_01`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1391.929, 3606.234, 33.98086), heading = 204.191, distance = 3.0, },
        }
	},

	YouTool = {
		name = 'YouTool',
		blip = {
			id = 402, colour = 69, scale = 0.7
		}, inventory = {
			--{ name = 'lockpick', price = 200 },
			{ name = 'WEAPON_WRENCH', price = 120 },
			{ name = 'WEAPON_HAMMER', price = 120 },
			{ name = 'screwdriverset', price = 120 },
			{ name = 'repairkit', price = 250 },
			--{ name = 'advancedrepairkit', price = 500 },
			{ name = 'phone', price = 850 },
			{ name = 'radio', price = 250 },
			{ name = 'binoculars', price = 120 },
			{ name = 'firework1', price = 50 },
			{ name = 'firework2', price = 50 },
			{ name = 'firework3', price = 50 },
			{ name = 'firework4', price = 50 },
			{ name = 'cleaningkit', price = 150 },
			{ name = 'water_can', price = 120 },
			{ name = 'syphoningkit', price = 825, metadata = { gasamount = 0 }},
			{ name = 'container_green_small', price = 7500 },
			{ name = 'container_old_mid', price = 10000 },
			{ name = 'container_blue_mid', price = 50000 },
			{ name = 'container_white_mid', price = 50000 },


		}, locations = {
			vec3(2748.0, 3473.0, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}, 
		targets = {
            {
                ped = `cs_guadalope`,
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
                loc = vector3(2747.55, 3472.88, 54.67),
                heading = 251.66,
                distance = 3.0,
            },
			{
                ped = `cs_guadalope`,
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
                loc = vector3(45.68176, -1749.065, 28.61181),
                heading = 48.44,
                distance = 3.0,
            },
        }
	},

	PolaroidStore = {
		name = 'Polaroid Store',
		blip = {
			id = 184, colour = 5, scale = 0.7
		}, inventory = {
			{ name = 'polaroid', price = 850 }, 
			{ name = 'paperpolaroid', price = 25 },
			{ name = 'album', price = 130 },
			{ name = 'printerpolaroid', price = 550 },

		}, locations = {
			vec3(2748.0, 3473.0, 55.67), 
			vec3(342.99, -1298.26, 32.51)
		}, 
		targets = {
			{
				ped = `a_m_y_clubcust_02`,
				scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
				loc = vector3(-1530.269, -402.0671, 34.63528),
				heading = 230.821,
				distance = 3.0,
			},
		}
	},
	PokemonStore = {
		name = 'Comic Book Store',
		--[[ blip = {
			id = 184, colour = 5, scale = 0.8  },]] 
			inventory = {
			{ name = 'tcgpack', price = 100 }, 
			{ name = 'binder', price = 50 },
  
		}, locations = {
			vec3(2748.0, 3473.0, 55.67), 
			vec3(342.99, -1298.26, 32.51)
		}, 

		targets = {
			{
				ped = `s_m_m_movspace_01`,
				scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
				loc = vector3(-140.052, 223.2454, 93.98714),
				heading = 95.702,
				distance = 3.0,
			},
		}
	},  

	Ammunation = {
		name = 'Ammunation',
		blip = {
			id = 110, colour = 17, scale = 0.7
		}, inventory = {
			{ name = 'ammo-9', price = 2, }, 
			{ name = 'WEAPON_KNIFE', price = 200 },
			{ name = 'WEAPON_BAT', price = 100 },
			{ name = 'WEAPON_PISTOL', price = 1000, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_SNSPISTOL', price = 1500, metadata = { registered = true }, license = 'weapon' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 4000, metadata = { registered = true}, license = 'weapon' },
			{ name = 'greentint', price = 4200 },
			{ name = 'pinktint', price = 4200 },
			{ name = 'orangetint', price = 4200 },
			{ name = 'armytint', price = 4550 },
			{ name = 'lspdtint', price = 4550 },
			{ name = 'goldtint', price = 7500 },
			{ name = 'platinumtint', price = 10000 },
		}, locations = {
			vec3(-662.180, -934.961, 21.829),
			vec3(810.25, -2157.60, 29.62),
			vec3(1693.44, 3760.16, 34.71),
			vec3(-330.24, 6083.88, 31.45),
			vec3(252.63, -50.00, 69.94),
			vec3(22.56, -1109.89, 29.80),
			vec3(2567.69, 294.38, 108.73),
			vec3(-1117.58, 2698.61, 18.55),
			vec3(842.44, -1033.42, 28.19)
		}, 

		targets = {
            {ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-658.977, -939.2399, 20.82935), heading = 89.89, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(813.8107, -2155.294, 28.61919), heading = 7.586, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(1697.774, 3757.807, 33.70531), heading = 139.621, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-326.2605, 6081.749, 30.45478), heading = 135.855, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(247.2199, -51.71679, 68.94117), heading = 337.33, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(17.88021, -1107.781, 28.7972), heading = 161.546, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(2564.744, 298.5098, 107.735), heading = 267.155, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(-1112.661, 2697.492, 17.55425), heading = 136.778, distance = 3.0, },
			{ped = `cs_guadalope`, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', loc = vector3(841.0253, -1029.298, 27.19485), heading = 270.1636, distance = 3.0, },
        }
	},

	PoliceArmoury = {
		name = 'Police Armoury',
		groups = shared.police,
		blip = {
			id = 110, colour = 84, scale = 0.7
		}, inventory = {
			{ name = 'ammo-9', price = 1, },
			{ name = 'ammo-45', price = 1, },
			{ name = 'ammo-rifle', price = 1, },
			{ name = 'ammo-shotgun', price = 1, },
			{ name = 'taserammo', price = 5, }, 
			{ name = 'WEAPON_FLASHLIGHT', price = 200 },
			{ name = 'WEAPON_NIGHTSTICK', price = 100 },
			{ name = 'WEAPON_GLOCK17', price = 500, metadata = { registered = true, serial = 'POL' }, license = 'weapon' },
			{ name = 'WEAPON_M4', price = 2500, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_COMBATPDW', price = 2500, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_SCARH', price = 2500, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_REMINGTON', price = 1800, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'WEAPON_SMG', price = 2200, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'handcuffs', price = 5, },
			{ name = 'empty_evidence_bag', price = 5, },
			{ name = 'police_stormram', price = 50, },
			{ name = 'armor', price = 100, },
			{ name = 'heavyarmor', price = 250, },
			{ name = 'radio', price = 80, },
			{ name = 'panicbutton', price = 5, },
			{ name = 'megaphone', price = 25, },
			{ name = 'bodycam', price = 85, },
			{ name = 'pd_dashcam', price = 50, },
			{ name = 'drone_lspd', price = 650, },
			{ name = 'containerboltcutter', price = 55, },
			
		}, locations = {
			vec3(480.31, -996.62, 30.69)
		}, targets = {
			{ loc = vec3(480.31, -996.62, 30.69), length = 1.0, width = 1, heading = 0, minZ = 29.49, maxZ = 31.54, distance = 6 }
		}
	},

	Medicine = {
		name = 'Medicine Cabinet',
		groups = {
			['ambulance'] = 0
		},
		blip = {
			id = 403, colour = 69, scale = 0.7
		}, inventory = {
			{ name = 'medikit', price = 26 },
			{ name = 'bandage', price = 5 }
		}, locations = {
			vec3(306.3687, -601.5139, 43.28406)
		}, targets = {

		}
	},

	BlackMarketArms = {
		name = 'Black Market (Arms)',
		inventory = {
			{ name = 'WEAPON_DAGGER', price = 5000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_CERAMICPISTOL', price = 50000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'at_suppressor_light', price = 50000, currency = 'black_money' },
			{ name = 'ammo-rifle', price = 1000, currency = 'black_money' },
			{ name = 'ammo-rifle2', price = 1000, currency = 'black_money' }
		}, locations = {
			vec3(309.09, -913.75, 56.46)
		}, targets = {

		}
	},

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},

	VendingMachineCoffee = {
		name = 'Coffee Machine',
		inventory = {
			{ name = 'coffee', price = 2 },
			{ name = 'latte-machiatto', price = 3 },
			{ name = 'espresso', price = 2 },
			
		},
		model = {
			`prop_vend_coffe_01`
		}
	},

	VendingMachineSnack = {
		name = 'Snack Machine',
		inventory = {
			{ name = 'crisps', price = 2 },
			{ name = 'egochaser', price = 3 },
			{ name = 'nachos', price = 2 },
			{ name = 'snikkel_candy', price = 2 },
			{ name = 'meteorite-bar', price = 2 },
			{ name = 'twerks_candy', price = 2 },
			{ name = 'twix', price = 2 },	
		},
		model = {
			`prop_vend_snak_01`, `prop_vend_snak_01_tu`
		}
	},

	K9Store = {
		name = 'Police K9',
		--[[ blip = {
			id = 184, colour = 5, scale = 0.8  },]] 
			inventory = {
			{ name = 'petfood', price = 20 }, 
			{ name = 'firstaidforpet', price = 500 },
			{ name = 'petwaterbottleportable', price = 10 },
			{ name = 'keepcompanionk9unit', price = 2000 },
  
		}, locations = {
			vec3(469.91, -981.24, 26.27)
		}, 

		targets = {
			{
				ped = `A_C_shepherd`,
				scenario = 'WORLD_DOG_SITTING_SHEPHERD',
				loc = vector3(469.91, -981.24, 25.27),
				heading = 173.92,
				distance = 3.0,
			},
		}
	}, 

	VendingSodaDrinks = {
		name = 'Fizzy Drink Machine',
		inventory = {
			{ name = 'cola', price = 2 },
			{ name = 'sprunk', price = 3 },
			{ name = 'orang-o-tang', price = 2 },
			{ name = 'grapejuice', price = 2 },
			{ name = 'cranberry', price = 2 },
			{ name = 'ecoladiet', price = 2 },
			{ name = 'sprunklight', price = 2 },	
		},
		model = {
			`prop_vend_soda_01`, `prop_vend_soda_02`
		}
	},

	casinochipshop = {
		name = 'Casino Chips',
		inventory = {
			{ name = 'casino_goldchip', price = 10 },
		},
	},

	PetShop = {
        blip = {
            id = 463, colour = 31, scale = 0.6
        },
        name = 'Pet Shop',
        inventory = {
            { name = 'petfood',                 price = 500, },
            { name = 'collarpet',               price = 2000, },
            { name = 'firstaidforpet',          price = 2000, },
            { name = 'petnametag',              price = 2000, },
            { name = 'petwaterbottleportable',  price = 500, },
            { name = 'petgroomingkit',          price = 75000, },
            { name = 'keepcompanionpoodle',     price = 45000, count = 5, },
            { name = 'keepcompanionwesty',      price = 30000, count = 5, },
            { name = 'keepcompanioncat',        price = 25000, count = 10, },
            { name = 'keepcompanionpug',        price = 50000, count = 5, },
            { name = 'keepcompanionretriever',  price = 50000, count = 5, },
            { name = 'keepcompanionhen',        price = 25000, count = 10, },
            { name = 'keepcompanionrabbit',     price = 25000, count = 20, },
        },
        locations = {
        },
        targets = {
            {
                ped = `cs_guadalope`,
                scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
                loc = vector3(562.2782, 2741.604, 41.86893),
                heading = 193.2929,
                distance = 3.0,
            },
        }
    },
    Poacher = {
        name = 'Poacher',
        inventory = {
            { name = 'keepcompanionmtlion',  price = 75000, count = 5, currency = 'black_money', },
            { name = 'keepcompanionmtlion2', price = 75000, count = 5, currency = 'black_money', },
            { name = 'keepcompanioncoyote',  price = 75000, count = 5, currency = 'black_money', },
        },
        locations = {

        },
        targets = {
            {
                ped = `csb_cletus`,
                scenario = 'PROP_HUMAN_SEAT_BENCH',
                loc = vector3(4803.68, -4601.88, 17.31),
                heading = 178.26,
                distance = 3.0,
            },
        }
    },
    beekeeping = {
        name = 'Bee Merchant',
        inventory = {
            { name = 'beehive',  price = 568, count = 5, },
            { name = 'queen_bee', price = 800, count = 5, },
        },
		blip = {
			id = 618, colour = 60, scale = 0.7
		},
        locations = {

        },
        targets = {
            {
                ped = `csb_cletus`,
                loc = vector3(1677.903, 4882.29, 41.0425),
                heading = 60.89,
                distance = 3.0,
            },
        }
    },
    weedstore = {
        name = '420 Store',
        inventory = {
            { name = 'femaleseed',  price = 40, count = 20, },
            { name = 'wateringcan', price = 25, count = 15, },
			{ name = 'fertilizer', price = 50, count = 25, },
			{ name = 'emptybaggies', price = 1, count = 500, },
			{ name = 'smallscales', price = 385, count = 20, },
			{ name = 'rollingpaper', price = 1, count = 150, },
        },
		blip = {
			id = 469, colour = 52, scale = 0.6
		},
        locations = {

        },
        targets = {
            {
                ped = `csb_cletus`,
                loc = vector3(-1171.953, -1572.652, 3.663624),
                heading = 131.2018,
                distance = 2.5,
            },
        }
    },
    huntingstore = {
        name = 'Hunting Store',
        inventory = {
            { name = 'weapon_musket',  price = 1500, count = 5, },
            { name = 'ammo-musket', price = 18, count = 50, }, 
			{ name = 'huntingbait', price = 150, count = 25, },
			{ name = 'weapon_knife', price = 500, count = 5, },
        },
		blip = {
			id = 432, colour = 52, scale = 0.7
		},
        locations = {

        },
        targets = {
            {
                ped = `csb_cletus`,
                loc = vector3(-679.2966, 5834.281, 16.33132),
                heading = 132.02,
                distance = 2.5,
            },
        }
    }

}
