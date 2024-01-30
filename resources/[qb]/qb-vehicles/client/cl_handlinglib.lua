QBCore = exports['qb-core']:GetCoreObject()

local currentVehicle = 0
local currentVehicleIdentifier = nil
local modifiedVehicles = {}

local driftMode = false
local driftIsToggle = true
local globalDriftState = false

local slipperySurfaceMaterial = {
  [9] = "ROCK",
  [10] = "ROCK_MOSSY",
  [11] = "STONE",
  [17] = "SANDSTONE_BRITTLE",
  [18] = "SAND_LOOSE",
  [19] = "SAND_COMPACT",
  [20] = "SAND_WET",
  [21] = "SAND_TRACK",
  [22] = "SAND_UNDERWATER",
  [23] = "SAND_DRY_DEEP",
  [24] = "SAND_WET_DEEP",
  [31] = "GRAVEL_SMALL",
  [32] = "GRAVEL_LARGE",
  [33] = "GRAVEL_DEEP",
  [34] = "GRAVEL_TRAIN_TRACK",
  [35] = "DIRT_TRACK",
  [36] = "MUD_HARD",
  [37] = "MUD_POTHOLE",
  [38] = "MUD_SOFT",
  [39] = "MUD_UNDERWATER",
  [40] = "MUD_DEEP",
  [41] = "MARSH",
  [42] = "MARSH_DEEP",
  [43] = "SOIL",
  [44] = "CLAY_HARD",
  [45] = "CLAY_SOFT",
  [46] = "GRASS_LONG",
  [47] = "GRASS",
  [48] = "GRASS_SHORT",
  [55] = "METAL_SOLID_SMALL",   -- Train Track
}

function getVehicleHandling(pVehicleIdentifier, pCurrentVehicleHandle, pHandling)
  if pVehicleIdentifier and pHandling then
    if modifiedVehicles[pVehicleIdentifier] ~= nil and modifiedVehicles[pVehicleIdentifier][pHandling] ~= nil then
      return true, modifiedVehicles[pVehicleIdentifier][pHandling]
    else
      return false, GetVehicleHandlingFloat(pCurrentVehicleHandle, "CHandlingData", pHandling)
    end
  end
end

function setVehicleHandling(pVehicleIdentifier, pCurrentVehicleHandle, pHandling, pFactor)
  local isModified, fValue = getVehicleHandling(pVehicleIdentifier, pCurrentVehicleHandle, pHandling)
  if not isModified then
    fValue = (fValue * pFactor)
  end
  modifiedVehicles[pVehicleIdentifier][pHandling] = fValue
  SetVehicleHandlingFloat(pCurrentVehicleHandle, "CHandlingData", pHandling, fValue)
end

