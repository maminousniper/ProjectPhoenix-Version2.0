CARRY_ITEMS = {
    ['drug_package'] = {
        animation = 'idle',
        dictionary = 'anim@heists@box_carry@',
        flag = 51,
        blockAttack = true,
        blockCar = true,
        blockRun = true,
        prop = {
            bone = 28422,
            model = joaat('prop_idol_case_01'),
            placement = {
                pos = vector3(0.01, -0.02, -0.22),
                rot = vector3(-165.0, 100.0, 125.0),
            },
        },
    },
    ['weedpackage'] = {
        animation = 'idle',
        dictionary = 'anim@heists@box_carry@',
        flag = 51,
        blockAttack = true,
        blockCar = true,
        blockRun = true,
        prop = {
            bone = 28422,
            model = joaat('hei_prop_heist_weed_block_01'),
            placement = {
                pos = vector3(0.01, -0.02, -0.22),
                rot = vector3(-165.0, 100.0, 125.0),
            },
        },
    },
    ['jerrycan'] = { 
        --animation = '',
        --dictionary = '',
        flag = 51,
        blockAttack = false,
        blockCar = true,
        blockRun = true,
        prop = {
            bone = 6286, 
            model = joaat('w_am_jerrycan'),
            placement = {
                pos = vector3(0.27, -0.02, -0.05), 
                rot = vector3(0.0, -80.0, 50.0),
            },
        },
    }
}


