QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

-----------------------
----   Variables   ----
-----------------------

local PlayerData = QBCore.Functions.GetPlayerData()
local CustomsData = {}

local changedVehicleData = {}
local isPlyInBennys = false
local originalMod = {}
local originalPrimaryColour = nil
local originalSecondaryColour = nil
local originalPearlescentColour = nil
local originalWheelColour = nil
local originalDashColour = nil
local originalInterColour = nil
local originalWheelCategory = nil
local originalWheel = nil
local originalWheelType = nil
local originalCustomWheels = nil
local originalNeonLightState = nil
local originalNeonLightSide = nil
local originalNeonColourR = nil
local originalNeonColourG = nil
local originalNeonColourB = nil
local originalXenonColour = nil
local originalOldLivery = nil
local originalPlateIndex = nil
local originalTurboActive = nil

local newMod = {}
local newPrimaryColour = nil
local newSecondaryColour = nil
local newPearlescentColour = nil
local newWheelColour = nil
local newDashColour = nil
local newInterColour = nil
local newWindowTint = nil
local newOriginalWindowTint = nil
local newWheelCategory = nil
local newWheel = nil
local newWheelType = nil
local newCustomWheels = nil
local oldCustomWheelState = nil
local newNeonLightState = {}
local newNeonColourR = nil
local newNeonColourG = nil
local newNeonColourB = nil
local newXenonColour = nil
local newOldLivery = nil
local newPlateIndex = nil

local attemptingPurchase = false
local isPurchaseSuccessful = false
local radialMenuItemId = nil

-----------------------
----   Functions   ----
-----------------------

--#[Local Functions]#--
function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(plyPed, false)
    local myCar = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
end

local function getReceipt()
    local plyPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(plyPed, false)
    local licensePlate = QBCore.Functions.GetPlate(veh)
    local myCar = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('qb-customs:server:getReceipt', changedVehicleData, veh, licensePlate)
end

local function CreateBlip(blipData)
    local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipDisplay(blip, blipData.display)
    SetBlipScale(blip, blipData.scale)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, blipData.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(blipData.label)
    EndTextCommandSetBlipName(blip)
end

local function AllowJob(restrictionData, job)
    if type(restrictionData.job) == "table" then
        for _,restrictedJob in ipairs(restrictionData.job) do
            if restrictedJob == job then return true end
        end
    else
        if restrictionData.job == "any" or restrictionData.job == job or not restrictionData.job then return true end
    end
    -- if Config.Debug then print('Denied for not having allowed job. ('..job..')') end
    return false
end

local function AllowGang(restrictionData, gang)
    if type(restrictionData.gang) == "table" then
        for _,restrictedGang in ipairs(restrictionData.gang) do
            if restrictedGang == gang then return true end
        end
    else
        if restrictionData.gang == "any" or restrictionData.gang == gang or not restrictionData.gang then return true end
    end
    -- if Config.Debug then print('Denied for not having allowed gang. ('..gang..')') end
    return false
end

local function AllowVehicleClass(restrictionData, vehicle)
    local vehicleClass = GetVehicleClass(vehicle)

    if restrictionData.deniedClasses then
        for _,class in ipairs(restrictionData.deniedClasses) do
            if vehicleClass == class then
                -- if Config.Debug then print('Denied for having denied vehicle class. ('..vehicleClass..')') end
                return false
            end
        end
    end

    if restrictionData.allowedClasses then
        for _,class in ipairs(restrictionData.allowedClasses) do
            if vehicleClass == class then return true end
        end
    end


    if (restrictionData.allowedClasses and restrictionData.allowedClasses[1] == nil) or not restrictionData.allowedClasses or vehicleClass == 0 then return true end
    -- if Config.Debug then print('Denied for not having allowed vehicle class. ('..vehicleClass..')') end
    return false
end

--#[Global Functions]#--
function AttemptPurchase(type, upgradeLevel)
    if upgradeLevel ~= nil then
        upgradeLevel = upgradeLevel + 2
    end
    TriggerServerEvent("qb-customs:server:attemptPurchase", type, upgradeLevel)

    attemptingPurchase = true

    while attemptingPurchase do
        Wait(1)
    end

    if not isPurchaseSuccessful then
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    return isPurchaseSuccessful
end

function RepairVehicle()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local getFuel = GetVehicleFuelLevel(plyVeh)

    SetVehicleFixed(plyVeh)
	SetVehicleDirtLevel(plyVeh, 0.0)
    SetVehiclePetrolTankHealth(plyVeh, 4000.0)
    SetVehicleFuelLevel(plyVeh, getFuel)

    for i = 0,5 do SetVehicleTyreFixed(plyVeh, i) end
end