function processVehicleHandling(pCurrentVehicle)
  local vehicleIdentifier = GetVehiclePedIsIn(PlayerPedId()) --TODO: This should call the server and grab the vehicle identifier.

  if not vehicleIdentifier then
    vehicleIdentifier = GetVehiclePlate(pCurrentVehicle)

    NetworkRegisterEntityAsNetworked(pCurrentVehicle)
    local netid = NetworkGetNetworkIdFromEntity(pCurrentVehicle)
    SetNetworkIdCanMigrate(pCurrentVehicle, true)
    SetNetworkIdExistsOnAllMachines(pCurrentVehicle, true)
  end

  if not vehicleIdentifier or vehicleIdentifier == "" then return end

  currentVehicleIdentifier = vehicleIdentifier
  SetVehiclePetrolTankHealth(pCurrentVehicle, 4000.0)
  SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fWeaponDamageMult", 5.500000)
  SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fDeformationDamageMult", 1.000000)

  local isModified, fSteeringLock = getVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fSteeringLock")
  if not isModified and not globalDriftState then
    fSteeringLock = math.ceil((fSteeringLock * 0.6)) + 0.1
  end

  if not modifiedVehicles[vehicleIdentifier] then
    modifiedVehicles[vehicleIdentifier] = {}
  end

  modifiedVehicles[vehicleIdentifier]["fSteeringLock"] = fSteeringLock
  SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fSteeringLock", fSteeringLock)

  if IsThisModelABike(GetEntityModel(pCurrentVehicle)) then
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fTractionCurveMin", 0.6)
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fTractionCurveMax", 0.6) 
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fInitialDriveForce", 2.2)
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fBrakeForce", 1.4)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fSuspensionReboundDamp", 5.000000)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fSuspensionCompDamp", 5.000000)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fSuspensionForce", 22.000000)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fCollisionDamageMult", 2.500000)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fEngineDamageMult", 0.120000)
  else
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fTractionCurveMin", 1.0)
    setVehicleHandling(vehicleIdentifier, pCurrentVehicle, "fBrakeForce", 0.5)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fEngineDamageMult", 0.250000)
    SetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fCollisionDamageMult", 2.900000)
  end

  modifiedVehicles[vehicleIdentifier].fInitialDriveMaxFlatVel = GetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
  modifiedVehicles[vehicleIdentifier].fTractionLossMult = GetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fTractionLossMult")
  modifiedVehicles[vehicleIdentifier].fLowSpeedTractionLossMult = GetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fLowSpeedTractionLossMult")
  modifiedVehicles[vehicleIdentifier].fDriveBiasFront = GetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fDriveBiasFront")
  modifiedVehicles[vehicleIdentifier].fDriveInertia = GetVehicleHandlingFloat(pCurrentVehicle, "CHandlingData", "fDriveInertia")

  -- print("fTractionLoss", modifiedVehicles[currentVehicleIdentifier].fTractionLossMult)
  -- print("fTractionCurveMin", modifiedVehicles[currentVehicleIdentifier].fTractionCurveMin)
  -- print("fLowSpeedTractionLossMult", modifiedVehicles[currentVehicleIdentifier].fLowSpeedTractionLossMult)

  SetVehicleHasBeenOwnedByPlayer(pCurrentVehicle, true)
end

function toggleOffroadState(pState)
  local vehClass = GetVehicleClass(currentVehicle)
  if currentVehicleIdentifier ~= nil and (vehClass ~= 9 and vehClass ~= 8) then
    local isAWD = (modifiedVehicles[currentVehicleIdentifier].fDriveBiasFront > 0 and modifiedVehicles[currentVehicleIdentifier].fDriveBiasFront < 1)
    local lowSpeedTractionFactor = isAWD and 1.5 or 1.5
    local tractionFactor = isAWD and 0.8 or 0.9

    -- print("fTractionLoss", modifiedVehicles[currentVehicleIdentifier].fTractionLossMult * (pState and 1.5 or 1.0))
    -- print("fTractionCurveMin", modifiedVehicles[currentVehicleIdentifier].fTractionCurveMin * (pState and tractionFactor or 1.0))
    -- print("fLowSpeedTractionLossMult", modifiedVehicles[currentVehicleIdentifier].fLowSpeedTractionLossMult * (pState and lowSpeedTractionFactor or 1.0))

    SetVehicleHandlingFloat(currentVehicle, "CHandlingData", "fTractionLossMult", modifiedVehicles[currentVehicleIdentifier].fTractionLossMult * (pState and 1.5 or 1.0))
    SetVehicleHandlingFloat(currentVehicle, "CHandlingData", "fTractionCurveMin",
      modifiedVehicles[currentVehicleIdentifier].fTractionCurveMin * (pState and tractionFactor or 1.0))
    SetVehicleHandlingFloat(currentVehicle, "CHandlingData", "fLowSpeedTractionLossMult",
      modifiedVehicles[currentVehicleIdentifier].fLowSpeedTractionLossMult * (pState and lowSpeedTractionFactor or 1.0))
  end
end


AddEventHandler("baseevents:enteredVehicle", function(pCurrentVehicle, currentSeat, vehicleDisplayName)
  currentVehicle = pCurrentVehicle
 
  SetPedConfigFlag(PlayerPedId(), 35, false)


  local vehicleClass = GetVehicleClass(pCurrentVehicle)
  if vehicleClass == 15 or vehicleClass == 16 then
    SetAudioSubmixEffectParamInt(0, 0, `enabled`, 1)
  end

  if currentSeat == -1 then
    processVehicleHandling(pCurrentVehicle)
  end
end)

