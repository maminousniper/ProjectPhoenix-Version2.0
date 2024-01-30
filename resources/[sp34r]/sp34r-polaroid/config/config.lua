
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

Config.Framework = Config.getCurrentFramework()
Config.PrintingTime = 8000
Config.ShowTime = 5000
Config.ScreenShotBasicResourceName = 'screenshot-basic'
Config.aspectRatio = 0  --0 to 16:9 / 1 to 1:1   dont change if you dont know what you are doing
Config.UseOxInventory = GetResourceState('ox_inventory') == 'started'
Config.UseQsInventory = GetResourceState('qs-inventory') == 'started'

Config.ItemsName = {
    ['photo'] = 'photo',
    ['album'] = 'album',
    ['polaroid'] = 'polaroid',
    ['printerpolaroid'] = 'printerpolaroid'
}

Config.PolaroidProp = 'polaroid'

Config.Lang = {
    InVehicle = 'You can\'t use this in a vehicle!',
    YouPrintPhoto = 'You printed a photo!',
    YouDigitalizePhoto = 'You digitalized a photo!',
    YouInsertPhoto = 'You insert a photo in your album!',
    menus = {
        ShowToOthers = 'Show to others',
        descShowToOthers = 'Show your photo to the players around',
        insetPhotoAlbum = 'Insert photo in album',
        descInsetPhotoAlbum = 'Add your photo to your personal album',
    }
}

Config.ProgressbarPrinting = function()
    lib.progressBar({
        duration = Config.PrintingTime,
        label = 'Printing...',
        useWhileDead = false,
        canCancel = false,
    })
end

Config.NotificationFunction = function(msg)
    lib.notify({
        title = 'Polaroid',
        description = msg,
        type = 'inform'
    })
end