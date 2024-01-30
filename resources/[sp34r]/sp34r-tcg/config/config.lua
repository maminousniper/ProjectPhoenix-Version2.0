Config = {}

Config.getCurrentFramework = function()
    local qbState = GetResourceState('qb-core')
    local qbxState = GetResourceState('qbx-core')
    local esxState = GetResourceState('es_extended')

    if qbState == 'started' or qbxState == 'started' then
        return 'qbcore'
    elseif esxState == 'started' then
        return 'esx'
    else
        return 'none'
    end
end

Config.MaxCardsPerType = 10
Config.Framework = Config.getCurrentFramework()  -- 'esx' or 'qbcore'
Config.Database = 'oxmysql'  -- 'oxmysql' or 'mysql-async' or 'ghmattimysql' --remove

Config.Lang = {
    ['tcg'] = 'Trading Card Game',
    ['playerNotFound'] = 'No player found with that name or ID!',
    ['youdestroyedcard'] = 'You destroyed %s card.',
    ['yougavecard'] = 'You gave %s a card.',
    ['gaveyoucard'] = 'You received a card from',
    ['menugivecard'] = 'Give Card',
    ['menugivecarddesc'] = 'Select the player you want to give the card to.',
    ['noplayersnear'] = 'There are no players nearby'
}

RegisterNetEvent("dx_tcg:client:notify")
AddEventHandler("dx_tcg:client:notify", function(message)
    lib.notify({
        title = Config.Lang['tcg'],
        description = message,
        type = 'inform'
    })
end)
