-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.Elevators = {
    PillboxElevatorNorth = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(332.37, -595.56, 43.28), -- Coords, if you're new; last number is heading
            heading = 70.65, -- Heading of how will spawn on floor
            title = 'Floor 2', -- Title 
            description = 'Main Floor', -- Description
            target = { -- Target length/width
                width = 5,
                length = 4
            },
            groups = {-- Job locks
                'police',
                'ambulance'
            },
        },
        [2] = {
            coords = vec3(344.31, -586.12, 28.79), -- Coords, if you're new; last number is heading
            heading = 252.84,
            title = 'Floor 1',
            description = 'Lower Floor',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
    },
    MTZoonah = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-418.67, -344.67, 24.23), -- Coords, if you're new; last number is heading
            heading = 111.6, -- Heading of how will spawn on floor
            title = 'Garage Floor', -- Title 
            description = 'Ground Level', -- Description
            target = { -- Target length/width
                width = 5,
                length = 4
            },
        },
        [2] = {
            coords = vec3(-436.12, -360.49, 34.95), -- Coords, if you're new; last number is heading
            heading = 348.8,
            title = 'Reception Floor',
            description = 'Level 1',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
        [3] = {
            coords = vec3(-490.65, -326.67, 42.31), -- Coords, if you're new; last number is heading
            heading = 171.8,
            title = 'Top Floor',
            description = 'Level 2',
            target = {
            width = 5,
            length = 4
            } -- Example without group
        },
        [4] = {
            coords = vec3(-449.46, -334.77, 78.3), -- Coords, if you're new; last number is heading
            heading = 265.4,
            title = 'Roof Accese',
            description = 'Roof',
            target = {
            width = 5,
            length = 4,
            jobs = {-- Job locks
                "police",
                'ambulance'
                },
            },
        },
    },
}