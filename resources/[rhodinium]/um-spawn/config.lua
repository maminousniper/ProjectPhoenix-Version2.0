um = {}

um.debug = false

--  If you want the apartment start for new player, set it to true.
-- ?If you make it true, new user does not have an apartment, you force them to choose an apartment
-- ?generally recommended for qb-core and qb-apartments users
um.forceApartmentStart = true

um.lang = 'en' -- tr,en,es,zh,fr,hi [or add locales > .lua]

um.main = {
    camera = {
        radius = 2.0, -- Camera distance from the character
        angle = 50, -- Camera angle
        point = 0.1, -- Camera point
        turning = true, -- If you want to turn the camera, set it to true.
    },
    ped = {
        status = true, -- If you want to show the character in the spawn menu, set it to true.
        opacity = false, -- Todo: next update
    },
    property = {
        apartmentStatus = true, -- If you want to show the apartment system, set it to true.
        houseStatus = true, -- If you want to show the house system, set it to true.
    },
    bookmark = {
        status = true, -- If you want to show the bookmark system, set it to true.
        money = {
            free = false, -- If you want to bookmark the free money, set it to true.
            amount = math.random(1000, 10000) or 500
        }
    },
    map = true, -- If you want to show other locations [paleto etc], set it to true.
}

um.weather = {
    sync = false, -- If you want to sync the weather, set it to true.
    sc = 'qb', -- cd , qb
    type = 'EXTRASUNNY', -- https://docs.fivem.net/docs/game-references/weather-types/
    time = 12, -- 0 - 23
}

um.coords = {
    ['motel'] = {
        coords = vector4(313.23, -236.72, 53.99, 68.11),
        street = 'Meteor St',
        text = 'Motel St'
    },
    ['hospital'] = {
        coords = vector4(286.42, -602.82, 43.19, 128.92),
        street = 'Elgin Ave Del Perro Fwy',
        text = 'Hospital Ave'
    },
    ['police'] = {
        coords = vector4(400.46, -979.54, 29.39, 270.35),
        street = 'Sinner St Atlee St',
        text = 'Police Station'
    },
    ['sandy'] = {
        coords = vector4(1421.33, 3601.24, 34.85, 297.93),
        street = 'Algonquin Blvd',
        text = 'Sandy Shore'
    },
    ['paleto'] = {
        coords = vector4(-131.32, 6390.86, 31.5, 34.13),
        street = 'Paleto Blvd',
        text = 'Paleto Bay'
    }
}