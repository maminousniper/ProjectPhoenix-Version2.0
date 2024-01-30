return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 100,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 350,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 250,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["stolenart"] = {
		label = "Pintura",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["prisonwine"] = {
		label = "Pruno Mix",
		weight = 1000,
		stack = true,
		close = false,
		description = "You should ferment this to get a good buzz",
		client = {
			image = "prisonwine.png",
		}
	},

	["ingredients"] = {
		label = "Ingredients",
		weight = 1000,
		stack = true,
		close = true,
		description = "Ingredients for food crafting",
		client = {
			image = "ingredients.png",
		}
	},

	["gopro"] = {
		label = "GoPro",
		weight = 450,
		stack = false,
		close = true,
		description = "GoPro Camera",
		client = {
			image = "gopro.png",
		}
	},

	["weed_purple-haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Purple Haze",
		client = {
			image = "weed_seed.png",
		}
	},

	["prisonfruit"] = {
		label = "Fruit Mix",
		weight = 1000,
		stack = true,
		close = false,
		description = "A mix of random fruits",
		client = {
			image = "prisonfruit.png",
		}
	},

	["stolentv"] = {
		label = "TV",
		weight = 4000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["cryptostick"] = {
		label = "Crypto Stick",
		weight = 200,
		stack = false,
		close = true,
		description = "Why would someone ever buy money that doesn't exist.. How many would it contain..?",
		client = {
			image = "cryptostick.png",
		}
	},

	["rentalpapers"] = {
		label = "Rental Documents",
		weight = 100,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "rentalpapers.png",
		}
	},

	["tablet"] = {
		label = "Tablet",
		weight = 1000,
		stack = true,
		close = true,
		description = "Expensive tablet",
		client = {
			image = "tablet.png",
		}
	},

	["prisonsugar"] = {
		label = "Sugar Pack",
		weight = 1,
		stack = true,
		close = false,
		description = "Plain old sugar",
		client = {
			image = "prisonsugar.png",
		}
	},

	["purple_haze_plant"] = {
		label = "Purple Haze Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purple_haze_plant.png",
		}
	},

	["drill"] = {
		label = "Drill",
		weight = 15000,
		stack = true,
		close = false,
		description = "The real deal...",
		client = {
			image = "drill.png",
		}
	},

	["water_bottle2"] = {
		label = "Voss Water",
		weight = 300,
		stack = true,
		close = true,
		description = "The fancy water kind!",
		client = {
			image = "water_bottle2.png",
		}
	},

	["blue_dream_seed"] = {
		label = "BlueDream Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_bucket"] = {
		label = "Weed Bucket",
		weight = 1500,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "weed_bucket.png",
		}
	},

	["diamond_ring"] = {
		label = "Diamond Ring",
		weight = 500,
		stack = true,
		close = true,
		description = "A diamond ring seems like the jackpot to me!",
		client = {
			image = "diamond_ring.png",
		}
	},

	["white_widow_bud"] = {
		label = "White Widow dried bud",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "white_widow_bud.png",
		}
	},

	["weed_nugget"] = {
		label = "Weed Nugget",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_nugget.png",
		}
	},

	["heavyarmor"] = {
		label = "Heavy Armor",
		weight = 5000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["stickynote"] = {
		label = "Sticky note",
		weight = 0,
		stack = false,
		close = false,
		description = "Sometimes handy to remember something :)",
		client = {
			image = "stickynote.png",
		}
	},

	["meatcoyote"] = {
		label = "Coyote Pelt",
		weight = 100,
		stack = true,
		close = false,
		description = "Coyote Pelt",
		client = {
			image = "coyotepelt.png",
		}
	},

	["casinochips"] = {
		label = "Casino Chips",
		weight = 0,
		stack = true,
		close = false,
		description = "Chips For Casino Gambling",
		client = {
			image = "casinochips.png",
		}
	},

	["iphone"] = {
		label = "iPhone",
		weight = 400,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "iphone.png",
		}
	},

	["iron"] = {
		label = "Iron",
		weight = 100,
		stack = true,
		close = false,
		description = "Handy piece of metal that you can probably use for something",
		client = {
			image = "iron.png",
		}
	},

	["metalscrap"] = {
		label = "Metal Scrap",
		weight = 100,
		stack = true,
		close = false,
		description = "You can probably make something nice out of this",
		client = {
			image = "metalscrap.png",
		}
	},

	["diamond"] = {
		label = "Diamond",
		weight = 400,
		stack = true,
		close = true,
		description = "A diamond seems like the jackpot to me!",
		client = {
			image = "diamond.png",
		}
	},

	["aluminumoxide"] = {
		label = "Aluminium Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with",
		client = {
			image = "aluminumoxide.png",
		}
	},

	["petfood"] = {
		label = "pet food",
		weight = 500,
		stack = true,
		close = true,
		description = "food for your companion!",
		client = {
			image = "petfood.png",
		}
	},

	["black_usb"] = {
		label = "Black USB",
		weight = 250,
		stack = true,
		close = false,
		description = "Whats this? [TO BE SEIZED BY PD]",
		client = {
			image = "black_usb.png",
		}
	},

	["coke_brick"] = {
		label = "Coke Brick",
		weight = 1000,
		stack = false,
		close = true,
		description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_brick.png",
		}
	},

	["sprunklight"] = {
		label = "Sprunk Light",
		weight = 200,
		stack = true,
		close = true,
		description = "Sprunk but lighter!",
		client = {
			image = "sprunklight.png",
		}
	},

	["lab_key"] = {
		label = "Key",
		weight = 200,
		stack = false,
		close = true,
		description = "Meth Lab Key [TO BE SEIZED BY PD]",
		client = {
			image = "lab_key.png",
		}
	},

	["firstaidforpet"] = {
		label = "First aid for pet",
		weight = 500,
		stack = true,
		close = true,
		description = "Revive your pet!",
		client = {
			image = "firstaidforpet.png",
		}
	},

	["weed_brick"] = {
		label = "Weed Brick",
		weight = 1000,
		stack = true,
		close = true,
		description = "1KG Weed Brick to sell to large customers.",
		client = {
			image = "weed_brick.png",
		}
	},

	["weaponlicense"] = {
		label = "Weapon License",
		weight = 0,
		stack = false,
		close = true,
		description = "Weapon License",
		client = {
			image = "weapon_license.png",
		}
	},

	["vodka"] = {
		label = "Vodka",
		weight = 250,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "vodka.png",
		}
	},

	["prisonjuice"] = {
		label = "Orange Juice",
		weight = 250,
		stack = true,
		close = false,
		description = "Regular Orange Juice",
		client = {
			image = "prisonjuice.png",
		}
	},

	["newspaper"] = {
		label = "Newspaper",
		weight = 10,
		stack = true,
		close = true,
		description = "Los Santos Newspaper",
		client = {
			image = "newspaper.png",
		}
	},

	["lighter"] = {
		label = "Lighter",
		weight = 0,
		stack = true,
		close = true,
		description = "On new years eve a nice fire to stand next to",
		client = {
			image = "lighter.png",
		}
	},

	["thermite"] = {
		label = "Thermite",
		weight = 1000,
		stack = true,
		close = true,
		description = "Sometimes you'd wish for everything to burn",
		client = {
			image = "thermite.png",
		}
	},

	["weed_og-kush_seed"] = {
		label = "OGKush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of OG Kush",
		client = {
			image = "weed_seed.png",
		}
	},

	["usb_blue"] = {
		label = "USB Drive",
		weight = 200,
		stack = true,
		close = false,
		description = "A blue USB flash drive",
		client = {
			image = "usb_blue.png",
		}
	},

	["og_kush_seed"] = {
		label = "Og Kush Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["bodycam"] = {
		label = "Bodycam",
		weight = 100,
		stack = false,
		close = true,
		description = "Bodycam for Police Use",
		client = {
			image = "bodycam.png",
		}
	},

	["keepcompanionhusky"] = {
		label = "Husky",
		weight = 500,
		stack = false,
		close = true,
		description = "Husky is your royal companion!",
		client = {
			image = "A_C_Husky.png",
		}
	},

	["keepcompanionk9unit"] = {
		label = "Shhepherd",
		weight = 500,
		stack = false,
		close = true,
		description = "LSPD exclusive K9.",
		client = {
			image = "A_C_shepherd.png",
		}
	},
	

	["petgroomingkit"] = {
		label = "Pet Grooming Kit",
		weight = 715,
		stack = false,
		close = true,
		description = "Pet Grooming Kit",
		client = {
			image = "petgroomingkit.png",
		}
	},

	["ammonia"] = {
		label = "Ammonia",
		weight = 400,
		stack = true,
		close = false,
		description = "Amonia",
		client = {
			image = "ammonia.png",
		}
	},

	["keepcompanionrat"] = {
		label = "Rat",
		weight = 500,
		stack = false,
		close = true,
		description = "Your royal companion!",
		client = {
			image = "A_C_Rat.png",
		}
	},

	["stolenscope"] = {
		label = "Telescópio",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["white_widow_plant"] = {
		label = "White Widow Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "white_widow_plant.png",
		}
	},

	["advancedlockpick"] = {
		label = "Advanced Lockpick",
		weight = 300,
		stack = true,
		close = true,
		description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
		client = {
			image = "advancedlockpick.png",
		}
	},

	["id_card"] = {
		label = "ID Card",
		weight = 0,
		stack = false,
		close = false,
		description = "A card containing all your information to identify yourself",
		client = {
			image = "id_card.png",
		}
	},

	["ak_47_plant"] = {
		label = "Ak 47 Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ak_47_plant.png",
		}
	},

	["hlabs_formula"] = {
		label = "Secret Formula",
		weight = 150,
		stack = false,
		close = false,
		description = "You just reminded yourself why you failed chemistry in high school..",
		client = {
			image = "hlabs_formula.png",
		}
	},

	["keepcompanionmtlion2"] = {
		label = "Panter",
		weight = 500,
		stack = false,
		close = true,
		description = "Panter is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["cokebaggy"] = {
		label = "Bag of Coke",
		weight = 1,
		stack = true,
		close = true,
		description = "To get happy real quick",
		client = {
			image = "cocaine_baggy.png",
		}
	},

	["gps-device"] = {
		label = "GPS Devive",
		weight = 2500,
		stack = true,
		close = false,
		description = "A device to track bank trucks",
		client = {
			image = "gps-device.png",
		}
	},

	["security_card_02"] = {
		label = "Security Card B",
		weight = 0,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_02.png",
		}
	},

	["ifaks"] = {
		label = "ifaks",
		weight = 200,
		stack = true,
		close = true,
		description = "ifaks for healing and a complete stress remover.",
		client = {
			image = "ifaks.png",
		}
	},

	["baggies"] = {
		label = "Baggies",
		weight = 250,
		stack = true,
		close = false,
		description = "Baggies",
		client = {
			image = "baggies.png",
		}
	},

	["prisonwateringcan"] = {
		label = "Watering Can",
		weight = 1000,
		stack = false,
		close = false,
		description = "Watering can with a Bolingbroke Penitentiary label.",
		client = {
			image = "prisonwateringcan.png",
		}
	},

	["lotto"] = {
		label = "Lotto ticket",
		weight = 10,
		stack = true,
		close = true,
		description = "Lucky Ticket",
		client = {
			image = "lotto.png",
		}
	},

	["crisps"] = {
		label = "Crisps",
		weight = 50,
		stack = true,
		close = true,
		description = "Regular chips",
		client = {
			image = "crisps.png",
		}
	},

	["og_kush_nugget"] = {
		label = "Og Kush Nugget",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "og_kush_nugget.png",
		}
	},

	["cleaningkit"] = {
		label = "Cleaning Kit",
		weight = 50,
		stack = true,
		close = true,
		description = "A microfiber cloth with some soap will let your car sparkle again!",
		client = {
			image = "cleaningkit.png",
		}
	},

	["weed_seed"] = {
		label = "Weed Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["antipatharia_coral"] = {
		label = "Antipatharia",
		weight = 300,
		stack = true,
		close = true,
		description = "Its also known as black corals or thorn corals",
		client = {
			image = "antipatharia_coral.png",
		}
	},

	["weed_amnesia_seed"] = {
		label = "Amnesia Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of Amnesia",
		client = {
			image = "weed_seed.png",
		}
	},

	["keepcompanionwesty"] = {
		label = "Westy",
		weight = 500,
		stack = false,
		close = true,
		description = "Westy is your royal companion!",
		client = {
			image = "A_C_Westy.png",
		}
	},

	["keepcompanionrottweiler"] = {
		label = "Rottweiler",
		weight = 500,
		stack = false,
		close = true,
		description = "Rottweiler is your royal companion!",
		client = {
			image = "A_Rottweiler.png",
		}
	},

	["hacking_device"] = {
		label = "Hacking Device",
		weight = 750,
		stack = true,
		close = true,
		description = "Hacking Device [TO BE SEIZED BY PD]",
		client = {
			image = "hacking_device.png",
		}
	},

	["fleeca_bankcard"] = {
		label = "Bank Keycard",
		weight = 50,
		stack = false,
		close = true,
		description = "A keycard stolen from a fleeca bank.",
		client = {
			image = "fleeca_bankcard.png",
		}
	},

	["twix"] = {
		label = "Twix Bar",
		weight = 50,
		stack = true,
		close = true,
		description = "Tasty Bar",
		client = {
			image = "twix.png",
		}
	},

	["weed_conepack"] = {
		label = "Pack of Cones",
		weight = 1000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "weed_conepack.png",
		}
	},

	["sprunk"] = {
		label = "Sprunk",
		weight = 200,
		stack = true,
		close = true,
		description = "Everyone loves a bit of Sprunk in their mouths",
		client = {
			image = "sprunk.png",
		}
	},

	["screwdriverset"] = {
		label = "Toolkit",
		weight = 700,
		stack = true,
		close = false,
		description = "Very useful to screw... screws...",
		client = {
			image = "screwdriverset.png",
		}
	},

	["oxy"] = {
		label = "Prescription Oxy",
		weight = 1,
		stack = true,
		close = true,
		description = "The Label Has Been Ripped Off",
		client = {
			image = "oxy.png",
		}
	},

	["newsmic"] = {
		label = "News Microphone",
		weight = 500,
		stack = false,
		close = true,
		description = "A microphone for the news",
		client = {
			image = "newsmic.png",
		}
	},

	["newscam"] = {
		label = "News Camera",
		weight = 2500,
		stack = false,
		close = true,
		description = "A camera for the news",
		client = {
			image = "newscam.png",
		}
	},

	["pacific_key1"] = {
		label = "Bank Data Key",
		weight = 50,
		stack = false,
		close = true,
		description = "A data key stolen from the pacific bank.",
		client = {
			image = "pacific_key1.png",
		}
	},

	["markedbills"] = {
		label = "Marked Money",
		weight = 1000,
		stack = true,
		close = true,
		description = "Money?",
		client = {
			image = "markedbills.png",
		}
	}, 

	["labkey"] = {
		label = "Key",
		weight = 50,
		stack = false,
		close = true,
		description = "Key for a lock...?",
		client = {
			image = "labkey.png",
		}
	},

	["weed_cone"] = {
		label = "Empty Cone",
		weight = 500,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_cone.png",
		}
	},

	["stolencoffee"] = {
		label = "Maquina de Café",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["leftturnsign"] = {
		label = "Left Turn Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Left Turn Sign",
		client = {
			image = "leftturnsign.png",
		}
	},

	["weed_jar"] = {
		label = "Weed Jar",
		weight = 1000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "weed_jar.png",
		}
	},

	["noparkingsign"] = {
		label = "No Parking Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "No Parking Sign",
		client = {
			image = "noparkingsign.png",
		}
	},

	["keepcompanionrabbit"] = {
		label = "Rabbit",
		weight = 500,
		stack = false,
		close = true,
		description = "Rabbit is your royal companion!",
		client = {
			image = "A_C_Rabbit_01.png",
		}
	},

	["lawyerpass"] = {
		label = "Lawyer Pass",
		weight = 0,
		stack = false,
		close = false,
		description = "Pass exclusive to lawyers to show they can represent a suspect",
		client = {
			image = "lawyerpass.png",
		}
	},

	["empty_evidence_bag"] = {
		label = "Empty Evidence Bag",
		weight = 0,
		stack = true,
		close = false,
		description = "Used a lot to keep DNA from blood, bullet shells and more",
		client = {
			image = "evidence.png",
		}
	},

	["og_kush_plant"] = {
		label = "Og Kush Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "og_kush_plant.png",
		}
	},

	["samsungphone"] = {
		label = "Samsung S10",
		weight = 500,
		stack = true,
		close = true,
		description = "Very expensive phone",
		client = {
			image = "samsungphone.png",
		}
	},

	["decrypter"] = {
		label = "Decrypter",
		weight = 500,
		stack = true,
		close = false,
		description = "Decrypter [TO BE SEIZED BY PD]",
		client = {
			image = "decrypter.png",
		}
	},

	["security_card_05"] = {
		label = "Security Card",
		weight = 50,
		stack = true,
		close = true,
		description = "A blue security card.",
		client = {
			image = "security_card_05.png",
		}
	},

	["meth_batch"] = {
		label = "Meth Batch",
		weight = 1000,
		stack = false,
		close = true,
		description = "Meth batch",
		client = {
			image = "meth_batch.png",
		}
	},

	["dontblockintersectionsign"] = {
		label = "Intersection Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Intersection Sign",
		client = {
			image = "dontblockintersectionsign.png",
		}
	},

	["collarpet"] = {
		label = "Pet collar",
		weight = 20,
		stack = true,
		close = true,
		description = "Rename your pets!",
		client = {
			image = "collarpet.png",
		}
	},

	["weed_plant"] = {
		label = "Weed Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_plant.png",
		}
	},

	["handcuffs"] = {
		label = "Handcuffs",
		weight = 100,
		stack = true,
		close = true,
		description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
		client = {
			image = "handcuffs.png",
		}
	},

	["usb_green"] = {
		label = "USB Drive",
		weight = 300,
		stack = true,
		close = false,
		description = "A green USB flash drive",
		client = {
			image = "usb_green.png",
		}
	},

	["panicbutton"] = {
		label = "Panic Button",
		weight = 100,
		stack = false,
		close = true,
		description = "Some sort of button?",
		client = {
			image = "panicbutton.png",
		}
	},

	["harness"] = {
		label = "Race Harness",
		weight = 1000,
		stack = false,
		close = true,
		description = "Racing Harness so no matter what you stay in the car",
		client = {
			image = "harness.png",
		}
	},

	["espresso"] = {
		label = "Espresso",
		weight = 250,
		stack = true,
		close = true,
		description = "very strong coffee",
		client = {
			image = "espresso.png",
		}
	},

	["prisonslushie"] = {
		label = "Slushie",
		weight = 250,
		stack = true,
		close = true,
		description = "Slushie",
		client = {
			image = "prisonslushie.png",
		}
	},

	["meatcow"] = {
		label = "Cow Pelt",
		weight = 500,
		stack = true,
		close = false,
		description = "Cow Pelt",
		client = {
			image = "cowpelt.png",
		}
	},

	["weed_amnesia"] = {
		label = "Amnesia 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g Amnesia",
		client = {
			image = "weed_baggy.png",
		}
	},

	["visa"] = {
		label = "Visa Card",
		weight = 0,
		stack = false,
		close = false,
		description = "Visa can be used via ATM",
		client = {
			image = "visacard.png",
		}
	},

	["spray"] = {
		label = "Spray",
		weight = 750,
		stack = false,
		close = true,
		description = "SprayPaint",
		client = {
			image = "spray.png",
		}
	},

	["purple_haze_seed"] = {
		label = "Purple Haze Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["goldbar"] = {
		label = "Gold Bar",
		weight = 5000,
		stack = true,
		close = true,
		description = "Looks pretty expensive to me",
		client = {
			image = "goldbar.png",
		}
	},

	["og_kush_bud"] = {
		label = "Og Kush dried bud",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "og_kush_bud.png",
		}
	},

	["spray_remover"] = {
		label = "Spray Remover",
		weight = 1000,
		stack = false,
		close = true,
		description = "Spray Detergent",
		client = {
			image = "spray_remover.png",
		}
	},

	["firework4"] = {
		label = "Weeping Willow",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework4.png",
		}
	},

	["transponder"] = {
		label = "Transponder",
		weight = 600,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "transponder.png",
		}
	},

	["weed_ak47"] = {
		label = "AK47 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g AK47",
		client = {
			image = "weed_baggy.png",
		}
	},

	["fitbit"] = {
		label = "Fitbit",
		weight = 100,
		stack = false,
		close = true,
		description = "I like fitbit",
		client = {
			image = "fitbit.png",
		}
	},

	["ausb2"] = {
		label = "Alias USB",
		weight = 50,
		stack = false,
		close = true,
		description = "Be whoever you want to be...",
		client = {
			image = "ausb.png",
		}
	},

	["ak_47_nugget"] = {
		label = "Ak 47 Nugget",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ak_47_nugget.png",
		}
	},

	["meth1g"] = {
		label = "Meth 1g",
		weight = 1,
		stack = true,
		close = false,
		description = "Meth 1G",
		client = {
			image = "meth1g.png",
		}
	},

	["radiocar_dismounter"] = {
		label = "Radio Removing Tool",
		weight = 500,
		stack = true,
		close = true,
		description = "Use to remove car radio",
		client = {
			image = "radio_remover.png",
		}
	},

	["wine"] = {
		label = "Wine",
		weight = 300,
		stack = true,
		close = false,
		description = "Some good wine to drink on a fine evening",
		client = {
			image = "wine.png",
		}
	},

	["filled_evidence_bag"] = {
		label = "Evidence Bag",
		weight = 200,
		stack = false,
		close = false,
		description = "A filled evidence bag to see who committed the crime >:(",
		client = {
			image = "evidence.png",
		}
	},

	["copper_wires"] = {
		label = "Copper Wires",
		weight = 1000,
		stack = true,
		close = false,
		description = "Some copper wiring, good for conducting electricity..",
		client = {
			image = "copper_wires.png",
		}
	},

	["notrespassingsign"] = {
		label = "No Trespassing Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "No Trespassing Sign",
		client = {
			image = "notrespassingsign.png",
		}
	},

	["mdtcitation"] = {
		label = "Citation",
		weight = 200,
		stack = false,
		close = true,
		description = "Citation from a police officer!",
		client = {
			image = "citation.png",
		}
	},

	["radiocar"] = {
		label = "Car Radio",
		weight = 1000,
		stack = true,
		close = true,
		description = "Add a new radio to your car!",
		client = {
			image = "radio.png",
		}
	},

	["egochaser"] = {
		label = "Ego Chaser Energy Bar",
		weight = 200,
		stack = true,
		close = true,
		description = "The energy you need!",
		client = {
			image = "egochaser.png",
		}
	},

	["moneybag"] = {
		label = "Money Bag",
		weight = 1500,
		stack = false,
		close = true,
		description = "A bag with cash",
		client = {
			image = "moneybag.png",
		}
	},

	["kurkakola"] = {
		label = "Cola",
		weight = 200,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "cola.png",
		}
	},

	["walkstick"] = {
		label = "Walking Stick",
		weight = 1000,
		stack = true,
		close = true,
		description = "Walking stick for ya'll grannies out there.. HAHA",
		client = {
			image = "walkstick.png",
		}
	},

	["weed_skunk"] = {
		label = "Skunk 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g Skunk",
		client = {
			image = "weed_baggy.png",
		}
	},

	["megaphone"] = {
		label = "Megaphone",
		weight = 1000,
		stack = false,
		close = false,
		description = "A loudspeaker to yell at civilians.",
		client = {
			image = "megaphone.png",
		}
	},

	["prisonfarmnutrition"] = {
		label = "Plant Nutrition",
		weight = 650,
		stack = true,
		close = false,
		description = "Plant nutrition with a Bolingbroke Penitentiary label",
		client = {
			image = "prisonfarmnutrition.png",
		}
	},

	["prisonwine_fermented"] = {
		label = "Pruno",
		weight = 500,
		stack = true,
		close = true,
		description = "This should give you a good buzz",
		client = {
			image = "prisonwine_fermented.png",
		}
	},

	["advancedrepairkit"] = {
		label = "Advanced Repairkit",
		weight = 1000,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "advancedkit.png",
		}
	},

	["pineapple_express_plant"] = {
		label = "Pineapple Express Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pineapple_express_plant.png",
		}
	},

	["blue_dream_plant"] = {
		label = "BlueDream Plant",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blue_dream_plant.png",
		}
	},

	["painkillers"] = {
		label = "Painkillers",
		weight = 1,
		stack = true,
		close = true,
		description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
		client = {
			image = "painkillers.png",
		}
	},

	["prisonspoon"] = {
		label = "Spoon",
		weight = 75,
		stack = true,
		close = false,
		description = "Cafeteria spoon",
		client = {
			image = "prisonspoon.png",
		}
	},

	["ak_47_seed"] = {
		label = "Ak 47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["meatpig"] = {
		label = "Pig Meat",
		weight = 100,
		stack = true,
		close = false,
		description = "Pig Meat",
		client = {
			image = "pigpelt.png",
		}
	},

	["jerry_can"] = {
		label = "Jerrycan 20L",
		weight = 10000,
		stack = true,
		close = true,
		description = "A can full of Fuel",
		client = {
			image = "jerry_can.png",
		}
	},

	["weed_plant_bud"] = {
		label = "Weed dried bud",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_plant_bud.png",
		}
	},

	["stolenmicro"] = {
		label = "Micro-ondas",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["twerks_candy"] = {
		label = "Twerks Bar",
		weight = 250,
		stack = true,
		close = true,
		description = "Tasty Bar",
		client = {
			image = "twerks_candy.png",
		}
	},

	["empty_weed_bag"] = {
		label = "Empty Weed Bag",
		weight = 0,
		stack = true,
		close = true,
		description = "A small empty bag",
		client = {
			image = "weed_baggy_empty.png",
		}
	},

	["usb_purple"] = {
		label = "USB Drive",
		weight = 50,
		stack = true,
		close = false,
		description = "A purple USB flash drive",
		client = {
			image = "usb_purple.png",
		}
	},

	["keepcompanionpug"] = {
		label = "Pug",
		weight = 500,
		stack = false,
		close = true,
		description = "Pug is your royal companion!",
		client = {
			image = "A_C_Pug.png",
		}
	},

	["aluminum"] = {
		label = "Aluminium",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "aluminum.png",
		}
	},

	["pacific_key3"] = {
		label = "Bank Data Key",
		weight = 50,
		stack = false,
		close = true,
		description = "A data key stolen from the pacific bank.",
		client = {
			image = "pacific_key3.png",
		}
	},

	["rubber"] = {
		label = "Rubber",
		weight = 50,
		stack = true,
		close = false,
		description = "Rubber, I believe you can make your own rubber ducky with it :D",
		client = {
			image = "rubber.png",
		}
	},

	["walkingmansign"] = {
		label = "Pedestrian Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Pedestrian Sign",
		client = {
			image = "walkingmansign.png",
		}
	},

	["purple_haze_bud"] = {
		label = "Purple Haze dried bud",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purple_haze_bud.png",
		}
	},

	["weed_purple-haze"] = {
		label = "Purple Haze 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g Purple Haze",
		client = {
			image = "weed_baggy.png",
		}
	},

	["radioscanner"] = {
		label = "Radio Scanner",
		weight = 250,
		stack = true,
		close = true,
		description = "With this you can get some police alerts. Not 100% effective however",
		client = {
			image = "radioscanner.png",
		}
	},

	["gatecrack"] = {
		label = "Gatecrack",
		weight = 5,
		stack = true,
		close = true,
		description = "Handy software to tear down some fences",
		client = {
			image = "usb_device.png",
		}
	},

	["keepcompanionmtlion"] = {
		label = "MtLion",
		weight = 500,
		stack = false,
		close = true,
		description = "MtLion is your royal companion!",
		client = {
			image = "A_C_MtLion.png",
		}
	},

	["meth_table"] = {
		label = "Table",
		weight = 20000,
		stack = false,
		close = true,
		description = "Meth Table [TO BE SEIZED BY PD]",
		client = {
			image = "meth_table.png",
		}
	},

	["diving_gear"] = {
		label = "Diving Gear",
		weight = 24300,
		stack = false,
		close = true,
		description = "An oxygen tank and a rebreather",
		client = {
			image = "diving_gear.png",
		}
	},

	["keepcompanionhen"] = {
		label = "Hen",
		weight = 500,
		stack = false,
		close = true,
		description = "Hen is your royal companion!",
		client = {
			image = "A_C_Hen.png",
		}
	},

	["goldchain"] = {
		label = "Golden Chain",
		weight = 700,
		stack = true,
		close = true,
		description = "A golden chain seems like the jackpot to me!",
		client = {
			image = "goldchain.png",
		}
	},

	["prisonchemicals"] = {
		label = "Chemicals",
		weight = 1000,
		stack = true,
		close = false,
		description = "Some random chemicals",
		client = {
			image = "prisonchemicals.png",
		}
	},

	["10kgoldchain"] = {
		label = "10k Gold Chain",
		weight = 800,
		stack = true,
		close = true,
		description = "10 carat golden chain",
		client = {
			image = "10kgoldchain.png",
		}
	},

	["trojan_usb"] = {
		label = "Trojan USB",
		weight = 50,
		stack = true,
		close = true,
		description = "Handy software to shut down some systems",
		client = {
			image = "usb_device.png",
		}
	},

	["meteorite-bar"] = {
		label = "Meteorite Bar",
		weight = 200,
		stack = true,
		close = true,
		description = "Tasty Bar",
		client = {
			image = "meteorite-bar.png",
		}
	},

	["meatlion"] = {
		label = "Cougar Claws",
		weight = 100,
		stack = true,
		close = false,
		description = "Cougar Claw",
		client = {
			image = "cougarclaw.png",
		}
	},

	["prisonrock"] = {
		label = "Coarse Rock",
		weight = 1000,
		stack = true,
		close = false,
		description = "A very big coarse rock",
		client = {
			image = "prisonrock.png",
		}
	},

	["prisonmeth"] = {
		label = "Crank",
		weight = 1,
		stack = true,
		close = true,
		description = "Prison made meth of low quality.",
		client = {
			image = "prisonmeth.png",
		}
	},

	["binoculars"] = {
		label = "Binoculars",
		weight = 500,
		stack = true,
		close = true,
		description = "Sneaky Breaky...",
		client = {
			image = "binoculars.png",
		}
	},

	["laptop"] = {
		label = "Laptop",
		weight = 2250,
		stack = false,
		close = true,
		description = "Laptop",
		client = {
			image = "laptop.png",
		}
	},

	["purple_haze_nugget"] = {
		label = "Purple Haze Nugget",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purple_haze_nugget.png",
		}
	},

	["police_stormram"] = {
		label = "Stormram",
		weight = 10000,
		stack = true,
		close = true,
		description = "A nice tool to break into doors",
		client = {
			image = "police_stormram.png",
		}
	},

	["rolex"] = {
		label = "Golden Watch",
		weight = 450,
		stack = true,
		close = true,
		description = "A golden watch seems like the jackpot to me!",
		client = {
			image = "rolex.png",
		}
	},

	["cranberry"] = {
		label = "Cranberry Juice",
		weight = 200,
		stack = true,
		close = true,
		description = "Cranberry Juice!",
		client = {
			image = "cranberry.png",
		}
	},

	["weed_og-kush"] = {
		label = "OGKush 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g OG Kush",
		client = {
			image = "weed_baggy.png",
		}
	},

	["syphoningkit"] = {
		label = "Syphoning Kit",
		weight = 1500,
		stack = false,
		close = false,
		description = "A kit made to siphon gasoline from vehicles.",
		client = {
			image = "syphoningkit.png",
		}
	},

	["vpn"] = {
		label = "VPN",
		weight = 260,
		stack = true,
		close = false,
		description = "VPN [TO BE SEIZED BY PD]",
		client = {
			image = "vpn.png",
		}
	},

	["firework3"] = {
		label = "WipeOut",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework3.png",
		}
	},

	["security_card_01"] = {
		label = "Security Card A",
		weight = 50,
		stack = true,
		close = true,
		description = "A security card... I wonder what it goes to",
		client = {
			image = "security_card_01.png",
		}
	},

	["grape"] = {
		label = "Grape",
		weight = 100,
		stack = true,
		close = false,
		description = "Mmmmh yummie, grapes",
		client = {
			image = "grape.png",
		}
	},

	["water_can"] = {
		label = "Water Can",
		weight = 0,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "water_can.png",
		}
	},

	["glass"] = {
		label = "Glass",
		weight = 100,
		stack = true,
		close = false,
		description = "It is very fragile, watch out",
		client = {
			image = "glass.png",
		}
	},

	["keepcompanionretriever"] = {
		label = "Retriever",
		weight = 500,
		stack = false,
		close = true,
		description = "Retriever is your royal companion!",
		client = {
			image = "A_C_Retriever.png",
		}
	},

	["pacific_key2"] = {
		label = "Bank Data Key",
		weight = 50,
		stack = false,
		close = true,
		description = "A data key stolen from the pacific bank.",
		client = {
			image = "pacific_key2.png",
		}
	},

	["keepcompanionpoodle"] = {
		label = "Poodle",
		weight = 500,
		stack = false,
		close = true,
		description = "Poodle is your royal companion!",
		client = {
			image = "A_C_Poodle.png",
		}
	},

	["repairkit"] = {
		label = "Repairkit",
		weight = 2500,
		stack = true,
		close = true,
		description = "A nice toolbox with stuff to repair your vehicle",
		client = {
			image = "repairkit.png",
		}
	},

	["methylamine"] = {
		label = "Methylamine",
		weight = 1000,
		stack = true,
		close = false,
		description = "A derivative of ammonia, but with one H atom replaced by a methyl group",
		client = {
			image = "methylamine.png",
		}
	},

	["camera"] = {
		label = "Camera",
		weight = 1000,
		stack = false,
		close = true,
		description = "Camera to take pretty pictures.",
		client = {
			image = "camera.png",
		}
	},

	["coffee"] = {
		label = "Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Pump 4 Caffeine",
		client = {
			image = "coffee.png",
		}
	},

	["firework1"] = {
		label = "2Brothers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework1.png",
		}
	},

	["yieldsign"] = {
		label = "Yield Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Yield Sign",
		client = {
			image = "yieldsign.png",
		}
	},

	["coke_small_brick"] = {
		label = "Coke Package",
		weight = 1000,
		stack = false,
		close = true,
		description = "Small package of cocaine, mostly used for deals and takes a lot of space",
		client = {
			image = "coke_small_brick.png",
		}
	},

	["pineapple_express_bud"] = {
		label = "Pineapple Express dried bud",
		weight = 0,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pineapple_express_bud.png",
		}
	},

	["diving_fill"] = {
		label = "Diving Tube",
		weight = 3000,
		stack = false,
		close = true,
		client = {
			image = "diving_tube.png",
		}
	},

	["cd"] = {
		label = "CD",
		weight = 50,
		stack = true,
		close = true,
		description = "Support your local artist!",
		client = {
			image = "cd.png",
		}
	},

	["meatbird"] = {
		label = "Bird Feather",
		weight = 100,
		stack = true,
		close = false,
		description = "Bird Feather",
		client = {
			image = "birdfeather.png",
		}
	},

	["whiskey"] = {
		label = "Whiskey",
		weight = 250,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "whiskey.png",
		}
	},

	["weed_ak47_seed"] = {
		label = "AK47 Seed",
		weight = 0,
		stack = true,
		close = true,
		description = "A weed seed of AK47",
		client = {
			image = "weed_seed.png",
		}
	},

	["stolenlaptop"] = {
		label = "Portátil",
		weight = 200,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "",
		}
	},

	["prisonbag"] = {
		label = "Plastic Bag",
		weight = 1,
		stack = true,
		close = false,
		description = "A plastic bag",
		client = {
			image = "prisonbag.png",
		}
	},

	["laptop_purple"] = {
		label = "Laptop",
		weight = 2250,
		stack = false,
		close = false,
		description = "A laptop made for hacking",
		client = {
			image = "laptop_purple.png",
		}
	},

	["prisonfarmseeds"] = {
		label = "Plant Seeds",
		weight = 5,
		stack = true,
		close = false,
		description = "Seeds, water, nutrition and love make happy plants",
		client = {
			image = "prisonfarmseeds.png",
		}
	},

	["meth"] = {
		label = "Meth",
		weight = 1,
		stack = true,
		close = true,
		description = "A baggie of Meth",
		client = {
			image = "meth_baggy.png",
		}
	},

	["orang-o-tang"] = {
		label = "Orang o Tang",
		weight = 200,
		stack = true,
		close = true,
		description = "The orange flavoured cola",
		client = {
			image = "orang-o-tang.png",
		}
	},

	["tosti"] = {
		label = "Grilled Cheese Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice to eat",
		client = {
			image = "tosti.png",
		}
	},

	["nachos"] = {
		label = "Nachos Chips",
		weight = 100,
		stack = true,
		close = true,
		description = "anyone got a napkin?",
		client = {
			image = "nachos.png",
		}
	},

	["laptop_blue"] = {
		label = "Laptop",
		weight = 2250,
		stack = false,
		close = true,
		description = "A laptop that you got from Ramsay",
		client = {
			image = "laptop_blue.png",
		}
	},

	["weed_white-widow"] = {
		label = "White Widow 2g",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed bag with 2g White Widow",
		client = {
			image = "weed_baggy.png",
		}
	},

	["crack_baggy"] = {
		label = "Bag of Crack",
		weight = 1,
		stack = true,
		close = true,
		description = "To get happy faster",
		client = {
			image = "crack_baggy.png",
		}
	},

	["meatrabbit"] = {
		label = "Rabbit Fur",
		weight = 100,
		stack = true,
		close = false,
		description = "Rabbit Fur",
		client = {
			image = "rabbitfur.png",
		}
	},

	["copper"] = {
		label = "Copper",
		weight = 500,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "copper.png",
		}
	},

	["meth_tray"] = {
		label = "Meth Tray",
		weight = 1000,
		stack = false,
		close = false,
		description = "Meth Tray",
		client = {
			image = "meth_tray.png",
		}
	},

	["ironoxide"] = {
		label = "Iron Powder",
		weight = 100,
		stack = true,
		close = false,
		description = "Some powder to mix with.",
		client = {
			image = "ironoxide.png",
		}
	},

	["electronickit"] = {
		label = "Electronic Kit",
		weight = 500,
		stack = true,
		close = true,
		description = "If you've always wanted to build a robot you can maybe start here. Maybe you'll be the new Elon Musk?",
		client = {
			image = "electronickit.png",
		}
	},

	["dendrogyra_coral"] = {
		label = "Dendrogyra",
		weight = 1000,
		stack = true,
		close = true,
		description = "Its also known as pillar coral",
		client = {
			image = "dendrogyra_coral.png",
		}
	},

	["emptyweed_jar"] = {
		label = "Empty Jar",
		weight = 250,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "emptyweed_jar.png",
		}
	},

	["pacific_key4"] = {
		label = "Bank Data Key",
		weight = 50,
		stack = false,
		close = true,
		description = "A data key stolen from the pacific bank.",
		client = {
			image = "pacific_key4.png",
		}
	},

	["keepcompanionshepherd"] = {
		label = "Shepherd",
		weight = 500,
		stack = false,
		close = true,
		description = "Shepherd is your royal companion!",
		client = {
			image = "A_C_shepherd.png",
		}
	},

	["xtcbaggy"] = {
		label = "Bag of XTC",
		weight = 1,
		stack = true,
		close = true,
		description = "Pop those pills baby",
		client = {
			image = "xtc_baggy.png",
		}
	},

	["dongle"] = {
		label = "USB Dongle",
		weight = 50,
		stack = false,
		close = true,
		description = "Dingle Dongle [TO BE SEIZED BY PD]",
		client = {
			image = "dongle.png",
		}
	},

	["printerdocument"] = {
		label = "Document",
		weight = 50,
		stack = false,
		close = true,
		description = "A nice document",
		client = {
			image = "printerdocument.png",
		}
	},

	["armor"] = {
		label = "Armor",
		weight = 3000,
		stack = true,
		close = true,
		description = "Some protection won't hurt... right?",
		client = {
			image = "armor.png",
		}
	},

	["ecoladiet"] = {
		label = "Diet eCola",
		weight = 200,
		stack = true,
		close = true,
		description = "Genuine Diet Cola",
		client = {
			image = "ecoladiet.png",
		}
	},

	["tunerlaptop"] = {
		label = "Tunerchip",
		weight = 650,
		stack = false,
		close = true,
		description = "With this tunerchip you can get your car on steroids... If you know what you're doing",
		client = {
			image = "tunerchip.png",
		}
	},

	["beer"] = {
		label = "Beer",
		weight = 200,
		stack = true,
		close = true,
		description = "Nothing like a good cold beer!",
		client = {
			image = "beer.png",
		}
	},

	["laptop_red"] = {
		label = "Laptop",
		weight = 2250,
		stack = false,
		close = true,
		description = "A laptop that you got from Plague",
		client = {
			image = "laptop_red.png",
		}
	},

	["ak_47_bud"] = {
		label = "Ak 47 dried bud",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ak_47_bud.png",
		}
	},

	["keepcompanioncat"] = {
		label = "Cat",
		weight = 500,
		stack = false,
		close = true,
		description = "Cat is your royal companion!",
		client = {
			image = "A_C_Cat_01.png",
		}
	},

	["blue_dream_bud"] = {
		label = "BlueDream dried bud",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blue_dream_bud.png",
		}
	},

	["racingusb2"] = {
		label = "Racing Dongle",
		weight = 500,
		stack = false,
		close = true,
		description = "To be seized - Illegal Item!",
		client = {
			image = "racingusb2.png",
		}
	},

	["jerrycan"] = {
		label = "Jerry Can",
		weight = 2500,
		stack = false,
		close = false,
		description = "A Jerry Can made to hold gasoline.",
		client = {
			image = "jerrycan.png",
		}
	},

	["plastic"] = {
		label = "Plastic",
		weight = 100,
		stack = true,
		close = false,
		description = "RECYCLE! - Greta Thunberg 2019",
		client = {
			image = "plastic.png",
		}
	},

	["hlabs_chemicals"] = {
		label = "Unknown Chemical",
		weight = 1000,
		stack = true,
		close = true,
		description = "Bottles of unknown chemicals, stolen from Humane Labs..",
		client = {
			image = "hlabs_chemicals.png",
		}
	},

	["rolling_paper"] = {
		label = "Rolling Paper",
		weight = 1,
		stack = true,
		close = true,
		description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
		client = {
			image = "rolling_paper.png",
		}
	},

	["steel"] = {
		label = "Steel",
		weight = 100,
		stack = true,
		close = false,
		description = "Nice piece of metal that you can probably use for something",
		client = {
			image = "steel.png",
		}
	},

	["photo"] = {
		label = "Saved Pic",
		weight = 100,
		stack = false,
		close = true,
		description = "Brand new picture saved!",
		client = {
			image = "photo.png",
		}
	},

	["firework2"] = {
		label = "Poppelers",
		weight = 1000,
		stack = true,
		close = true,
		description = "Fireworks",
		client = {
			image = "firework2.png",
		}
	},

	["pineapple_express_nugget"] = {
		label = "Pineapple Express Nugget",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pineapple_express_nugget.png",
		}
	},

	["rightturnsign"] = {
		label = "Right Turn Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Right Turn Sign",
		client = {
			image = "rightturnsign.png",
		}
	},

	["keepcompanioncoyote"] = {
		label = "Coyote",
		weight = 500,
		stack = false,
		close = true,
		description = "Coyote is your royal companion!",
		client = {
			image = "A_C_Coyote.png",
		}
	},

	["grapejuice"] = {
		label = "Grape Juice",
		weight = 200,
		stack = true,
		close = false,
		description = "Grape juice is said to be healthy",
		client = {
			image = "grapejuice.png",
		}
	},

	["driver_license"] = {
		label = "Drivers License",
		weight = 0,
		stack = false,
		close = false,
		description = "Permit to show you can drive a vehicle",
		client = {
			image = "driver_license.png",
		}
	},

	["newsbmic"] = {
		label = "Boom Microphone",
		weight = 500,
		stack = false,
		close = true,
		description = "A Useable BoomMic",
		client = {
			image = "newsbmic.png",
		}
	},

	["petnametag"] = {
		label = "Name tag",
		weight = 100,
		stack = true,
		close = true,
		description = "Rename your pet",
		client = {
			image = "petnametag.png",
		}
	},

	["pinger"] = {
		label = "Pinger",
		weight = 50,
		stack = true,
		close = true,
		description = "With a pinger and your phone you can send out your location",
		client = {
			image = "pinger.png",
		}
	},

	["meatdeer"] = {
		label = "Deer Horns",
		weight = 100,
		stack = true,
		close = false,
		description = "Deer Horns",
		client = {
			image = "deerhorns.png",
		}
	},

	["police_badge"] = {
		label = "Law Enforcement Badge",
		weight = 75,
		stack = false,
		close = true,
		description = "A police badge.",
		client = {
			image = "police_badge.png",
		}
	},

	["uturnsign"] = {
		label = "U Turn Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "U Turn Sign",
		client = {
			image = "uturnsign.png",
		}
	},

	["latte-machiatto"] = {
		label = "Latte Machiatto",
		weight = 250,
		stack = true,
		close = true,
		description = "Milky smooth taste",
		client = {
			image = "latte-machiatto.png",
		}
	},

	["firstaid"] = {
		label = "First Aid",
		weight = 600,
		stack = true,
		close = true,
		description = "You can use this First Aid kit to get people back on their feet",
		client = {
			image = "firstaid.png",
		}
	},

	["petwaterbottleportable"] = {
		label = "Portable water bottle",
		weight = 60,
		stack = false,
		close = true,
		description = "Flask to store water for your pets",
		client = {
			image = "petwaterbottleportable.png",
		}
	},

	["blue_dream_nugget"] = {
		label = "BlueDream Nugget",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blue_dream_nugget.png",
		}
	},

	["ecgonine"] = {
		label = "Ecgonine",
		weight = 500,
		stack = true,
		close = false,
		description = "Ecgonine (tropane derivative) is a tropane alkaloid",
		client = {
			image = "ecgonine.png",
		}
	},

	["white_widow_nugget"] = {
		label = "White Widow Nugget",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "white_widow_nugget.png",
		}
	},

	["weed_white-widow_seed"] = {
		label = "White Widow Seed",
		weight = 2,
		stack = true,
		close = false,
		description = "A weed seed of White Widow",
		client = {
			image = "weed_seed.png",
		}
	},

	["laptop_green"] = {
		label = "Laptop",
		weight = 2250,
		stack = false,
		close = true,
		description = "A laptop that you got from Ph03nix",
		client = {
			image = "laptop_green.png",
		}
	},

	["stopsign"] = {
		label = "Stop Sign",
		weight = 1,
		stack = true,
		close = true,
		description = "Stop Sign",
		client = {
			image = "stopsign.png",
		}
	},

	["weed_skunk_seed"] = {
		label = "Skunk Seed",
		weight = 1,
		stack = true,
		close = true,
		description = "A weed seed of Skunk",
		client = {
			image = "weed_seed.png",
		}
	},

	["pineapple_express_seed"] = {
		label = "Pineapple Express Seed",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["certificate"] = {
		label = "Certificate",
		weight = 0,
		stack = true,
		close = true,
		description = "Certificate that proves you own certain stuff",
		client = {
			image = "certificate.png",
		}
	},

	["sandwich"] = {
		label = "Sandwich",
		weight = 200,
		stack = true,
		close = true,
		description = "Nice bread for your stomach",
		client = {
			image = "sandwich.png",
		}
	},

	["usb_red"] = {
		label = "USB Drive",
		weight = 60,
		stack = true,
		close = false,
		description = "A red USB flash drive",
		client = {
			image = "usb_red.png",
		}
	},

	["meatboar"] = {
		label = "Boar Tusks",
		weight = 100,
		stack = true,
		close = false,
		description = "Boar Tusks",
		client = {
			image = "boartusks.png",
		}
	},

	["water_bottle"] = {
		label = "Bottle of Water",
		weight = 200,
		stack = true,
		close = true,
		description = "For all the thirsty out there",
		client = {
			image = "water_bottle.png",
		}
	},

	["nitrous"] = {
		label = "Nitrous Oxide",
		weight = 1750,
		stack = false,
		client = {
			image = "nitrous.png",
			export = 'rho-nitrous.nitrous',
		}
	},

	["snikkel_candy"] = {
		label = "Snikkel Bar",
		weight = 150,
		stack = true,
		close = true,
		description = "half milk half dark",
		client = {
			image = "snikkel_candy.png",
		}
	},

	["huntingbait"] = {
		label = "Hunting Bait",
		weight = 2000,
		stack = true,
		close = true,
		description = "Hunting Bait",
		client = {
			image = "huntingbait.png",
		}
	},

	["fakeplate"] = {
		label = "Fake Plate",
		weight = 350,
		stack = false,
		close = true,
		description = "This plate seems... sus",
		client = {
			image = "fakeplate.png",
		}
	},

	--weapon tints  
	  ['greentint'] = { 
		label = 'Green Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 1
		}
	  },
	  
	  ['goldtint'] = { 
		label = 'Gold Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 2
		}
	  },
	  
	  ['pinktint'] = { 
		label = 'Pink Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 3
		}
	  },
	  
	  ['armytint'] = { 
		label = 'Army Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 4
		}
	  },
	  
	  ['lspdtint'] = { 
		label = 'LSPD Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 5
		}
	  },
	  
	  ['orangetint'] = { 
		label = 'Orange Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 6
		}
	  },
	  
	  ['platinumtint'] = { 
		label = 'Platinum Weapon Tint',
		stack = false,
		close = true,
		allowArmed = true,
		weight = 10,
		server = {
		  export = 'qb-smallresources.setweapontint',
		  tint = 7
		}
	  },

	  --Renewed Farming

	  ['pitchfork'] = {
		label = 'Pitch Fork',
		weight = 1000,
		client = {
			export = 'Renewed-Farming.harvestPlants'
		},
		},
		
		['wateringcan_farm'] = {
			label = 'Watering Can',
			weight = 500,
		},
		
		['beetroot'] = {
			label = 'Beetroot',
			description = 'Freshly harvested beetroot, perfect for cooking or adding to salads.',
			weight = 100
		},
		['beetrootseed'] = {
			label = 'Beetroot Seed',
			description = 'Small seeds used to grow beetroot plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			},
		},
		
		['carrot'] = {
			label = 'Carrot',
			description = 'Crisp and nutritious carrots, a staple ingredient in many recipes. Can be enjoyed raw or cooked.',
			weight = 100
		},
		['carrotseed'] = {
			label = 'Carrot Seed',
			description = 'Tiny seeds used to grow carrot plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['corn'] = {
			label = 'Corn',
			description = 'Freshly harvested corn, sweet and juicy. Great for grilling or boiling.',
			weight = 100
		},
		['cornseed'] = {
			label = 'Corn Seed',
			description = 'Small seeds used to grow corn plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['cucumber'] = {
			label = 'Cucumber',
			description = 'Crisp and refreshing cucumbers, perfect for salads or pickling.',
			weight = 100
		},
		['cucumberseed'] = {
			label = 'Cucumber Seed',
			description = 'Tiny seeds used to grow cucumber plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['garlic'] = {
			label = 'Garlic',
			description = 'Aromatic garlic bulbs, known for their strong flavor and various culinary uses.',
			weight = 100
		},
		['garlicseed'] = {
			label = 'Garlic Seed',
			description = 'Small cloves used to grow garlic plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['potato'] = {
			label = 'Potato',
			description = 'Versatile and starchy potatoes, ideal for mashing, baking, or frying.',
			weight = 200,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['pumpkin'] = {
			label = 'Pumpkin',
			description = 'Large and festive pumpkins, perfect for carving or using in autumn recipes.',
			weight = 250,
		},
		['pumpkinseed'] = {
			label = 'Pumpkin Seed',
			description = 'Seeds used to grow pumpkin plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['radish'] = {
			label = 'Radish',
			description = 'Crunchy and peppery radishes, great for adding a kick to salads or pickling.',
			weight = 150
		},
		['radishseed'] = {
			label = 'Radish Seed',
			description = 'Small seeds used to grow radish plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['sunflower'] = {
			label = 'Sunflower',
			description = 'Bright and cheerful sunflowers, known for their tall stalks and vibrant yellow petals.',
			weight = 100
		},
		['sunflowerseed'] = {
			label = 'Sunflower Seed',
			description = 'Seeds used to grow sunflower plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['tomato'] = {
			label = 'Tomato',
			description = 'Juicy and flavorful tomatoes, perfect for salads, sauces, or sandwiches.',
			weight = 50
		},
		['tomatoseed'] = {
			label = 'Tomato Seed',
			description = 'Small seeds used to grow tomato plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['watermelon'] = {
			label = 'Watermelon',
			description = 'Large and refreshing watermelons, perfect for summertime enjoyment.',
			weight = 500
		},
		['watermelonseed'] = {
			label = 'Watermelon Seed',
			description = 'Seeds used to grow watermelon plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['cabbage'] = {
			label = 'Cabbage',
			description = 'Fresh and crisp cabbage, perfect for salads and cooking.',
			weight = 400
		},
		['cabbageseed'] = {
			label = 'Cabbage Seed',
			description = 'Seeds used to grow cabbage plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['onion'] = {
			label = 'Onion',
			description = 'Pungent and flavorful onions, a kitchen essential.',
			weight = 50
		},
		['onionseed'] = {
			label = 'Onion Seed',
			description = 'Seeds used to grow onion plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},
		
		['wheat'] = {
			label = 'Wheat',
			description = 'Golden wheat grains, a staple crop used for making flour and various food products.',
			weight = 100
		},
		['wheatseed'] = {
			label = 'Wheat Seed',
			description = 'Small seeds used to grow wheat plants.',
			weight = 10,
			client = {
				export = 'Renewed-Farming.placeSeed'
			}
		},

	["album"] = {
		label = "Album Polaroid",
		weight = 100,
		stack = false,
		close = true,
		description = "A really nice album",
		client = {
			image = "album.png",
		}
	},

	["polaroid"] = {
		label = "Camera Polaroid",
		weight = 500,
		stack = false,
		close = true,
		description = "A super Polaroid Camera",
		client = {
			image = "polaroid.png",
		}
	},

	["paperpolaroid"] = {
		label = "Paper empty",
		weight = 1,
		stack = false,
		close = true,
		description = "A empty paper for polaroid printer",
		client = {
			image = "paperpolaroid.png",
		}
	},

	['tcgpack'] = {
		label = 'Trading Card Pack',
		weight = 500,
		stack = true,
		close = true,
		description = "A super nice pack of card"
	},

	["taserammo"] = {
		label = "Cartridge",
		weight = 5,
		stack = false,
		close = true,
		description = "PD Taser Cartridge",
		client = {
			image = "np_taserammo.png",
		}
	},

	["drone"] = {
		label = "Drone",
		weight = 299,
		stack = false,
		close = true,
		description = "Have Fun Flying",
		client = {
			image = "drone.png",
		}
	},

	["drone_lspd"] = {
		label = "LSPD Drone",
		weight = 299,
		stack = false,
		close = true,
		description = "Have Fun Flying",
		client = {
			image = "drone_lspd.png",
		}
	},

	['binder'] = {
		label = 'Binder',
		weight = 300,
		stack = false,
		close = true,
		description = "A nice binder"
	},

	["SA80"] = {
		label = "Sp34r Gun",
		weight = 1500,
		stack = false,
		close = true,
		description = "Weapon Militaryrifle",
		client = {
			image = "weapon_militaryrifle.png",
		}
	},

	["printerpolaroid"] = {
		label = "Printer Polaroid",
		weight = 1000,
		stack = false,
		close = true,
		description = "A super Polaroid Printer",
		client = {
			image = "printerPolaroid.png",
		}
	},

	["pd_dashcam"] = {
		label = "Dash Cam",
		weight = 750,
		stack = false,
		close = true,
		description = "PD Dash Cam",
		client = {
			image = "dashcam.png",
		}
	},
	["towingrope"] = {
		label = "Towing Rope",
		weight = 2500,
		stack = false,
		close = true,
		description = "Wonder waht i can pull with this...",
		client = {
			image = "dashcam.png",
		}
	},

	--Mechanic Parts 
	--A CLASS PARTS
	["afixengine"] = {
		label = "Engine Parts (A)",
		weight = 5000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_a.png",
		}
	},
	["afixbrakes"] = {
		label = "Brake Parts (A)",
		weight = 2500,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_a.png",
		}
	},
	["afixbody"] = {
		label = "Body Panels (A)",
		weight = 7500,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_a.png",
		}
	},
	["afixradiator"] = {
		label = "Radiator Parts (A)",
		weight = 3000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_a.png",
		}
	},
	["afixaxle"] = {
		label = "Axle Parts (A)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_a.png",
		}
	},
	["afixclutch"] = {
		label = "Clutch Parts (A)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_a.png",
		}
	},
	["afixinjector"] = {
		label = "Fuel Injectors (A)",
		weight = 500,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_a.png",
		}
	},
	--B CLASS PARTS
	["bfixengine"] = {
		label = "Engine Parts (B)",
		weight = 5000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_b.png",
		}
	},
	["bfixbrakes"] = {
		label = "Brake Parts (B)",
		weight = 2500,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_b.png",
		}
	},
	["bfixbody"] = {
		label = "Body Panels (B)",
		weight = 7500,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_b.png",
		}
	},
	["bfixradiator"] = {
		label = "Radiator Parts (B)",
		weight = 3000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_B.png",
		}
	},
	["bfixaxle"] = {
		label = "Axle Parts (B)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_b.png",
		}
	},
	["bfixclutch"] = {
		label = "Clutch Parts (B)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_b.png",
		}
	},
	["bfixinjector"] = {
		label = "Fuel Injectors (B)",
		weight = 500,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_b.png",
		}
	},
	--C CLASS PARTS
	["cfixengine"] = {
		label = "Engine Parts (C)",
		weight = 5000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_c.png",
		}
	},
	["cfixbrakes"] = {
		label = "Brake Parts (C)",
		weight = 2500,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_c.png",
		}
	},
	["cfixbody"] = {
		label = "Body Panels (C)",
		weight = 7500,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_c.png",
		}
	},
	["cfixradiator"] = {
		label = "Radiator Parts (C)",
		weight = 3000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_c.png",
		}
	},
	["cfixaxle"] = {
		label = "Axle Parts (C)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_c.png",
		}
	},
	["cfixclutch"] = {
		label = "Clutch Parts (C)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_c.png",
		}
	},
	["cfixinjector"] = {
		label = "Fuel Injectors (C)",
		weight = 500,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_c.png",
		}
	},
	--D CLASS PARTS
	["dfixengine"] = {
		label = "Engine Parts (D)",
		weight = 5000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_d.png",
		}
	},
	["dfixbrakes"] = {
		label = "Brake Parts (D)",
		weight = 2500,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_d.png",
		}
	},
	["dfixbody"] = {
		label = "Body Panels (D)",
		weight = 7500,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_d.png",
		}
	},
	["dfixradiator"] = {
		label = "Radiator Parts (D)",
		weight = 3000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_d.png",
		}
	},
	["dfixaxle"] = {
		label = "Axle Parts (D)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_d.png",
		}
	},
	["dfixclutch"] = {
		label = "Clutch Parts (D)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_d.png",
		}
	},
	["dfixinjector"] = {
		label = "Fuel Injectors (D)",
		weight = 500,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_d.png",
		}
	},
	--S CLASS PARTS
	["sfixengine"] = {
		label = "Engine Parts (S)",
		weight = 5000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_s.png",
		}
	},
	["sfixbrakes"] = {
		label = "Brake Parts (S)",
		weight = 2500,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_s.png",
		}
	},
	["sfixbody"] = {
		label = "Body Panels (S)",
		weight = 7500,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_s.png",
		}
	},
	["sfixradiator"] = {
		label = "Radiator Parts (S)",
		weight = 3000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_s.png",
		}
	},
	["sfixaxle"] = {
		label = "Axle Parts (S)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_s.png",
		}
	},
	["sfixclutch"] = {
		label = "Clutch Parts (S)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_s.png",
		}
	},
	["sfixinjector"] = {
		label = "Fuel Injectors (S)",
		weight = 500,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_s.png",
		}
	},
	--M CLASS PARTS
	["mfixengine"] = {
		label = "Engine Parts (M)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New engine parts",
		client = {
			image = "ev_engine_parts_m.png",
		}
	},
	["mfixbrakes"] = {
		label = "Brake Parts (M)",
		weight = 2000,
		stack = true,
		close = true,
		description = "New brake discs, pads, calipers, hubs & accessories",
		client = {
			image = "ev_brake_parts_m.png",
		}
	},
	["mfixbody"] = {
		label = "Body Panels (M)",
		weight = 4000,
		stack = true,
		close = true,
		description = "New vehicle body panels",
		client = {
			image = "ev_body_panels_m.png",
		}
	},
	["mfixradiator"] = {
		label = "Radiator Parts (M)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New radiator and cooling parts",
		client = {
			image = "ev_cooling_parts_m.png",
		}
	},
	["mfixaxle"] = {
		label = "Axle Parts (M)",
		weight = 1000,
		stack = true,
		close = true,
		description = "New axle components",
		client = {
			image = "ev_axle_parts_m.png",
		}
	},
	["mfixclutch"] = {
		label = "Clutch Parts (M)",
		weight = 500,
		stack = true,
		close = true,
		description = "New clutch disc and pressure plate",
		client = {
			image = "ev_clutch_parts_m.png",
		}
	},
	["mfixinjector"] = {
		label = "Fuel Injectors (M)",
		weight = 400,
		stack = true,
		close = true,
		description = "New fuel injectors",
		client = {
			image = "ev_fuel_injectors_m.png",
		}
	},
	
	--crafting mech
	["agenericmechanicpart"] = {
		label = "Mechanical Part (A)",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanical Parts For Repairs",
		client = {
			image = "ev_generic_mechanical_A.png",
		}
	},
	["bgenericmechanicpart"] = {
		label = "Mechanical Part (B)",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanical Parts For Repairs",
		client = {
			image = "ev_generic_mechanical_B.png",
		}
	},
	["cgenericmechanicpart"] = {
		label = "Mechanical Part (C)",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanical Parts For Repairs",
		client = {
			image = "ev_generic_mechanical_C.png",
		}
	},
	["dgenericmechanicpart"] = {
		label = "Mechanical Part (D)",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanical Parts For Repairs",
		client = {
			image = "ev_generic_mechanical_D.png",
		}
	},
	["mgenericmechanicpart"] = {
		label = "Mechanical Part (M)",
		weight = 500,
		stack = true,
		close = true,
		description = "Mechanical Parts For Repairs",
		client = {
			image = "ev_generic_mechanical_M.png",
		}
	},
	["sgenericmechanicpart"] = {
		label = "Mechanical Part (S)",
		weight = 500,
		stack = true,
		close = true,
		description = "Recyclable Material",
		client = {
			image = "ev_generic_mechanical_S.png",
		}
	},
	["recyclablematerial"] = {
		label = "Recyclable Material",
		weight = 50,
		stack = true,
		close = true,
		description = "Used for crafting",
		client = {
			image = "ev_recyclable-material.png",
		}
	},

	--av runs
	['hacking_device'] = {
		label = 'Hacking Device',
		weight = 500,
		stack = true,
		close = true,
		description = ''
		},
	['drug_package'] = {
		label = 'Illegal Package',
		weight = 760,
		stack = false,
		close = false,
		description = 'Marked for police seizure'
	},

	--casino 
	['casino_member'] = {
		label = 'Membership',
		weight = 1,
		stack = false,
		close = false,
		description = 'Casino Membership'
	},
	['casino_goldchip'] = {
		label = 'Chip',
		weight = 1,
		stack = true,
		close = false,
		description = 'Casino Gold Chip'
	},
	['casino_vip'] = {
		label = 'VIP',
		weight = 1,
		stack = false,
		close = false,
		description = 'Casino VIP Membership'
	},

	--containers 
	["container_green_small"] = {
        label = "Small Green Container",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },

    ["container_blue_mid"] = {
        label = "Mid Blue Container",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },

    ["container_old_mid"] = {
        label = "Mid Old Container",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },

    ["container_white_mid"] = {
        label = "Mid White Container",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },

    ["containerboltcutter"] = {
        label = "Boltcutter",
        weight = 1000,
        stack = false,
        close = false,
        description = 'a boltcutter to open containers by police',
		client = {
			image = "boltcutter.png",
		}
     },


	 --mechanic shit

	 ["receipt"] = {
        label = "Vehicle Receipt",
        weight = 1,
        stack = false,
        close = true,
        description = nil
     },
	 ["spraycan"] = {
        label = "Spray Can",
        weight = 500,
        stack = false,
        close = true,
        description = nil
     },
	 ["engine"] = {
        label = "Engine",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },
	 ["brake"] = {
        label = "Brakes",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["transmission"] = {
        label = "Transmission",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["suspension"] = {
        label = "Suspension",
        weight = 7500,
        stack = false,
        close = true,
        description = nil
     },
	 ["turbo"] = {
        label = "Turbo",
        weight = 2250,
        stack = false,
        close = true,
        description = nil
     },
	 ["spoiler"] = {
        label = "Spoiler",
        weight = 4500,
        stack = false,
        close = true,
        description = nil
     },
	 ["fbumper"] = {
        label = "Front Bumper",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["rbumper"] = {
        label = "Rear Bumper",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["sideskirt"] = {
        label = "Side Skirt",
        weight = 7500,
        stack = false,
        close = true,
        description = nil
     },
	 ["exhaust"] = {
        label = "Exhaust",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["rollcage"] = {
        label = "Rollcage",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["grille"] = {
        label = "Grill",
        weight = 2000,
        stack = false,
        close = true,
        description = nil
     },
	 ["hood"] = {
        label = "Bonnet",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["lfender"] = {
        label = "Left Fender",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["rfender"] = {
        label = "Right Fender",
        weight = 10000,
        stack = false,
        close = true,
        description = nil
     },
	 ["roof"] = {
        label = "Roof",
        weight = 20000,
        stack = false,
        close = true,
        description = nil
     },
	 ["plate"] = {
        label = "Plate",
        weight = 450,
        stack = false,
        close = true,
        description = nil
     },
	 ["trima"] = {
        label = "Trim A",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["ornaments"] = {
        label = "Ornaments",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["dashboard"] = {
        label = "Dashboard",
        weight = 6000,
        stack = false,
        close = true,
        description = nil
     },
	 ["dial"] = {
        label = "Dials",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["doorspeaker"] = {
        label = "Door Speaker",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["seats"] = {
        label = "Seats",
        weight = 4500,
        stack = false,
        close = true,
        description = nil
     },
	 ["swheel"] = {
        label = "Steering Wheel", 
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["shifter"] = {
        label = "Shifter",
        weight = 500,
        stack = false,
        close = true,
        description = nil
     },
	 ["plaque"] = {
        label = "Plaque",
        weight = 500,
        stack = false,
        close = true,
        description = nil
     },
	 ["speaker"] = {
        label = "Speaker",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["trunk"] = {
        label = "Trunk",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },
	 ["hydraulic"] = {
        label = "Hydralic System",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },
	 ["engineblock"] = {
        label = "Enine Block",
        weight = 23000,
        stack = false,
        close = true,
        description = nil
     },
	 ["airfilter"] = {
        label = "Air Filter",
        weight = 750,
        stack = false,
        close = true,
        description = nil
     },
	 ["strut"] = {
        label = "Strut Mount",
        weight = 1250,
        stack = false,
        close = true,
        description = nil
     },
	 ["archcover"] = {
        label = "Arch cover",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["aerial"] = {
        label = "Aerial",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["trimb"] = {
        label = "Trim B",
        weight = 5000,
        stack = false,
        close = true,
        description = nil
     },
	 ["fueltank"] = {
        label = "Fuel Tank",
        weight = 7500,
        stack = false,
        close = true,
        description = nil
     },
	 ["window"] = {
        label = "Window",
        weight = 3000,
        stack = false,
        close = true,
        description = nil
     },
	 ["livery"] = {
        label = "Livery Wrap",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["horns"] = {
        label = "Horn",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["neon"] = {
        label = "Neon Kit",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["xenon"] = {
        label = "Xenon Kit",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["wheel"] = {
        label = "Alloy Wheel",
        weight = 2300,
        stack = false,
        close = true,
        description = nil
     },
	 ["extra"] = {
        label = "Extra Option",
        weight = 1000,
        stack = false,
        close = true,
        description = nil
     },
	 ["windowtint"] = {
        label = "Window Tint",
        weight = 100,
        stack = false,
        close = true,
        description = nil
     },
	 ["tyresmoke"] = {
        label = "Tyre Smoke Kit",
        weight = 3000,
        stack = false,
        close = true,
        description = nil
     },
	 ["driftkit"] = {
        label = "Drift Kit",
        weight = 15000,
        stack = false,
        close = true,
        description = nil
     },

	 --AV Dealership
	 ['contract'] = {
		label = 'Contract',
		weight = 1,
		stack = false,
		close = true,
		description = 'Used to buy vehicles for dealership'
	},

	--beeKeeping
	['beehive'] = { 
		label = 'Beehive',
		weight = 100,
		stack = false,
		consume = 0,
		server = {
			export = 'snipe-beekeeping.PlaceBeehive'
		},
	},

	['queen_bee'] = { 
		label = 'Queen Bee',
		weight = 1,
		stack = true,
		consume = 0,
	},

	['honey'] = { 
		label = 'Honey',
		weight = 150,
		stack = true,
		consume = 0,
	},

	['wax'] = { 
		label = 'Wax',
		weight = 150,
		stack = true,
		consume = 0,
	},

	['jelly'] = { 
		label = 'Jelly',
		weight = 50,
		stack = true,
		consume = 0,
	},

	--REP WEED
	['femaleseed'] = {
		label = 'Female Marijuana Seed',
		weight = 1,
		consume = 0,
		server = {
			export = 'rep-weed.femaleseed',
		},
		description = 'Surely I can just plant this, right?'
	},
	['maleseed'] = {
		label = 'Male Marijuana Seed',
		weight = 1,
		consume = 0,
		description = 'Add this to a planted female seed to make it pregnant? You are pretty sure this seed has a penis.'
	},
	['wateringcan'] = {
		label = 'Watering Can',
		weight = 1000,
		consume = 0,
		server = {
			export = 'rep-weed.wateringcan',
		},
		description = 'Fill this at a river or lake.'
	},
	['fertilizer'] = {
		label = 'Fertilizer',
		weight = 500,
		consume = 0,
		description = 'Cool'
	},
	['wetbud'] = {
		label = 'Wet Bud (100 grams)',
		weight = 100,
		consume = 0,
		description = 'THIS CANT BE DRIED WITHOUT STRAIN... Needs to be stored somewhere dry.'
	},
	['driedbud'] = {
		label = 'Dried Bud (100 Grams)',
		weight = 100,
		consume = 0,
		server = {
			export = 'rep-weed.driedbud',
		},
		description = 'Pack It?'
	},
	['weedpackage'] = {
		label = 'Suspicious Package',
		weight = 1000,
		consume = 0,
		server = {
			export = 'rep-weed.weedpackage',
		},
		description = 'Marked for Police Seizure'
	},
	['qualityscales'] = {
		label = 'Quality Scales',
		weight = 600,
		consume = 0,
		description = 'Weighs Baggies with no loss'
	},
	['smallscales'] = {
		label = 'Small Scales',
		weight = 300,
		description = 'Weighs Baggies with minimal loss'
	},
	['joint'] = {
		label = '2g Joint',
		weight = 2,
		consume = 0,
		server = {
			export = 'rep-weed.joint',
		},
		description = 'Its a Joint, man.'
	},
	['emptybaggies'] = {
		label = 'Empty Baggies',
		weight = 1,
		description = 'Empty Baggies'
	},
	['weedbaggie'] = {
		label = 'Baggie (7g)',
		weight = 7,
		consume = 0,
		server = {
			export = 'rep-weed.weedbaggie',
		},
		description = 'Sold on the streets'
	},
	['rollingpaper'] = {
		label = 'Rolling Paper',
		weight = 100,
		description = 'Required to roll joints!'
	},

	["og_kush_joint"] = {
		label = "Og Kush Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "og_kush_joint.png",
		}
	},

	["blue_dream_joint"] = {
		label = "BlueDream Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "blue_dream_joint.png",
		}
	},

	["white_widow_joint"] = {
		label = "White Widow Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "white_widow_joint.png",
		}
	},

	["white_widow_seed"] = {
		label = "White Widow Seed",
		weight = 1,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_seed.png",
		}
	},

	["weed_nutrition"] = {
		label = "Plant Fertilizer",
		weight = 300,
		stack = true,
		close = true,
		description = "Plant nutrition",
		client = {
			image = "weed_nutrition.png",
		}
	},

	["weed_fertilizer"] = {
		label = "Fertilizer",
		weight = 300,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "weed_fertilizer.png",
		}
	},

	["weed_joint"] = {
		label = "Weed Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "weed_joint.png",
		}
	},

	["purple_haze_joint"] = {
		label = "Purple Haze Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "purple_haze_joint.png",
		}
	},

	["ak_47_joint"] = {
		label = "Ak 47 Joint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "ak_47_joint.png",
		}
	},

	["pineapple_express_joint"] = {
		label = "Pineapple ExpressJoint",
		weight = 1,
		stack = true,
		close = false,
		description = "",
		client = {
			image = "pineapple_express_joint.png",
		}
	},

	['astrumbomb'] = {
		label = 'Mother Bomb',
		weight = 100,
		description = "Be carful!",
		client = {
			export = "Astrum_Bomb.SpawnBomb"
		},
	},
}