AddEventHandler("baseevents:leftVehicle", function(pCurrentVehicle, pCurrentSeat, vehicleDisplayName)
  currentVehicle = 0
  offroadTicks = 0
  currentVehicleIdentifier = nil

  SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
  toggleOffroadState(false)
  if globalDriftState then
    ChangeDrift(not GetDriftTyresEnabled(pCurrentVehicle))
    globalDriftState = false
    SetVehicleHandlingFloat(pCurrentVehicle, 'CHandlingData', 'fSteeringLock', oldSteeringLock)
    SetVehicleHandlingField(pCurrentVehicle, 'CHandlingData', 'fSteeringLock', oldSteeringLock)
    processVehicleHandling(pCurrentVehicle)
    Citizen.InvokeNative(0xB59E4BD37AE292DB, pCurrentVehicle, 1.0)
    SetDriftTyresEnabled(pCurrentVehicle, false)
    SetReduceDriftVehicleSuspension(pCurrentVehicle, false)
    TriggerEvent('hud:client:UpdateDrift', false)
  end
end)

AddEventHandler("baseevents:vehicleChangedSeat", function(pCurrentVehicle, pCurrentSeat, previousSeat)
  if pCurrentSeat == -1 then
    processVehicleHandling(pCurrentVehicle)
  end
end)

Citizen.CreateThread(function()
  local currentMaterial = 0
  local isOffroad = false
  local offroadTicks = 0

  while true do
    Wait(500)

    if currentVehicle ~= 0 then
      local surfaceMaterialIndex = GetVehicleWheelSurfaceMaterial(currentVehicle, 1)
      local isSlippery = slipperySurfaceMaterial[surfaceMaterialIndex]

      if isSlippery and offroadTicks < 5 then
        offroadTicks = offroadTicks + 1
      elseif not isSlippery and offroadTicks >= 1 then
        offroadTicks = offroadTicks - 1
      end

      if isSlippery and not isOffroad and offroadTicks > 3 then
        isOffroad = true
        toggleOffroadState(true)
      elseif isOffroad and offroadTicks < 3 then
        isOffroad = false
        toggleOffroadState(false)
      end
    end
  end
end)

--DriftMode


local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
local gobber = GetVehicleHandlingFloat(playerVehicle, "CHandlingData", "fSteeringLock")
local oldSteeringLock = 0

function ChangeDrift(bool)
    local playerPed = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)
    if playerVehicle ~= 0 and IsVehicleOnAllWheels(playerVehicle) and GetPedInVehicleSeat(playerVehicle, -1) == playerPed then
        globalDriftState = bool
        print(bool)
        SetDriftTyresEnabled(playerVehicle, globalDriftState)
        SetReduceDriftVehicleSuspension(playerVehicle, globalDriftState)
        Citizen.Wait(1000)
        if globalDriftState then
          QBCore.Functions.Progressbar("enabledriftmode", "Switching on drift mode", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {}, {}, function()
          end, function()
            QBCore.Functions.Notify('Drift Mode Activated', 'success')
            SetVehicleHandlingFloat(playerVehicle, 'CHandlingData', 'fSteeringLock', 50.0)
            TriggerEvent('hud:client:UpdateDrift', true)
          end)
        else

          QBCore.Functions.Progressbar("disabledriftmode", "Switching off drift mode", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
          }, {}, {}, function()
          end, function()
            QBCore.Functions.Notify('Drift Mode De-Activated', 'info')
            local fSteeringLock = GetVehicleHandlingFloat(playerVehicle, 'CHandlingData', 'fSteeringLock')  
            SetVehicleHandlingFloat(playerVehicle, 'CHandlingData', 'fSteeringLock', oldSteeringLock)
            SetVehicleHandlingField(playerVehicle, 'CHandlingData', 'fSteeringLock', oldSteeringLock)
            processVehicleHandling(playerVehicle)
            Citizen.InvokeNative(0xB59E4BD37AE292DB, playerVehicle, 1.0)
            TriggerEvent('hud:client:UpdateDrift', false)
          end)
        end
    end
end

local notify = true
local LimiterActivate = false

