return {
	--[[ {
		items = {
			{
				name = 'lockpick',
				ingredients = {
					scrapmetal = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 2,
			},
		},
		points = {
			vec3(-1147.083008, -2002.662109, 13.180260),
			vec3(-345.374969, -130.687088, 39.009613)
		},
		zones = {
			{
				coords = vec3(-1146.2, -2002.05, 13.2),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
			{
				coords = vec3(-346.1, -130.45, 39.0),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 70.0,
			},
		},
		blip = { id = 566, colour = 31, scale = 0.8 },
	}, ]]
	{
		label = "PARTS",
		items = {

			--consumables
			{
				name = 'lockpick', 
				ingredients = {
					aluminum = 5,
					plastic = 3,
					rubber = 3
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'advancedlockpick', 
				ingredients = {
					recyclablematerial = 50,
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'advancedrepairkit', 
				ingredients = {
					electronics = 15,
					aluminum = 15,
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'syphoningkit', 
				ingredients = {
					plastic = 40
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'cleaningkit', 
				ingredients = {
					plastic = 15
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'harness', 
				ingredients = {
					plastic = 15,
					rubber = 55,
				},
				duration = 5000,
				count = 1, 
			},
			--[[ {
				name = 'bodyrepairkit', 
				ingredients = {
					recyclablematerial = 5
				},
				duration = 5000,
				count = 1, 
			}, ]]


			--parts
			{
				name = 'agenericmechanicpart', 
				ingredients = {
					recyclablematerial = 5
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'bgenericmechanicpart', 
				ingredients = {
					recyclablematerial = 4  
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'cgenericmechanicpart', 
				ingredients = {
					recyclablematerial = 3 
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'dgenericmechanicpart', 
				ingredients = {
					recyclablematerial = 2 
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'sgenericmechanicpart', 
				ingredients = {
					recyclablematerial = 9 
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'mgenericmechanicpart', 
				ingredients = {
					recyclablematerial = 1 
				},
				duration = 5000,
				count = 1, 
			},



			--A PARTS
			{
				name = 'afixbrakes', 
				ingredients = {
					agenericmechanicpart = 2 
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'afixengine',
				ingredients = {
					agenericmechanicpart = 2
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'afixbody',
				ingredients = {
					agenericmechanicpart = 2
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'afixradiator',
				ingredients = {
					agenericmechanicpart = 2
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'afixaxle',
				ingredients = {
					agenericmechanicpart = 2
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'afixclutch',
				ingredients = {
					agenericmechanicpart = 2
				}, 
				duration = 5000,
				count = 1,
			},
			{
				name = 'afixinjector',
				ingredients = {
					agenericmechanicpart = 2
				},
				duration = 5000,
				count = 1,
			},
			--B PARTS
			{
				name = 'bfixbrakes', 
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'bfixengine',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'bfixbody',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'bfixradiator',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'bfixaxle',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'bfixclutch',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'bfixinjector',
				ingredients = {
					bgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			--C PARTS
			{
				name = 'cfixbrakes', 
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'cfixengine',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'cfixbody',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'cfixradiator',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'cfixaxle',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'cfixclutch',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'cfixinjector',
				ingredients = {
					cgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			--S PARTS
			{
				name = 'sfixbrakes', 
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'sfixengine',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'sfixbody',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'sfixradiator',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'sfixaxle',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'sfixclutch',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'sfixinjector',
				ingredients = {
					sgenericmechanicpart = 3
				},
				duration = 5000,
				count = 1,
			},
			--M PARTS
			{
				name = 'mfixbrakes', 
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1, 
			},
			{
				name = 'mfixengine',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'mfixbody',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'mfixradiator',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'mfixaxle',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'mfixclutch',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'mfixinjector',
				ingredients = {
					mgenericmechanicpart = 4
				},
				duration = 5000,
				count = 1,
			},
			
		},
		groups = {
			["mechanic"] = 0
		},
		points = {
			vec3(-1407.37, -447.4, 35.91),
		},
		zones = {
			{
				coords = vec3(-1407.37, -447.4, 35.91),
				size = vec3(3.8, 0.6, 0.15),
				distance = 1.5,
				rotation = 302.0,
			},
		},
		--blip = { id = 566, colour = 31, scale = 0.8 },
	},
} 