function GetCurrentMod(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local mod = GetVehicleMod(plyVeh, id)
    local modName = GetLabelText(GetModTextLabel(plyVeh, id, mod))

    return mod, modName
end

function GetCurrentWheel()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local wheel = GetVehicleMod(plyVeh, 23)
    local wheelName = GetLabelText(GetModTextLabel(plyVeh, 23, wheel))
    local wheelType = GetVehicleWheelType(plyVeh)

    return wheel, wheelName, wheelType
end

function GetCurrentCustomWheelState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local state = GetVehicleModVariation(plyVeh, 23)

    return state and 1 or 0
end

function GetOriginalWheel()
    return originalWheel
end

function GetOriginalCustomWheel()
    return originalCustomWheels
end

function GetCurrentWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if GetVehicleWindowTint(plyVeh) == -1 then
        SetVehicleWindowTint(plyVeh, 0)
    end
    return GetVehicleWindowTint(plyVeh)
end

function GetCurrentVehicleWheelSmokeColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleTyreSmokeColor(plyVeh)

    return r, g, b
end

function GetCurrentNeonState(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleNeonLightEnabled(plyVeh, id)

    return isEnabled and 1 or 0
end

function GetCurrentNeonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleNeonLightsColour(plyVeh)

    return r, g, b
end

function GetCurrentXenonState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 22)

    return isEnabled and 1 or 0
end

function GetCurrentXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    return GetVehicleHeadlightsColour(plyVeh)
end

function GetCurrentTurboState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 18)

    return isEnabled and 0 or -1
end

function CheckValidMods(category, id, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local tempWheel = GetVehicleMod(plyVeh, 23)
    local tempWheelType = GetVehicleWheelType(plyVeh)
    local tempWheelCustom = GetVehicleModVariation(plyVeh, 23)
    local validMods = {}
    local amountValidMods = 0
    local hornNames = {}

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, wheelType)
    end

    if id == 14 then
        for k, _ in pairs(Config.vehicleCustomisation) do
            if Config.vehicleCustomisation[k].category == category then
                hornNames = Config.vehicleCustomisation[k].hornNames

                break
            end
        end
    end

    local modAmount = GetNumVehicleMods(plyVeh, id)
    for i = 1, modAmount do
        local label = GetModTextLabel(plyVeh, id, (i - 1))
        local modName = GetLabelText(label)

        if modName == "NULL" then
            if id == 14 then
                if i <= #hornNames then
                    modName = hornNames[i].name
                else
                    modName = "Horn " .. i
                end
            else
                modName = category .. " " .. i
            end
        end

        validMods[i] =
        {
            id = (i - 1),
            name = modName
        }

        amountValidMods = amountValidMods + 1
    end

    if modAmount > 0 then
        table.insert(validMods, 1, {
            id = -1,
            name = "Stock " .. category
        })
    end

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, tempWheelType)
        SetVehicleMod(plyVeh, 23, tempWheel, tempWheelCustom)
    end

    return validMods, amountValidMods
end

function RestoreOriginalMod()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalMod then
        for a,b in next, originalMod do
            SetVehicleMod(plyVeh, a, b)
        end
    end
    SetVehicleDoorsShut(plyVeh, true)

    originalMod = {}
end

function RestoreOriginalExtraNew()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleExtra(plyVeh, tonumber(newExtraItem), newExtraActive)
end

function RestoreOriginalColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalPrimaryColour and originalSecondaryColour then
        SetVehicleColours(plyVeh, originalPrimaryColour, originalSecondaryColour)
    end
    if originalPearlescentColour and originalWheelColour then
        SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
    end
    if originalDashColour then
        SetVehicleDashboardColour(plyVeh, originalDashColour)
    end
    if originalInterColour then
        SetVehicleInteriorColour(plyVeh, originalInterColour)
    end

    originalPrimaryColour = nil
    originalSecondaryColour = nil
    originalPearlescentColour = nil
    originalWheelColour = nil
    originalDashColour = nil
    originalInterColour = nil
end

function RestoreOriginalWheels()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalWheelType then
        SetVehicleWheelType(plyVeh, originalWheelType)
    end

    if originalWheelCategory then
        SetVehicleMod(plyVeh, originalWheelCategory, originalWheel, originalCustomWheels)

        if GetVehicleClass(plyVeh) == 8 then --Motorcycle
            SetVehicleMod(plyVeh, 24, originalWheel, originalCustomWheels)
        end

        originalWheelType = nil
        originalWheelCategory = nil
        originalWheel = nil
        originalCustomWheels = nil
    end
end

function RestoreOriginalNeonStates()
    local plyPed = PlayerPedId()
    print(originalNeonLightSide)
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalNeonLightSide and originalNeonLightState then
        SetVehicleNeonLightEnabled(plyVeh, originalNeonLightSide, originalNeonLightState)
    end

    originalNeonLightState = nil
    originalNeonLightSide = nil