local handbrake = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if globalDriftState then
            if IsControlPressed(0, 55) then 
                SetVehicleClutch(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
                handbrake = true
            else
                handbrake = false
            end
            SetVehicleTurboPressure(GetVehiclePedIsIn(PlayerPedId(), false), 1.0)
            vehSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 2.236936
            if LimiterActivate then
                Citizen.InvokeNative(0xB59E4BD37AE292DB, GetVehiclePedIsIn(PlayerPedId()), 1.0)
                if notify then
                  QBCore.Functions.Notify('Boost Limitier Activated', 'error')
                    PlaySoundFromEntity(-1, 'Beep_Red', PlayerPedId(), 'DLC_HEIST_HACKING_SNAKE_SOUNDS', true, 10)
                    Citizen.Wait(250)
                    PlaySoundFromEntity(-1, 'Beep_Red', PlayerPedId(), 'DLC_HEIST_HACKING_SNAKE_SOUNDS', true, 10)
                    Citizen.Wait(250)
                    PlaySoundFromEntity(-1, 'Beep_Red', PlayerPedId(), 'DLC_HEIST_HACKING_SNAKE_SOUNDS', true, 10)
                end
                notify = false 
            else
                Citizen.InvokeNative(0xB59E4BD37AE292DB, GetVehiclePedIsIn(PlayerPedId()), 2.5)
                notify = true
            end
            
        end 
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(250)
        if globalDriftState then
            local vehSpeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 2.236936
            if vehSpeed >= 100.0 then
                LimiterActivate = true
            else
                LimiterActivate = false
            end
        end
    end
end)

function driftModeChecker(bool)
  local playerPed = PlayerPedId()
  local playerVehicle = GetVehiclePedIsIn(playerPed, false)
  local plate = GetVehicleNumberPlateText(playerVehicle)

  if playerVehicle == nil then return end

  if globalDriftState then 
    ChangeDrift(not GetDriftTyresEnabled(playerVehicle))
    return
  end

  local result = RPC.execute("rho-drifting:server:checkVehicle", plate)
  if result then  
    ChangeDrift(not GetDriftTyresEnabled(playerVehicle))
  end
end

function isInDriftMode()
  return globalDriftState
end
exports('isInDriftMode', isInDriftMode)

if driftIsToggle then
    RegisterCommand("toggledrift", function()
      driftModeChecker()
    end)
    RegisterKeyMapping("toggledrift", "Toggle Drift", "keyboard", "Y")
end 


local InVehicle = false
local TurbulenceMin = 9.2
local TurbulenceMax = 19.2
local IsDriver = false

--Pilot shizz bro
RegisterNetEvent("qb-core/entered-vehicle", function()
  --print('entered vehicle')
  local Vehicle = GetVehiclePedIsIn(PlayerPedId())
  local props = QBCore.Functions.GetVehicleProperties(Vehicle)
  local Model = GetEntityModel(Vehicle)
  local netId = NetworkGetNetworkIdFromEntity(Vehicle)
  local pos = GetEntityCoords(Vehicle)
  local head = GetEntityHeading(Vehicle)
  local EngineOn = GetIsVehicleEngineRunning(Vehicle)

  -- License Check shit
  if not IsThisModelAPlane(Model) and not IsThisModelAHeli(Model) then return end
  InVehicle = true
  SetHeliTurbulenceScalar(Vehicle, 0.1)

  local HasLicense = QBCore.Functions.GetPlayerData().metadata["licences"].pilot
  if HasLicense then return end
 
  CreateThread(function()
      while InVehicle do
          local DriverPed = GetPedInVehicleSeat(Vehicle, -1)

          if DriverPed == PlayerPedId() then
              if IsThisModelAHeli(Model) then
                  local Height = GetEntityHeightAboveGround(Vehicle)
                  if Height >= 10.0 then
                      local Turbulence = TurbulenceMin + ((Height / 100) * 20.0)
                      if Turbulence < TurbulenceMin then Turbulence = TurbulenceMin end
                      if Turbulence > TurbulenceMax then Turbulence = TurbulenceMax end
                      SetHeliTurbulenceScalar(Vehicle, Turbulence)
                  end
              end

              if IsThisModelAPlane(Model) and GetIsVehicleEngineRunning(Vehicle) then
                  QBCore.Functions.Notify("How do I start this thing?", "error")
                  SetVehicleEngineOn(Vehicle, 0, 1, 1)
                  SetVehicleUndriveable(Vehicle, true)
              end
          end

          Wait(1000)
      end
      SetHeliTurbulenceScalar(Vehicle, 0.1)
  end)
end)