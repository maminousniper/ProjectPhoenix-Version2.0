
local inCasino              = false
local videoWallRenderTarget = nil
local videoWallRenderTarget2 = nil
local showBigWin            = false
local inVRHeadset = false
local stopMainLobby = false
local spinningObject = nil
local spinningCar = nil

local tvDui = nil
local tvUri = "https://prod-gta.nopixel.net/dui/?type=video&src=https://i.imgur.com/bgn4RKc.mp4&encoding=mp4" --"https://i.imgur.com/cQ3KSpI.png"
--
-- Threads
--

function startCasinoThreads()
    RegisterNamedRendertarget('CasinoScreen_01')
    LinkNamedRendertarget(`vw_vwint01_video_overlay`)
    videoWallRenderTarget = GetNamedRendertargetRenderId('CasinoScreen_01')
    CreateThread(function() 
        local lastUpdatedTvChannel = 0
        while true do
            Wait(0)
            if not inCasino then
                ReleaseNamedRendertarget('CasinoScreen_01')
                videoWallRenderTarget = nil
                showBigWin            = false
                break
            end
            if videoWallRenderTarget then
                local currentTime = GetGameTimer()
                if showBigWin then
                    stopMainLobby = true
                    setVideoWallTvChannelWin()
                    lastUpdatedTvChannel = GetGameTimer() - 33666
                    showBigWin           = false
                else
                    if (currentTime - lastUpdatedTvChannel) >= 42666 then
                        setVideoWallTvChannel()
                        lastUpdatedTvChannel = currentTime
                        stopMainLobby = false
                    end
                end
                SetTextRenderId(videoWallRenderTarget)
                SetScriptGfxDrawOrder(4)
                SetScriptGfxDrawBehindPausemenu(true)
                DrawInteractiveSprite('Prop_Screen_Vinewood', 'BG_Wall_Colour_4x4', 0.25, 0.5, 0.5, 1.0, 0.0, 255, 255, 255, 255)
                DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            end
        end
    end)
end

function startCasinoThreads2()
  RegisterNamedRendertarget('CasinoScreen_02')
  LinkNamedRendertarget(`vw_vwint01_video_overlay`)
  videoWallRenderTarget2 = GetNamedRendertargetRenderId('CasinoScreen_02')
  CreateThread(function() 
      local lastUpdatedTvChannel2 = 0
      while true do
          Wait(0)
          if not inCasino then
              ReleaseNamedRendertarget('CasinoScreen_02')
              videoWallRenderTarget2 = nil
              break
          end
          if not stopMainLobby then
            if videoWallRenderTarget2 then
                local currentTime = GetGameTimer()
                if (currentTime - lastUpdatedTvChannel2) >= 42666 then
                    setVideoWallTvChannel()
                    lastUpdatedTvChannel2 = currentTime
                end
                SetTextRenderId(videoWallRenderTarget2)
                SetScriptGfxDrawOrder(4)
                SetScriptGfxDrawBehindPausemenu(true)
                DrawInteractiveSprite('Prop_Screen_Vinewood', 'BG_Wall_Colour_4x4', 0.25, 0.5, 0.5, 1.0, 0.0, 255, 255, 255, 255)
                DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            end
          end
      end
  end)
end

