Config = Config or {}
Config.Props = {
    -- value should match an index from Config.Animations
    -- label is how the restaurant owner will see the animation option in laptop
    -- jobs is a table with the allowed jobs to use this prop/animation or false to make it available for everyone
    {value = "burger", label = "Burger", jobs = {"burgershot"}},
    {value = "soda", label = "Soda", jobs = false},
    {value = "sandwich", label = "Sandwich", jobs = {"burgershot", "uwucafe"}},
}

-- I use this tool to get the prop offsets: https://forum.cfx.re/t/paid-tool-prop-attach-to-ped-tool-dev-tool/4782266
Config.Animations = {
    ["burger"] = { -- same as Config.Props > value
        prop = "prop_cs_burger_01", -- prop name, must exist in your server
        dict = "mp_player_inteat@burger", -- animation dictionary
        animation = "mp_player_int_eat_burger", -- animation name
        time = 5000, -- animation duration
        bone = 18905, -- ped bone where the prop will be attached
        offset = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, -- prop offsets
        canWalk = true, -- Or false to freeze player while using the item
    },
    ["soda"] = { -- same as Config.Props > value
        prop = "prop_ecola_can", -- prop name, must exist in your server
        dict = "mp_player_intdrink", -- animation dictionary
        animation = "loop_bottle", -- animation name
        time = 5000, -- animation duration
        bone = 18905, -- ped bone where the prop will be attached
        offset = {0.11, -0.01, 0.03, 240.0, -30.0, -2.0}, -- prop offsets
        canWalk = false, -- Or false to freeze player while using the item
    },
    ["sandwich"] = { -- same as Config.Props > value
        prop = "prop_sandwich_01", -- prop name, must exist in your server
        dict = "mp_player_inteat@burger", -- animation dictionary
        animation = "mp_player_int_eat_burger", -- animation name
        time = 5000, -- animation duration
        bone = 18905, -- ped bone where the prop will be attached
        offset = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, -- prop offsets
        canWalk = true, -- Or false to freeze player while using the item
    },
}