end

function RestoreOriginalNeonColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalNeonColourR and originalNeonColourG and originalNeonColourB then
        SetVehicleNeonLightsColour(plyVeh, originalNeonColourR, originalNeonColourG, originalNeonColourB)
    end

    originalNeonColourR = nil
    originalNeonColourG = nil
    originalNeonColourB = nil
end

function RestoreOriginalXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalXenonColour then
        SetVehicleHeadlightsColour(plyVeh, originalXenonColour)
    end
    SetVehicleLights(plyVeh, 0)

    originalXenonColour = nil
end

function RestoreOldLivery()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalOldLivery then
        SetVehicleLivery(plyVeh, originalOldLivery)
    end
end

function RestorePlateIndex()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalPlateIndex then
        SetVehicleNumberPlateTextIndex(plyVeh, originalPlateIndex)
    end
end

function RestoreTurboStatus()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalTurboActive then
        if not IsToggleModOn(plyVeh, 18) then
            ToggleVehicleMod(plyVeh, 18, true)
        end
    else
        if IsToggleModOn(plyVeh, 18) then
            ToggleVehicleMod(plyVeh, 18, false)
        end
    end
end

function RestoreNewMod()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newMod then
        for a,b in next, newMod do
            SetVehicleMod(plyVeh, a, b)
        end
    end
    SetVehicleDoorsShut(plyVeh, true)

    newMod = {}
end

function RestoreNewWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleWindowTint(plyVeh, newWindowTint)

    newWindowTint = nil
end

function RestoreNewWindowTintOriginal()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleWindowTint(plyVeh, newOriginalWindowTint)

    newOriginalWindowTint = nil
end

function RestoreNewColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newPrimaryColour and newSecondaryColour then
        SetVehicleColours(plyVeh, newPrimaryColour, newSecondaryColour)
    end
    if newPearlescentColour and newWheelColour then
        SetVehicleExtraColours(plyVeh, newPearlescentColour, newWheelColour)
    end
    if newDashColour then
        SetVehicleDashboardColour(plyVeh, newDashColour)
    end
    if newInterColour then
        SetVehicleInteriorColour(plyVeh, newInterColour)
    end

    newPrimaryColour = nil
    newSecondaryColour = nil
    newPearlescentColour = nil
    newWheelColour = nil
    newDashColour = nil
    newInterColour = nil
end

function RestoreNewWheels()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newWheelType then
        SetVehicleWheelType(plyVeh, newWheelType)
    end

    if newWheelCategory then
        SetVehicleMod(plyVeh, newWheelCategory, newWheel, newCustomWheels)

        if GetVehicleClass(plyVeh) == 8 then --Motorcycle
            SetVehicleMod(plyVeh, 24, newWheel, newCustomWheels)
        end

        newWheelType = nil
        newWheelCategory = nil
        newWheel = nil
        newCustomWheels = nil
    end
end

function RestoreOriginalWheelsCustomNew()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if oldCustomWheelState then
        SetVehicleMod(plyVeh, 23, GetVehicleMod(plyVeh, 23), oldCustomWheelState)

        if GetVehicleClass(plyVeh) == 8 then --Motorcycle
            SetVehicleMod(plyVeh, 24, GetVehicleMod(plyVeh, 24), oldCustomWheelState)
        end

        oldCustomWheelState = nil
    end
end

function RestoreNewNeonStates()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newNeonLightState and next(newNeonLightState) then
        for a,b in next, newNeonLightState do
            print(a,b)
            SetVehicleNeonLightEnabled(plyVeh, a, b)
        end
    end

    newNeonLightState = {}
end

function RestoreNewNeonColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newNeonColourR and newNeonColourG and newNeonColourB then
        SetVehicleNeonLightsColour(plyVeh, newNeonColourR, newNeonColourG, newNeonColourB)
    end

    newNeonColourR = nil
    newNeonColourG = nil
    newNeonColourB = nil
end

function RestoreOldLiveryNew()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newOldLivery then
        SetVehicleLivery(plyVeh, newOldLivery)
    end
end

function RestoreNewXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newXenonColour then
        SetVehicleHeadlightsColour(plyVeh, newXenonColour)
    end
    SetVehicleLights(plyVeh, 0)

    newXenonColour = nil
end

function RestorePlateIndexNew()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if newPlateIndex then
        SetVehicleNumberPlateTextIndex(plyVeh, newPlateIndex)
    end
end

function PreviewMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if not originalMod[categoryID] then
        originalMod[categoryID] = GetVehicleMod(plyVeh, categoryID)
    end
    if not newMod[categoryID] then
        newMod[categoryID] = GetVehicleMod(plyVeh, categoryID)
    end
    if categoryID == 39 or categoryID == 40 or categoryID == 41 then
        SetVehicleDoorOpen(plyVeh, 4, false, true)
    elseif categoryID == 37 or categoryID == 38 then
        SetVehicleDoorOpen(plyVeh, 5, false, true)
    end

    SetVehicleMod(plyVeh, categoryID, modID)