function setVideoWallTvChannel()
    SetTvChannelPlaylist(0, Config.AnimatedWallNormal, true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(0)
end

function setVideoWallTvChannelWin()
    SetTvChannelPlaylist(0, Config.AnimatedWallWin, true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(-1)
    SetTvChannel(0)
end

--
-- Events
--

AddEventHandler("chCasinoWall:enteredCasino", function()
  inCasino = true
  if Config.SetAnimatedWalls then
    startCasinoThreads()
    startCasinoThreads2()
    showThe6StrImage(true)
  end
  if Config.SetShowCarOnDisplay then
    print("Starting vehicle!")
    spinMeRightRoundBaby()
  end
  if Config.PlayCasinoAmbientNoise then
    playSomeBackgroundAudioBaby()      
  end
end)

AddEventHandler("chCasinoWall:exitedCasino", function()
  inCasino = false
end)

RegisterNetEvent('chCasinoWall:bigWin')
AddEventHandler('chCasinoWall:bigWin', function()
  if not inCasino then
    return
  end
  showBigWin = true
end)


function enterCasino()
  InCasino = true
  TriggerEvent("chCasinoWall:enteredCasino") 
  print("Entered Casino area")
  if Config.SendWelcomeMail then
    TriggerServerEvent('qb-phone:server:sendNewMail', {
      sender = Config.WelcomeMailsender,
      subject = Config.WelcomeMailsubject,
      message = Config.WelcomeMailmessage,
      button = {}
    })
  end
end

function exitCasino()
  TriggerEvent("chCasinoWall:exitedCasino")
  print("Exited Casino area")
  InCasino = false
  StopAudioScene("DLC_VW_Casino_General")
  Wait(5000)
  startCasinoThreads()
  showThe6StrImage(false)
end

CreateThread(function()
  local CasinoZone = CircleZone:Create(vector3(945.85, 41.58, -155.50), 250.0, {
    name="CasinoZone",
    heading=0.0,
    debugPoly=false,
    useZ=true,
  })
  CasinoZone:onPlayerInOut(function(inCasino)
    if inCasino then
      enterCasino()
    else
      exitCasino()
    end
  end)
end)

function spinMeRightRoundBaby()
  print("spin triggered")
	CreateThread(function()
	    while inCasino do
        DoesEntityExist(spinningObject)
        if not spinningObject or spinningObject == 0 or not DoesEntityExist(spinningObject) then
          spinningObject = GetClosestObjectOfType(976.432, 40.5611, 72.14, 10.0, -1561087446, 0, 0, 0)
          drawCarForWins()
        end
        if spinningObject ~= nil and spinningObject ~= 0 then
          local curHeading = GetEntityHeading(spinningObject)
          local curHeadingCar = GetEntityHeading(spinningCar)
          if curHeading >= 360 then
          curHeading = 0.0
          curHeadingCar = 0.0
          elseif curHeading ~= curHeadingCar then
          curHeadingCar = curHeading
          end
          SetEntityHeading(spinningObject, curHeading + 0.075)
          SetEntityHeading(spinningCar, curHeadingCar + 0.075)
        end
		    Wait(0)
	    end
	  spinningObject = nil
	end)
end

function drawCarForWins()
	if DoesEntityExist(spinningCar) then
	  DeleteEntity(spinningCar)
	end
	RequestModel(Config.VehicleOnDisplay)
	while not HasModelLoaded(Config.VehicleOnDisplay) do
		Wait(0)
	end
	SetModelAsNoLongerNeeded(Config.VehicleOnDisplay)
	spinningCar = CreateVehicle(Config.VehicleOnDisplay, 976.13, 40.17, 71.74, 0.0, 0, 0) 
	Wait(0)
	SetVehicleDirtLevel(spinningCar, 0.0)
	SetVehicleOnGroundProperly(spinningCar) 
	Wait(0)
	FreezeEntityPosition(spinningCar, 1) 
end

function playSomeBackgroundAudioBaby()
  Citizen.CreateThread(function()
    local function audioBanks()
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1) do
        Citizen.Wait(0)
      end
      while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1) do
        Citizen.Wait(0)
      end
      --[[ while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_INTERIOR_STEMS", false, -1) do
        print('load 5')
        Wait(0)
      end ]]
    end
    audioBanks()
    while inCasino do
      if inVRHeadset and IsStreamPlaying() then
        StopStream()
      end
      if inVRHeadset and IsAudioSceneActive("DLC_VW_Casino_General") then
        StopAudioScene("DLC_VW_Casino_General")
      end
      if not inVRHeadset and not IsStreamPlaying() and LoadStream("casino_walla", "DLC_VW_Casino_Interior_Sounds") then
        PlayStreamFromPosition(996.13,38.48,71.07)
      end
      if not inVRHeadset and IsStreamPlaying() and not IsAudioSceneActive("DLC_VW_Casino_General") then
        StartAudioScene("DLC_VW_Casino_General")
      end
      Citizen.Wait(1000)
    end
    if IsStreamPlaying() then
      StopStream()
    end
    if IsAudioSceneActive("DLC_VW_Casino_General") then
      StopAudioScene("DLC_VW_Casino_General")
    end
  end)
end


function showThe6StrImage(apply)
  if not apply then
    RemoveReplaceTexture('vw_prop_vw_cinema_tv_01', 'script_rt_tvscreen')
    exports["rho-lib"]:releaseDui(tvDui.id)
    tvDui = nil
    return
  end
  if tvDui == nil then
    tvDui = exports["rho-lib"]:getDui(tvUri, 512, 256) 
    AddReplaceTexture('vw_prop_vw_cinema_tv_01', 'script_rt_tvscreen', tvDui.dictionary, tvDui.texture)
  else
    exports["rho-lib"]:changeDuiUrl(tvDui.id, tvUri)
  end
end


CreateThread(function()
  local VipZone = CircleZone:Create(vector3(1000.55, 44.65, 71.06), 1.3, {
      name="fuckoff",
      heading=0.0,
      debugPoly=false,
      useZ=true,
  })
  VipZone:onPlayerInOut(function(isPointInside)
      if isPointInside then
          exports['qb-core']:DrawText('The Diamond Casino & Resort - V.I.P Zone')
      else
          exports["qb-core"]:HideText()
      end
  end)
end)