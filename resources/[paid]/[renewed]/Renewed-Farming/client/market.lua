local Config = require 'shared.Market'
local utils = require 'client.utils'

RegisterNetEvent('Renewed-Farming:client:openStore', function()
    local stashId = ('Farming_market_%s'):format(utils.getCharId())

    if exports.ox_inventory:openInventory('stash', stashId) == false then
        TriggerServerEvent('Renewed-Farming:server:createShopStash')
        exports.ox_inventory:openInventory('stash', stashId)
    end
end)

RegisterNetEvent('Renewed-Farming:client:sellItems', function()
    exports.ox_inventory:openInventory('shop', { type = 'Renewed_Farming_Market', id = 1 })
end)

CreateThread(function()
    if Config.ped then
        utils.addPed({
            model = Config.ped.model or `a_m_m_farmer_01`,
            dist = 300,
            coords = Config.ped.coords.xyz,
            heading = Config.ped.coords.w,
            scenario = Config.ped.scenario,
            freeze = true,
            invincible = true,
            tempevents = true,
            id = 'renewed-farming-market-ped',

            -- Normal ox Target stuff --
            target = {
                {
                    name = 'renewed-farming-market-ped',
                    icon = 'fas fa-shopping-basket',
                    label = locale('sell_items'),
                    event = 'Renewed-Farming:client:openStore',
                    distance = Config.ped.dist or 2.0,
                },
                {
                    name = 'renewed-farming-market-ped2',
                    icon = 'fas fa-shopping-basket',
                    label = locale('view_stock'),
                    event = 'Renewed-Farming:client:sellItems',
                    distance = Config.ped.dist or 2.0,
                },
            }
        })


        if Config.ped.blip then
            utils.addBlip({
                coords = Config.ped.coords.xyz,
                id = Config.ped.blip.id,
                scale = Config.ped.blip.scale,
                color = Config.ped.blip.color,
                name = Config.ped.blip.name,
            })
        end
    end
end)