end

function PreviewWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if not newOriginalWindowTint then
        newOriginalWindowTint = GetVehicleWindowTint(plyVeh)
    end
    if newWindowTint == nil then
        newWindowTint = GetVehicleWindowTint(plyVeh)
    end
    SetVehicleWindowTint(plyVeh, windowTintID)
end

function PreviewColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleModKit(plyVeh, 0)
    if not originalDashColour and not originalInterColour and not originalPrimaryColour and not originalSecondaryColour and not originalPearlescentColour and not originalWheelColour then
        originalPrimaryColour, originalSecondaryColour = GetVehicleColours(plyVeh)
        originalPearlescentColour, originalWheelColour = GetVehicleExtraColours(plyVeh)
        originalDashColour = GetVehicleDashboardColour(plyVeh)
        originalInterColour = GetVehicleInteriorColour(plyVeh)
    end
    if not newDashColour and not newInterColour and not newPrimaryColour and not newSecondaryColour and not newPearlescentColour and not newWheelColour then
        newPrimaryColour, newSecondaryColour = GetVehicleColours(plyVeh)
        newPearlescentColour, newWheelColour = GetVehicleExtraColours(plyVeh)
        newDashColour = GetVehicleDashboardColour(plyVeh)
        newInterColour = GetVehicleInteriorColour(plyVeh)
    end
    if paintType == 0 then --Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
        else
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, originalPrimaryColour, paintID)
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, originalWheelColour)
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, originalPearlescentColour, paintID)
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
    end
end

function PreviewWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    if not originalWheelCategory and not originalWheel and not originalWheelType and not originalCustomWheels then
        originalWheelCategory = categoryID
        originalWheelType = GetVehicleWheelType(plyVeh)
        originalWheel = GetVehicleMod(plyVeh, 23)
        originalCustomWheels = GetVehicleModVariation(plyVeh, 23)
    end

    if not newWheelCategory and not newWheel and not newWheelType and not newCustomWheels then
        newWheelCategory = categoryID
        newWheelType = GetVehicleWheelType(plyVeh)
        newWheel = GetVehicleMod(plyVeh, 23)
        newCustomWheels = GetVehicleModVariation(plyVeh, 23)
    end

    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end
end

function PreviewNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)


    if not newNeonLightState[side] then
        if IsVehicleNeonLightEnabled(plyVeh, side) then
            newNeonLightState[side] = 1
        else
            newNeonLightState[side] = 0
        end
    end

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function PreviewNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if not originalNeonColourR and not originalNeonColourG and not originalNeonColourB then
        originalNeonColourR, originalNeonColourG, originalNeonColourB = GetVehicleNeonLightsColour(plyVeh)
    end

    if not newNeonColourR and not newNeonColourG and not newNeonColourB then
        newNeonColourR, newNeonColourG, newNeonColourB = GetVehicleNeonLightsColour(plyVeh)
    end

    SetVehicleNeonLightsColour(plyVeh, r, g, b)
end

function PreviewXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if not originalXenonColour then
        originalXenonColour = GetVehicleHeadlightsColour(plyVeh)
    end

    SetVehicleLights(plyVeh, 2)
    SetVehicleHeadlightsColour(plyVeh, colour)
end

function PreviewOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if not originalOldLivery then
        originalOldLivery = GetVehicleLivery(plyVeh)
    end

    SetVehicleLivery(plyVeh, tonumber(liv))
end

function PreviewPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if not originalPlateIndex then
        originalPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    end

    if not newPlateIndex then
        newPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    end

    SetVehicleNumberPlateTextIndex(plyVeh, tonumber(index))
end

function ApplyMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local info = IsModeExist('mod', categoryID)
    
    
    if categoryID == 18 then
        if originalTurboActive == nil then
            if IsToggleModOn(plyVeh, 18) then
                originalTurboActive = true
            else
                originalTurboActive = false
            end
        end
        ToggleVehicleMod(plyVeh, categoryID, modID+1)
        if not info then
            changedVehicleData[#changedVehicleData + 1] = {
                type = 'turbo',
                categoryID = categoryID,
                modID = modID
            }
        else
            changedVehicleData[info] = {
                type = 'turbo',
                categoryID = categoryID,
                modID = modID
            }
        end
    elseif categoryID == 11 or categoryID == 12 or categoryID== 13 or categoryID == 15 or categoryID == 16 then --Performance Upgrades
        local type1 = 'engine'
        if categoryID == 12 then
            type1 = 'brakes'
        elseif categoryID == 13 then
            type1 = 'gear'
        elseif categoryID == 15 then
            type1 = 'suspension'
        elseif categoryID == 16 then
            type1 = 'armor'
        end
        if not info then
            changedVehicleData[#changedVehicleData + 1] = {
                type = type1,
                categoryID = categoryID,
                modID = modID
            }
        else
            changedVehicleData[info] = {
                type = type1,
                categoryID = categoryID,
                modID = modID
            }
        end
        SetVehicleMod(plyVeh, categoryID, modID)
    else
        if not info then
            changedVehicleData[#changedVehicleData + 1] = {
                type = 'mod',
                categoryID = categoryID,
                modID = modID
            }
        else
            changedVehicleData[info] = {
                type = 'mod',
                categoryID = categoryID,
                modID = modID
            }
        end
        SetVehicleMod(plyVeh, categoryID, modID)
    end
    newMod[categoryID] = GetVehicleMod(plyVeh, categoryID)
