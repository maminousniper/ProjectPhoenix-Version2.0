Hi, Thank you for buying rho-mechanic

Incase of any issues or bugs, feel free to join my server and report! https://discord.gg/yUScbNBxY3

## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/qbcore-framework/qb-target/releases

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-input - https://github.com/qbcore-framework/qb-input


Don't forget to grab all the images from rho-mechanic/images to your inventory images folder

## Insert into @qb-core/shared/items.lua 

```
	["receipt"] 			= {["name"] = "receipt", 		["label"] = "Receipt", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "receipt.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A mechanic receipt"},
	["spraycan"] 			= {["name"] = "spraycan", 		["label"] = "Spray Can for", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "spray.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Spray can for vehicles"},
	["engine"] 		 	 	= {["name"] = "engine", 		["label"] = "Engine", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "engine.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Engine"},
	["brake"] 		 	 	= {["name"] = "brake", 			["label"] = "Brakes", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "brake.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Brake"},
	["transmission"] 		= {["name"] = "transmission", 	["label"] = "Transmission", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "transmission.png", 						["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Transmission"},
	["suspension"] 		 	= {["name"] = "suspension", 	["label"] = "Suspension", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "suspension.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Suspension"},
	["turbo"] 		 	 	= {["name"] = "turbo", 			["label"] = "Turbo", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "turbo.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["spoiler"] 		 	= {["name"] = "spoiler", 		["label"] = "Spoiler", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "spoiler.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["fbumper"] 		 	= {["name"] = "fbumper", 		["label"] = "Front Bumper", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "fbumper.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rbumper"] 		 	= {["name"] = "rbumper", 		["label"] = "Rear Bumper", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "rbumper.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["sideskirt"] 		 	= {["name"] = "sideskirt", 		["label"] = "Side Skirt", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "sideskirt.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["exhaust"] 		 	= {["name"] = "exhaust", 		["label"] = "Exhaust", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "exhaust.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rollcage"] 		 	= {["name"] = "rollcage", 		["label"] = "Roll Cage", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "rollcage.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["grille"] 		 	 	= {["name"] = "grille", 		["label"] = "Grille", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "grille.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["hood"] 		 	 	= {["name"] = "hood", 			["label"] = "Hood", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "hood.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["lfender"] 		 	= {["name"] = "lfender", 		["label"] = "Left Fender", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "lfender.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["rfender"] 		 	= {["name"] = "rfender", 		["label"] = "Right Fender", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rfender.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["roof"] 		 	 	= {["name"] = "roof", 			["label"] = "Roof", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "roof.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["plate"] 		 	 	= {["name"] = "plate", 			["label"] = "Plate", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "plate.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["trima"] 		 	 	= {["name"] = "trima", 			["label"] = "Trim A", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "trima.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["ornaments"] 		 	= {["name"] = "ornaments", 		["label"] = "Ornaments", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "ornaments.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["dashboard"] 		 	= {["name"] = "dashboard", 		["label"] = "Dashboard", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "dashboard.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["dial"] 		 	 	= {["name"] = "dial", 			["label"] = "Dial", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "dial.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["doorspeaker"] 		= {["name"] = "doorspeaker", 	["label"] = "Door Speaker", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "doorspeaker.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["seats"] 		 	 	= {["name"] = "seats", 			["label"] = "Seats", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "seats.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["swheel"] 		 	 	= {["name"] = "swheel", 		["label"] = "Steering Wheel", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "swheel.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["shifter"] 		 	= {["name"] = "shifter", 		["label"] = "Shifter Leaver", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "shifter.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["plaque"] 		 	 	= {["name"] = "plaque", 		["label"] = "Plaque", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "plaque.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["speaker"] 		 	= {["name"] = "speaker", 		["label"] = "Speaker", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "speaker.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["trunk"] 		 	 	= {["name"] = "trunk", 			["label"] = "Trunk", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "trunk.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["hydraulic"] 		 	= {["name"] = "hydraulic", 		["label"] = "Hydraulic", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hydraulic.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["engineblock"] 		= {["name"] = "engineblock", 	["label"] = "Engine Block", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "engineblock.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["airfilter"] 		 	= {["name"] = "airfilter", 		["label"] = "Air Filter", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "airfilter.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["strut"] 		 	 	= {["name"] = "strut", 			["label"] = "Strut", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "strut.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["archcover"] 		 	= {["name"] = "archcover", 		["label"] = "Arch Cover", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "archcover.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["aerial"] 		 	 	= {["name"] = "aerial", 		["label"] = "Aerial", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "aerial.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["trimb"] 		 	 	= {["name"] = "trimb", 			["label"] = "Trim B", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "trimb.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["fueltank"] 		 	= {["name"] = "fueltank", 		["label"] = "Fuel Tank", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "fueltank.png", 							["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["window"] 		 	 	= {["name"] = "window", 		["label"] = "Window", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "window.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["livery"] 		 	 	= {["name"] = "livery", 		["label"] = "Livery", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "livery.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["horns"] 		 	 	= {["name"] = "horns", 			["label"] = "Horns", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "horns.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["neon"] 		 	 	= {["name"] = "neon", 			["label"] = "Neon", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "neon.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["xenon"] 		 	 	= {["name"] = "xenon", 			["label"] = "Xenon", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "xenon.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["wheel"] 		 	 	= {["name"] = "wheel", 			["label"] = "Wheels", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "wheel.png", 								["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["extra"] 		 	 	= {["name"] = "extra", 			["label"] = "Extra", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "extra.png", 					 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["windowtint"] 		 	= {["name"] = "windowtint", 	["label"] = "Window Tint", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "windowtint.png", 					 			 ["unique"] = true, 	 ["useable"] = true, 	 ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["tyresmoke"] 		 	= {["name"] = "tyresmoke", 		["label"] = "Tyre Smoke", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "tyresmoke.png", 					 			["unique"] = true, 	 ["useable"] = true, 	 ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
```