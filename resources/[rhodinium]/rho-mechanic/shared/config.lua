Config = Config or {}

Config.EventPrefix = 'QBCore' -- Core event prefix
Config.QBCoreFolderName = 'qb-core' -- Core folder name

Config.TargetFolderName = 'ox_target' -- name of the target folder
Config.Target = 'ox' -- qb or ox

Config.MenuEventPrefix = 'qb-menu' -- event prefix of menu
Config.MenuFolderName = 'qb-menu' -- menu folder name

Config.InventoryFolder = 'ox_inventory' -- inventory folder name
Config.RadialMenuFolder = 'qb-radialmenu' -- radial menu folder name
Config.Inventory = 'ox' -- target type (qb or ox only)
Config.Menu = 'ox' -- menu type (qb or ox)

Config.vehicleDataBase = 'player_vehicles' -- db table for vehicles

Config.ReceiptItem = 'receipt' -- Receipt Item name
Config.SprayItem = 'spraycan' -- Spray Item name
Config.NeonItem = 'neon' -- Neon Item name
Config.XenonItem = 'xenon' -- Xenon Item name
Config.WheelItem = 'wheel' -- Wheel Item name
Config.ExtraItem = 'extra' -- extra Item name
Config.WindowTintItem = 'windowtint' -- window tint item name
Config.TyreSmokeItem = 'tyresmoke' -- window tint item name

Config.UseItemBox = 'inventory:client:ItemBox' -- If using the event, change it as you want it, to disable set false

Config.UseRadial = true -- Will use qb-radial menu for entering instead of press E
Config.allowGovPlateIndex = false -- Setting this to true will allow all vehicles to purchase gov plate index "Blue on White #3" (only for emergency vehicles otherwise)
Config.maxVehiclePerformanceUpgrades = 0 -- | All Upgrades: 0 | No Upgrades: -1 | Can be -1 to 4

-- All the vehicles with back engine
Config.BackEngineVehicles = {'ninef', 'adder', 'vagner', 't20', 'infernus', 'zentorno', 'reaper', 'comet2', 'comet3', 'jester', 'jester2', 'cheetah', 'cheetah2', 'prototipo', 'turismor', 'pfister811', 'ardent', 'nero', 'nero2', 'tempesta', 'vacca', 'bullet', 'osiris', 'entityxf', 'turismo2', 'fmj', 're7b', 'tyrus', 'italigtb', 'penetrator', 'monroe', 'ninef2', 'stingergt', 'surfer', 'surfer2', 'comet3', "p1", "675ltsp", "senna" }

Config.Text = {
    errors = {
        itemError = 'Something is wrong with the item',
        missingItem = 'missing items',
        notEnoughMoney = "You don't have enought money on you",
        dmgveh = 'The vehicle must be fully repaired',
        unknownveh = 'You can not upgrade unknown vehicle',
        front = 'You must be in the front',
        back = 'You must be in the back',
        bennysError = 'You cant do anything here!',
    },
    success = {
        wheelUpgrade = 'Wheel has Changed successfully',
        neonUpgrade = 'Neon Has Changed successfully',
        colorUpgrade = 'Color Changed successfully installed',
        xenonUpgrade = 'Xenon Changed successfully installed',
        modUpgrade = 'Mod Changed successfully installed',
        extraUpgrade = 'Mod Changed successfully installed',
        windowTintUpgrade = 'Window Tint Changed successfully installed',
        tyreSmokeUpgrade = 'Window Tint Changed successfully installed',
    }
}

Config.CustomMaterials = { -- Materials for crafting by type
    ['mods'] = { -- type
        -- money = 500, -- can add money with/without the materials
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['engine'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['brakes'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['gear'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['suspension'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['armor'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['turbo'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['spray'] = {
        [1] = {
            name = 'iron',
            label = 'iron',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        }
    },
    ['neon'] = {
        [1] = {
            name = 'iron',
            label = 'iron',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        }
    },
    ['xenon'] = {
        [1] = {
            name = 'iron',
            label = 'iron',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        }
    },
    ['wheels'] = {
        [1] = {
            name = 'rubber',
            label = 'rubber',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        }
    },
    ['windowtint'] = {
        [1] = {
            name = 'iron',
            label = 'Iron',
            amount = 50
        },
        [2] = {
            name = 'steel',
            label = 'Steel',
            amount = 50
        }
    },
    ['extra'] = {
        [1] = {
            name = 'rubber',
            label = 'rubber',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        }
    },
    ['tyreSmoke'] = {
        [1] = {
            name = 'rubber',
            label = 'rubber',
            amount = 50
        },
        [2] = {
            name = 'plastic',
            label = 'plastic',
            amount = 50
        },
    },
}