end

function ApplyExtra(extraID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleExtraTurnedOn(plyVeh, extraID)
    local info = IsModeExist('extra', extraID)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'extra',
            categoryID = extraID,
            modID = isEnabled
        }
    else
        changedVehicleData[info] = {
            type = 'extra',
            categoryID = extraID,
            modID = isEnabled
        }
    end
    newExtraItem = tonumber(extraID)
    newExtraActive = 1
    if isEnabled == 1 then
        newExtraActive = 0
    end
    if isEnabled == 1 then
        SetVehicleExtra(plyVeh, tonumber(extraID), 1)
        newExtraItem = tonumber(extraID)
        newExtraActive = tonumber(extraID)
    --     SetVehiclePetrolTankHealth(plyVeh,4000.0)
    else
        SetVehicleExtra(plyVeh, tonumber(extraID), 0)
    --     SetVehiclePetrolTankHealth(plyVeh,4000.0)
    end
end

function ApplyWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local info = IsModeExist('window', windowTintID)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'windowtint',
            categoryID = windowTintID,
        }
    else
        changedVehicleData[info] = {
            type = 'windowtint',
            categoryID = windowTintID,
        }
    end
    SetVehicleWindowTint(plyVeh, windowTintID)
    newWindowTint = windowTintID
end

function ApplyColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(plyVeh)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(plyVeh)

    local info = IsModeExist('color', paintType, paintCategory)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'color',
            categoryID = paintCategory,
            colorType = paintType,
            colorID = paintID,
            other = originalPearlescentColour
        }
    else
        changedVehicleData[info] = {
            type = 'color',
            categoryID = paintCategory,
            colorType = paintType,
            colorID = paintID,
            other = originalPearlescentColour
        }
    end
    if paintType == 0 then -- Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, vehWheelColour)
        else
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, vehPrimaryColour, paintID)
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, vehWheelColour)
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, vehPearlescentColour, paintID)
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
    end

    newPrimaryColour, newSecondaryColour = GetVehicleColours(plyVeh)
    newPearlescentColour, newWheelColour = GetVehicleExtraColours(plyVeh)
    newDashColour = GetVehicleDashboardColour(plyVeh)
    newInterColour = GetVehicleInteriorColour(plyVeh)
end

function ApplyWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    local info = IsModeExist('wheel', categoryID)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'wheel',
            categoryID = categoryID,
            wheelID = wheelID,
            wheelType = wheelType,
            allData = {
                doesHaveCustomWheels = doesHaveCustomWheels
            }
        }
    else
        changedVehicleData[info] = {
            type = 'wheel',
            categoryID = categoryID,
            wheelID = wheelID,
            wheelType = wheelType,
            allData = {
                doesHaveCustomWheels = doesHaveCustomWheels
            }
        }
    end
    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end

    newWheelCategory = categoryID
    newWheelType = GetVehicleWheelType(plyVeh)
    newWheel = GetVehicleMod(plyVeh, 23)
    newCustomWheels = GetVehicleModVariation(plyVeh, 23)
end

function ApplyCustomWheel(state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if changedVehicleData then
        if #changedVehicleData > 0 then
            for a,b in next, changedVehicleData do
                if b.type == 'wheel' then
                    b.allData.doesHaveCustomWheels = state
                end
            end
        end
    end
    -- local info = IsModeExist('Cwheel', state)
    -- if not info then
    --     changedVehicleData[#changedVehicleData + 1] = {
    --         type = 'Cwheel',
    --         categoryID = state,
    --         allData = {
    --             isMotorcycle = (GetVehicleClass(plyVeh) == 8),
    --         }
    --     }
    -- else
    --     changedVehicleData[info] = {
    --         type = 'Cwheel',
    --         categoryID = state,
    --         allData = {
    --             isMotorcycle = (GetVehicleClass(plyVeh) == 8),
    --         }
    --     }
    -- end
    oldCustomWheelState = GetVehicleModVariation(plyVeh, 23)
    SetVehicleMod(plyVeh, 23, GetVehicleMod(plyVeh, 23), state)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, GetVehicleMod(plyVeh, 24), state)
    end
end

function ApplyNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    local info = IsModeExist('neon', side)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'neon',
            categoryID = side,
            neonID = enabled,
        }
    else
        changedVehicleData[info] = {
            type = 'neon',
            categoryID = side,
            neonID = enabled,
        }
    end

    -- newNeonLightState[side] = enabled

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function ApplyNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    local info = IsModeExist('neonColor')
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'neonColor',
            r = r,
            g = g,
            b = b
        }
    else
        changedVehicleData[info] = {
            type = 'neonColor',
            r = r,
            g = g,
            b = b
        }
    end

    SetVehicleNeonLightsColour(plyVeh, r, g, b)

    newNeonColourR, newNeonColourG, newNeonColourB = GetVehicleNeonLightsColour(plyVeh)
end

function ApplyXenonLights(category, state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    
    local info = IsModeExist('xenon', category)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'xenon',
            categoryID = category,
            state = state
        }
    else
        changedVehicleData[info] = {
            type = 'xenon',
            categoryID = category,
            state = state
        }
    end
    ToggleVehicleMod(plyVeh, category, state)
end

function ApplyXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    local info = IsModeExist('xenonColor', colour)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'xenonColor',
            color = colour
        }
    else
        changedVehicleData[info] = {
            type = 'xenonColor',
            color = colour
        }
    end


    SetVehicleHeadlightsColour(plyVeh, colour)

    newXenonColour = GetVehicleHeadlightsColour(plyVeh)
end

function ApplyOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    local info = IsModeExist('livery', liv)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'livery',
            livery = liv
        }
    else
        changedVehicleData[info] = {
            type = 'livery',
            livery = liv
        }
    end

    SetVehicleLivery(plyVeh, liv)

    newOldLivery = GetVehicleLivery(plyVeh)
end

function ApplyPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    newPlateIndex = index

    local info = IsModeExist('plate', index)
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'plate',
            plate = index
        }
    else
        changedVehicleData[info] = {
            type = 'plate',
            plate = index
        }
    end

    SetVehicleNumberPlateTextIndex(plyVeh, index)
end

function ApplyTyreSmoke(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    local info = IsModeExist('tyreSmoke')
    if not info then
        changedVehicleData[#changedVehicleData + 1] = {
            type = 'tyreSmoke',
            r = r,
            g = g,
            b = b
        }
    else
        changedVehicleData[info] = {
            type = 'tyreSmoke',
            r = r,
            g = g,
            b = b
        }
    end

    -- ToggleVehicleMod(plyVeh, 20, true)
    -- SetVehicleTyreSmokeColor(plyVeh, r, g, b)
end

function IsModeExist(modType, modCategory, color)
    local exist = false
    for i, mod in next, changedVehicleData do
        if mod.type == modType then
            if modType == 'mod' then
                if mod.categoryID == modCategory then
                    return i
                end
            elseif modType == 'color' then
                if mod.colorType == modCategory then
                    return i
                end
            elseif modType == 'neon' then
                if mod.categoryID == modCategory then
                    return i
                end
            else
                return i
            end
        end
    end
    return false
end

function ExitBennys()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    getReceipt()

    DisplayMenuContainer(false)
    FreezeEntityPosition(plyVeh, false)
    SetEntityCollision(plyVeh, true, true)

    SetTimeout(100, function()
        DestroyMenus()
    end)

    if next(CustomsData) then
        SetupInteraction()
    end

    isPlyInBennys = false
end


function EnterLocation(override)
    changedVehicleData = {}
    local locationData = Config.Locations[CustomsData.location]
    local categories = (override and override.categories) or {
        repair = false,
        mods = false,
        armor = false,
        respray = false,
        liveries = false,
        wheels = false,
        tint = false,
        plate = false,
        extras = false,
        neons = false,
        xenons = false,
        horn = false,
        turbo = false,
        cosmetics = false,
    }

    local canEnter = false
    local repairOnly = true
    if next(CustomsData) then
        for k,v in pairs(locationData.categories) do
            if not canEnter and v then
                if k ~= "repair" then repairOnly = false end
                canEnter = true
            end
            categories[k] = v
        end
    elseif override then canEnter = true end

    -- if Config.Debug then
    --     print('***************************************************************************')
    --     print(string.format('EnterLocation Debug Start | CanEnter: %s | Repair Only: %s | Override: %s', canEnter, repairOnly, json.encode(override)))
    --     print('***************************************************************************')
    --     if next(locationData) then for k,v in pairs(locationData) do print(k, json.encode(v)) end end
    --     for k,v in pairs(categories) do print(k,v) end
    --     print('***************************************************************************')
    --     print('EnterLocation Debug End')
    --     print('***************************************************************************')
    -- end

    if not canEnter then
        QBCore.Functions.Notify(Config.Text.errors.bennysError)
        ExitBennys()
        return
    end

    if Config.UseRadial then
        exports[Config.RadialMenuFolder]:RemoveOption(radialMenuItemId)
        radialMenuItemId = nil
    end

    exports[Config.QBCoreFolderName]:HideText()

    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isMotorcycle

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        isMotorcycle = true
    else
        isMotorcycle = false
    end

    SetVehicleModKit(plyVeh, 0)
    SetEntityCoords(plyVeh, ((override and override.coords) or CustomsData.coords))
    SetEntityHeading(plyVeh, ((override and override.heading) or CustomsData.heading))
    FreezeEntityPosition(plyVeh, true)
    SetEntityCollision(plyVeh, false, true)
    local enableMenu = true
    if GetVehicleBodyHealth(plyVeh) < 1000.0 then
        enableMenu = false
    end
    if enableMenu then
        local welcomeLabel = (locationData and locationData.settings.welcomeLabel) or "Welcome to Benny's Motorworks!"
        InitiateMenus(isMotorcycle, GetVehicleBodyHealth(plyVeh), categories, welcomeLabel)
    end

    if enableMenu then
        SetTimeout(100, function()
            if GetVehicleBodyHealth(plyVeh) < 1000.0 and categories.repair then
                -- DisplayMenu(true, "repairMenu")
                QBCore.Functions.Notify(Config.Text.errors.dmgveh, 'error')
            else
                DisplayMenu(true, "mainMenu")
            end

            DisplayMenuContainer(true)
            PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        end)
    
        isPlyInBennys = true
        DisableControls(repairOnly)
    else
        ExitBennys()
        QBCore.Functions.Notify(Config.Text.errors.dmgveh, 'error')
    end
end


function DisableControls(repairOnly)
    CreateThread(function()
        while isPlyInBennys do
            DisableControlAction(1, 38, true) --Key: E
            DisableControlAction(1, 172, true) --Key: Up Arrow
            DisableControlAction(1, 173, true) --Key: Down Arrow
            DisableControlAction(1, 177, true) --Key: Backspace
            DisableControlAction(1, 176, true) --Key: Enter
            DisableControlAction(1, 71, true) --Key: W (veh_accelerate)
            DisableControlAction(1, 72, true) --Key: S (veh_brake)
            DisableControlAction(1, 34, true) --Key: A
            DisableControlAction(1, 35, true) --Key: D
            DisableControlAction(1, 75, true) --Key: F (veh_exit)

            if IsDisabledControlJustReleased(1, 172) then --Key: Arrow Up
                MenuScrollFunctionality("up")
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            end

            if IsDisabledControlJustReleased(1, 173) then --Key: Arrow Down
                MenuScrollFunctionality("down")
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            end

            if IsDisabledControlJustReleased(1, 176) then --Key: Enter
                MenuManager(true, repairOnly)
                PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            end

            if IsDisabledControlJustReleased(1, 177) then --Key: Backspace
                MenuManager(false)
                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            end

            Wait(0)
        end
    end)
end

function GetLocations()
    QBCore.Functions.TriggerCallback("qb-customs:server:GetLocations", function(locations)
        Config.Locations = locations
    end)
end

function CheckForKeypress()
    if next(CustomsData) then
        CreateThread(function()
            while next(CustomsData) and not isPlyInBennys do
                if IsControlJustReleased(0, 38) and CheckRestrictions(CustomsData.location) then EnterLocation() return end
                Wait(0)
            end
        end)
    end
end

-- If a player isnt in a vehicle, when they enter the zone, the closet vehicle is checked
-- The vehicle is checked if it has collision disabled and nobody in the driver seat
-- If so it will set the collision to true and unfreeze the entity =D
function CheckForGhostVehicle()
    if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then return end
    local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
    if closestVehicle ~= -1 and closestDistance < 10.0 and GetEntityCollisionDisabled(closestVehicle) and GetPedInVehicleSeat(closestVehicle, -1) == 0 then
        FreezeEntityPosition(closestVehicle, false)
        SetEntityCollision(closestVehicle, true, true)
    end
end

function CheckRestrictions(location)
    local PlayerPed = PlayerPedId()
    local _location = Config.Locations[location]
    local restrictions = _location.restrictions

    -- if Config.Debug then
    --     print('***************************************************************************')
    --     print('Restriction Debug')
    --     print('***************************************************************************')
    -- end

    local isEnabled = _location.settings.enabled
    local vehicle = GetVehiclePedIsIn(PlayerPed, false)
    -- local allowedJob = AllowJob(restrictions, PlayerData.job.name)
    local allowedGang = AllowGang(restrictions, PlayerData.gang.name)
    local allowedClass = AllowVehicleClass(restrictions, GetVehiclePedIsIn(PlayerPed, false))

    -- if Config.Debug then
    --     print(string.format('Is Enabled: %s\nVehicle: %s\nallowedJob: %s\nallowedGang: %s\nallowedClass: %s', isEnabled, vehicle, allowedJob, allowedGang, allowedClass))
    --     print('***************************************************************************')
    -- end
    return isEnabled and vehicle ~= 0 and allowedGang and allowedClass
end

function SetupInteraction()
    local text = CustomsData.drawtextui
    if Config.UseRadial then
        if not radialMenuItemId then
            radialMenuItemId = exports[Config.RadialMenuFolder]:AddOption({
                id = 'customs',
                title = 'Enter Customs',
                icon = 'wrench',
                type = 'client',
                event = 'qb-customs:client:EnterCustoms',
                shouldClose = true
            })
        end
    else
        text = '[E] '..text
        CheckForKeypress()
    end
    exports[Config.QBCoreFolderName]:DrawText(text, 'left')
end

exports('GetCustomsData', function() if next(CustomsData) ~= nil then return CustomsData else return nil end end)
-----------------------
----   Threads     ----
-----------------------

-- Location Creation
CreateThread(function()
    while not PlayerData.job do Wait(2500) end
    for location, data in pairs(Config.Locations) do
        if data.craft then
            if Config.Target == 'qb' then
                exports[Config.TargetFolderName]:AddBoxZone(location .. '-customs', data.craft.xyz, 1.5, 1.5, {
                    name = location .. '-customs',
                    debugPoly = false,
                    heading = data.craft.w,
                    minZ = data.craft.z - 1,
                    maxZ = data.craft.z + 1,
                }, {
                    options = {
                        {
                            event = "rho-mechanic:openCrafting",
                            icon = 'fas fa-toolbox',
                            label = 'Open Craft',
                            job = data.job,
                        },
                    },
                    distance = 2.0,
                })
            elseif Config.Target == 'ox' then
                exports[Config.TargetFolderName]:addBoxZone({
                    coords = data.craft.xyz,
                    size = vector3(1, 1, 1),
                    rotation = 180, 
                    debugPoly = false,
                    drawSprite = true,
                    options = {
                        {
                            event = "rho-mechanic:openCrafting",
                            icon = 'fas fa-toolbox',
                            label = 'Open Craft',
                            canInteract = function()
                                return QBCore.Functions.GetPlayerData().job.name == data.job
                            end,
                        },
                    },
                })
            end
        end
        -- PolyZone + Drawtext + Locations Management
        for i, spot in ipairs(data.zones) do
            local _name = location.."-customs-"..i
            local newSpot = BoxZone:Create(spot.coords, spot.length, spot.width, {
                name = _name,
                -- debugPoly = true,
                heading = spot.heading,
                minZ = spot.minZ,
                maxZ = spot.maxZ,
            })

            newSpot:onPlayerInOut(function(isPointInside, _)
                if isPointInside then
                    CustomsData = {
                        ['location'] = location,
                        ['spot'] = _name,
                        ['coords'] = vector3(spot.coords.x, spot.coords.y, spot.coords.z),
                        ['heading'] = spot.heading,
                        ['drawtextui'] = data.drawtextui.text,
                    }
                    SetupInteraction()
                    CheckForGhostVehicle()
                elseif CustomsData['location'] == location and CustomsData['spot'] == _name then
                    CustomsData = {}
                    if Config.UseRadial then
                        exports[Config.RadialMenuFolder]:RemoveOption(radialMenuItemId)
                        radialMenuItemId = nil
                    end

                    exports[Config.QBCoreFolderName]:HideText()
                end
            end)
        end

        -- Blips
        local blipData = data.blip
        if blipData and blipData.enabled then CreateBlip(blipData) end
    end
end)

-----------------------
---- Client Events ----
-----------------------

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() and QBCore.Functions.GetPlayerData() ~= {} then
        GetLocations()
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() and isPlyInBennys then
        ExitBennys()
    end
end)

RegisterNetEvent(Config.EventPrefix .. ':Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    GetLocations()
end)

RegisterNetEvent(Config.EventPrefix .. ':Client:OnGangUpdate', function(gang)
    PlayerData.gang = gang
end)

RegisterNetEvent(Config.EventPrefix .. ':Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('qb-customs:client:UpdateLocation', function(location, type, key, value)
    Config.Locations[location][type][key] = value
end)

RegisterNetEvent("qb-customs:client:purchaseSuccessful", function()
    isPurchaseSuccessful = true
    attemptingPurchase = false
end)

RegisterNetEvent('qb-customs:client:EnterCustoms', function()
    EnterLocation()
end)
