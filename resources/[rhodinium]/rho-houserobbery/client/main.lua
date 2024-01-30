local QBCore = exports[Config.CoreName]:GetCoreObject()
local closesthouseid, closestHouse
local insideHouse = false
local robbedHouseCoords = nil
local enteredHouseId = nil
local robbing = false


local exitZone = false
local robZone = false

local coordsx, coordsy, coordsz
local coord = false
local isRendered = false
local pedSpawned = nil
local started = false
local receivedCoords = nil
local inHouseZone = false

local oxTargetIds = {}


RegisterNetEvent('qb-houserobbery:client:openDoor', function()
	local PlayerPos = GetEntityCoords(PlayerPedId())
	local random = math.random(1, 100)
	
		if closesthouseid then
			if QBCore.Functions.HasItem(Config.LockpickItem) then
				local dist = #(PlayerPos - vector3(closestHouse.x, closestHouse.y, closestHouse.z))
				if dist <= 1.5 then
					FreezeEntityPosition(PlayerPedId(), true)
					LoadAnim('veh@break_in@0h@p_m_one@')
					TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
					exports['ps-ui']:Circle(function(success)
						if success then
							robbing = true
							TriggerServerEvent("qb-houserobbery:server:enterHouse", closesthouseid)
							enteredHouseId = closesthouseid
							robbedHouseCoords = closestHouse
							ClearPedTasksImmediately(PlayerPedId())
							FreezeEntityPosition(PlayerPedId(), false)
							RemoveBlip(DestBlip)
							started = false

							if random > Config.DestroyAdvancedLockpickSuccess then
								TriggerServerEvent("qb-houserobbery:server:breakLockpick", Config.LockpickItem)
							end

							if random > Config.RandomChanceToCallCops then
								AlertCops()
							end
						else
							ClearPedTasksImmediately(PlayerPedId())
							FreezeEntityPosition(PlayerPedId(), false)
							if random > Config.DestroyAdvancedLockpickFail then
								AlertCops()
								TriggerServerEvent("qb-houserobbery:server:breakLockpick", Config.LockpickItem)
							elseif random <= Config.DestroyAdvancedLockpickFail then
								QBCore.Functions.Notify(Config.Lang['failed'], 'error')
							end
						end
					end, Config.LockpickClickAmount, Config.LockpickMinigameTime) -- NumberOfCircles, MS
				end
			end
		end
end)

CreateThread(function()
	local houseZones = {}
    for _, v in pairs(Config.Houses) do
        houseZones[#houseZones+1] = BoxZone:Create(
            vector3(v.x, v.y, v.z), 1.5, 1.5, {
            name="box_zone",
            debugPoly = false,
            minZ = v.z - 1,
            maxZ = v.z + 1,
        })
    end

	local houseCombo = ComboZone:Create(houseZones, {name = "houseCombo", debugPoly = false})
    houseCombo:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
			for k, v in pairs(Config.Houses) do
				if #(point - vector3(v.x, v.y, v.z)) < 4 then
					if Config.Houses[k].Opened then
						inHouseZone = true
						EnterThread(k, v)
						exports[Config.CoreName]:DrawText(Config.Lang['enter'], 'left')
					end
				end
			end
		else
			exports[Config.CoreName]:HideText()
			inHouseZone = false
        end
    end)
end)

function EnterThread(k, v)
	CreateThread(function()
		while inHouseZone do
			if Config.Houses[k].Opened then
				if IsControlJustPressed(0, Config.HouseKey) then
					enteredHouseId = k
					closestHouse = v
					robbedHouseCoords = v
					enter()
				end
			end
			Wait(5)
		end
	end)
end

function enterHouseThread()
	CreateThread(function()
		
		for i = 1, #Config.Houses[enteredHouseId].Items do
			local entityCoords = GetEntityCoords(Config.Houses[enteredHouseId].Items[i].objects)
			

			if not Config.Ox_Target then

				exports['qb-target']:AddBoxZone("loot" .. i, vector3(entityCoords.x, entityCoords.y, entityCoords.z), 1, 1, {
					name = "loot" .. i,
					debugPoly = Config.Debug,
					minZ = entityCoords.z - 0.99,
					maxZ = entityCoords.z + 1.99,
				}, {
					options = {
					{
						icon = "fas fa-user-secret",
						label = Config.Lang['target'],
						action = function()
							if not GetPropStatus() then
									
								if Config.Houses[enteredHouseId].Items[i].anim == 'safe' then
									TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, false)
									local res = createSafe({math.random(0,99),math.random(0,99),math.random(0,99)})
										if res then
											TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, Config.Houses[enteredHouseId].Items[i].delete)
											TriggerEvent('qb-houserobbery:anim', Config.Houses[enteredHouseId].Items[i].anim, Config.Houses[enteredHouseId].Items[i].delete, i)
										else
											QBCore.Functions.Notify(Config.Lang['failed'], "error")
											TriggerServerEvent("qb-houserobbery:server:updateInteriorSafeFailed", enteredHouseId, i, false)
										end
										
								else
									TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, Config.Houses[enteredHouseId].Items[i].delete)
									TriggerEvent('qb-houserobbery:anim', Config.Houses[enteredHouseId].Items[i].anim, Config.Houses[enteredHouseId].Items[i].delete, i)
								end
			
							else
								QBCore.Functions.Notify(Config.Lang['carrying'], 'error')
							end
							
						
						end,
						canInteract = function() 
							if Config.Houses[enteredHouseId].Items[i].robbed then return false end 
							return true
						end,
					},
					},
					distance = 1.5
				})

			else

				oxTargetIds[i] = exports.ox_target:addBoxZone({
					coords = vec3(entityCoords.x, entityCoords.y, entityCoords.z),
					size = vec3(1.15, 1.15, 3),
					rotation = 90,
					debug = Config.Debug,
					options = {
						{
							name = 'box',
							icon = 'fa-solid fa-user-secret',
							label = Config.Lang['target'],
							distance = 1.5,
							canInteract = function(entity, distance, coords, name)
								if Config.Houses[enteredHouseId].Items[i].robbed then return false end 
								return true
							end,
							onSelect = function()
								if not GetPropStatus() then
									
									if Config.Houses[enteredHouseId].Items[i].anim == 'safe' then
										TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, false)
										local res = createSafe({math.random(0,99),math.random(0,99),math.random(0,99)}) 							
											if res then
												TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, Config.Houses[enteredHouseId].Items[i].delete)
												TriggerEvent('qb-houserobbery:anim', Config.Houses[enteredHouseId].Items[i].anim, Config.Houses[enteredHouseId].Items[i].delete, i)
											else
												QBCore.Functions.Notify(Config.Lang['failed'], "error")
												TriggerServerEvent("qb-houserobbery:server:updateInteriorSafeFailed", enteredHouseId, i, false)
											end
											
									else
										TriggerServerEvent('qb-houserobbery:server:updateInterior', enteredHouseId, i, Config.Houses[enteredHouseId].Items[i].delete)
										TriggerEvent('qb-houserobbery:anim', Config.Houses[enteredHouseId].Items[i].anim, Config.Houses[enteredHouseId].Items[i].delete, i)
									end
							
								else
									QBCore.Functions.Notify(Config.Lang['carrying'], 'error')
								end
							end
						}
					}
				})

			end


		end
		local boxZone = BoxZone:Create(vector3(Config.Houses[enteredHouseId].InteriorCoords.x, Config.Houses[enteredHouseId].InteriorCoords.y, Config.Houses[enteredHouseId].InteriorCoords.z), 1.2, 1.2, {
			name="House Exit",
			debugPoly = false,
			heading = 70,
			minZ = Config.Houses[enteredHouseId].InteriorCoords.z - 2,
			maxZ = Config.Houses[enteredHouseId].InteriorCoords.z + 2,
		})
		boxZone:onPlayerInOut(function(isPointInside)
			if isPointInside then
				exports[Config.CoreName]:DrawText(Config.Lang['leave'], 'left')
				exitZone = true
				ExitThread()
			else
				exitZone = false
				exports[Config.CoreName]:HideText()
			end
		end)
	end)
end



function ExitThread()
	CreateThread(function()
		while exitZone do
			if IsControlJustPressed(0, Config.HouseKey) then
				leave()
			end
			Wait(5)
		end
	end)
end


function noiseLevelFunction(houseId)
	local ped = PlayerPedId()
	while insideHouse do
		progessBar(Config.Houses[houseId].NoiseLevel)
		if IsPedShooting(ped) then
			Config.Houses[houseId].NoiseLevel = Config.Houses[houseId].NoiseLevel + 20
			TriggerServerEvent("qb-houserobbery:server:noiseLevel", houseId, Config.Houses[houseId].NoiseLevel)
		end
		if GetEntitySpeed(ped) > 1.1 then
			Config.Houses[houseId].NoiseLevel = Config.Houses[houseId].NoiseLevel + 10
			TriggerServerEvent("qb-houserobbery:server:noiseLevel", houseId, Config.Houses[houseId].NoiseLevel)
			if GetEntitySpeed(ped) > 2.5 then
				Config.Houses[houseId].NoiseLevel = Config.Houses[houseId].NoiseLevel + 15
				TriggerServerEvent("qb-houserobbery:server:noiseLevel", houseId, Config.Houses[houseId].NoiseLevel)
			end
			if GetEntitySpeed(ped) > 3.0 then
				Config.Houses[houseId].NoiseLevel = Config.Houses[houseId].NoiseLevel + 20
				TriggerServerEvent("qb-houserobbery:server:noiseLevel", houseId, Config.Houses[houseId].NoiseLevel)
			end
			Wait(300)
		else
			Config.Houses[houseId].NoiseLevel = Config.Houses[houseId].NoiseLevel - 2
			if Config.Houses[houseId].NoiseLevel < 0 then
				Config.Houses[houseId].NoiseLevel = 0
			end
			TriggerServerEvent("qb-houserobbery:server:noiseLevel", houseId, Config.Houses[houseId].NoiseLevel)
			Wait(1000)
		end
		progessBar(Config.Houses[houseId].NoiseLevel)
		if Config.Houses[houseId].NoiseLevel > 100 then

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 50, 'houseAlarm', 0.7)
			AlertCops()
			SendNUIMessage({closeProgress = true})
			break
			
		end
		Wait(5)
	end
end

function enter()
	if not Config.Houses[enteredHouseId].InteriorSpawned then
		if closestHouse.houseModel == 'HighEnd' then
			Config.Houses[enteredHouseId].InteriorCoords, Config.Houses[enteredHouseId].Items, Config.Houses[enteredHouseId].InteriorObjects = HighEnd(closestHouse)
		elseif closestHouse.houseModel == 'MidApt' then
			Config.Houses[enteredHouseId].InteriorCoords, Config.Houses[enteredHouseId].Items, Config.Houses[enteredHouseId].InteriorObjects = MidApt(closestHouse)
		end
		Config.Houses[enteredHouseId].InteriorSpawned = true
		TriggerServerEvent("qb-houserobbery:server:interiorItems", enteredHouseId, Config.Houses[enteredHouseId].InteriorCoords, Config.Houses[enteredHouseId].Items, Config.Houses[enteredHouseId].InteriorObjects)
		ClearAreaOfPeds(Config.Houses[enteredHouseId].InteriorCoords.x, Config.Houses[enteredHouseId].InteriorCoords.y, Config.Houses[enteredHouseId].InteriorCoords.z, 100.0, 1)
		QBCore.Functions.TriggerCallback('qb-houserobbery:server:interiorRobbed', function(robbed)
			if not Config.Houses[enteredHouseId].Items[robbed].robbed then
				Config.Houses[enteredHouseId].Items[robbed].robbed = true
				if Config.Houses[enteredHouseId].Items[robbed].robbed and Config.Houses[enteredHouseId].Items[robbed].delete then
					DeleteEntity(Config.Houses[enteredHouseId].Items[robbed].objects)
				end
			end
		end, enteredHouseId)
	else
		DoScreenFadeOut(1000)
		Wait(1500)
		SetEntityCoords(PlayerPedId(), Config.Houses[enteredHouseId].InteriorCoords.x, Config.Houses[enteredHouseId].InteriorCoords.y, Config.Houses[enteredHouseId].InteriorCoords.z)
		Wait(2500)
		DoScreenFadeIn(1500)
	end
	TriggerEvent('qb-weathersync:PauseSync', true)
	if not insideHouse then
		robbing = true
		insideHouse = true
		enterHouseThread()
		if not Config.Houses[enteredHouseId].alarmTriggered then
			noiseLevelFunction(enteredHouseId)
		end
	end
end

function leave()
	if Config.Ox_Target then
		for i = 1, #Config.Houses[enteredHouseId].Items do
			exports.ox_target:removeZone(oxTargetIds[i])
		end
	end
	
	insideHouse = false
	robbing = false
	enteredHouseId = nil
	DoScreenFadeOut(1000)
	Wait(1500)
	SetEntityCoords(PlayerPedId(), robbedHouseCoords.x, robbedHouseCoords.y, robbedHouseCoords.z)
	TriggerEvent('qb-weathersync:PauseSync', false)
	Wait(800)
	DoScreenFadeIn(2600)
	robbedHouseCoords = nil
	SendNUIMessage({closeProgress = true})

	
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(10)
	end
end

function RequestWalking(set)
	RequestAnimSet(set)
	while not HasAnimSetLoaded(set) do
		Wait(1)
	end
end

function cleanUP(houseId)
	if #Config.Houses[houseId].Items > 0 then
		for i = 1, #Config.Houses[houseId].Items do
			DeleteEntity(Config.Houses[houseId].Items[i].objects)
		end
	end
	if #Config.Houses[houseId].InteriorObjects > 0 then
		for i = 1, #Config.Houses[houseId].InteriorObjects do
			DeleteEntity(Config.Houses[houseId].InteriorObjects[i])
		end
	end
	Config.Houses[houseId].InteriorCoords = nil
	Config.Houses[houseId].NoiseLevel = 0
	Config.Houses[houseId].alarmTriggered = false
	Config.Houses[houseId].InteriorSpawned = false
end

function progessBar(percentage)
	SendNUIMessage({runProgress = true, Length = percentage})
end

RegisterNetEvent('qb-houserobbery:client:noiseLevel', function(houseId, level)
	if not insideHouse and not robbing then return end
	Config.Houses[houseId].NoiseLevel = level
	if Config.Houses[houseId].NoiseLevel > 100 then
		Config.Houses[houseId].alarmTriggered = true
	end
end)

RegisterNetEvent('qb-houserobbery:client:enterHouse', function()
	if not robbing then return end
    enter()
end)

RegisterNetEvent('qb-houserobbery:anim', function(anim, delete, i)
	if insideHouse == false and not robbing then return end
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	if anim == 'tv' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'tv')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'safe' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(20000, 30000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'safe')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'telescope' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'telescope')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'art' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'art')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'normal' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'random')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'mesa' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'random')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	elseif anim == 'laptop' then
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', 'laptop')
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	else
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN')
        QBCore.Functions.Progressbar("hospital_checkin", Config.Lang['progressbar'], math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ClearPedTasksImmediately(PlayerPedId())
			TriggerServerEvent('qb-houserobbery:item', anim)
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
            
        end)
	end
end)

RegisterNetEvent('qb-houserobbery:client:interiorItems', function(house, coords, items, objects)
	if Config.Houses[house].InteriorCoords == nil and not next(Config.Houses[house].Items) and not next(Config.Houses[house].InteriorObjects) then
		Config.Houses[house].InteriorCoords = coords
		Config.Houses[house].Items = items
		Config.Houses[house].InteriorObjects = objects
	end
end)

RegisterNetEvent('qb-houserobbery:client:cleanHouseStatus', function(house, opened, robbed)
	Config.Houses[house].Opened = false
	Config.Houses[house].Robbed = false
	cleanUP(house)
end)

RegisterNetEvent('qb-houserobbery:client:updateRobStatus', function(house)
	Config.Houses[house].Robbed = true
end)

RegisterNetEvent('qb-houserobbery:client:updateOpenStatus', function(house, opened)
	Config.Houses[house].Opened = opened
end)

RegisterNetEvent('qb-houserobbery:client:updateInterior', function(house, i, delete)
	if not Config.Houses[house].Items[i].robbed then
		Config.Houses[house].Items[i].robbed = true
		if Config.Houses[house].Items[i].robbed and Config.Houses[house].Items[i].delete then
			DeleteEntity(Config.Houses[house].Items[i].objects)
		end
	end
end)

RegisterNetEvent('qb-houserobbery:client:updateInteriorSafeFailed', function(house, i, delete)

	Config.Houses[house].Items[i].robbed = false
	
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('qb-houserobbery:server:GetHouseConfig', function(HouseConfig)
        Config.Houses = HouseConfig
    end)
end)

RegisterNetEvent('qb-houserobbery:startrobbing', function()
	if isNight() then
		QBCore.Functions.TriggerCallback('qb-houserobbery:server:GetCops', function(result)
			
			if result >= Config.MinimumJobPolice then
				if not started then
					started = true
					closesthouseid, closestHouse = robbableHouses()
					TriggerServerEvent('qb-houserobbery:server:robHouseStatus', closesthouseid)
					
					QBCore.Functions.Notify(Config.Lang['bosswait'], "success")
					Citizen.Wait(Config.WaitTime * 60 * 1000)
					if closesthouseid and closestHouse then
						PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
						
						CreateThread(function()
							Wait(2500)
							DestBlip = AddBlipForCoord(closestHouse.x, closestHouse.y, closestHouse.y)
							SetBlipSprite(DestBlip, 414)
							SetBlipColour(DestBlip, 2)
							SetBlipRoute(DestBlip, true)
							SetBlipRouteColour(DestBlip, 2)
							SetBlipAsShortRange(DestBlip, false)
							SetBlipScale(DestBlip, 0.75)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString(Config.Lang['houseblip'])
							EndTextCommandSetBlipName(DestBlip)
						end)
					else
						started = false
						QBCore.Functions.Notify(Config.Lang['nohouses'], "error")
					end
				else
					QBCore.Functions.Notify(Config.Lang['bosssearch'], "error")
				end
			else
				QBCore.Functions.Notify(Config.Lang['nocops'], "error")
			end

		end)
	else
		QBCore.Functions.Notify(Config.Lang['night'], "error")
	end

	
end)


function robbableHouses()
	local key, value = nil, nil
	math.randomseed(GetGameTimer())
	for k,v in pairs(Config.Houses) do
		if not v.Robbed then
			local selected = math.random(1, k)
			local c = Config.Houses[selected]
			key, value = selected, c
		end
	end
	return key, value
end



CreateThread(function()
    
    RequestModel(Config.StartPed)
    while not HasModelLoaded(Config.StartPed) do
    Wait(1)
  end
    houserobped = CreatePed(2, Config.StartPed, Config.StartPedLoc.x, Config.StartPedLoc.y, Config.StartPedLoc.z-1, Config.StartPedLoc.w, false, false) -- change here the cords for the ped 
    SetPedFleeAttributes(houserobped, 0, 0)
    SetPedDiesWhenInjured(houserobped, false)
    TaskStartScenarioInPlace(houserobped, Config.StartPedAnimation, 0, true)
    SetPedKeepTask(houserobped, true)
    SetBlockingOfNonTemporaryEvents(houserobped, true)
    SetEntityInvincible(houserobped, true)
    FreezeEntityPosition(houserobped, true)

    Wait(100)

	if not Config.Ox_Target then

		exports['qb-target']:AddEntityZone("house_spawner-"..houserobped, houserobped, {
			name = "house_spawner-"..houserobped,
			heading= 90.5,
			debugPoly=false,
		}, {
			options = {
				{
					type = "client",
					event = "qb-houserobbery:startrobbing",
					icon = "fas fa-people-carry-box",
					label = Config.Lang['job'],
				},
			},
			distance = distance
		})
	else

		exports.ox_target:addLocalEntity(houserobped,  
		{
			{
				name = 'mestredoengate',
				event = 'qb-houserobbery:startrobbing',
				icon = 'fa-solid fa-people-carry-box',
				label = Config.Lang['job'],
				distance = 1.5,
				
			}
		})


	end
  
end)

function isNight()
	local hora = GetClockHours()
	if hora > Config.Night[1] or hora < Config.Night[2] then
		return true
	end
	return false
end

function policeCloseDoor()
	
	local PlayerJob
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
	
	if PlayerJob.type == Config.PoliceJobType then
		for i = 1, #Config.Houses do
			local casa = Config.Houses[i]
			if #(GetEntityCoords(PlayerPedId()) - vector3(casa.x, casa.y, casa.z)) < 5 then
				TriggerServerEvent("qb-houserobbery:server:policeCloseDoor", i)
			end
		end
	end

end

RegisterCommand(Config.PoliceCloseDoorCommand, function()
	
	policeCloseDoor()
	
end)






------------------------Prop handler section-----------------------------------------------

local HasItem = false
local CurrentProp, HasProp = nil, false
local slots = 40
local items = {}
local CurrentProps = {}
local checking = false
local lastProp = nil
local invehicle = false
-- FUNCTIONS

function startPropsLoop()
    CreateThread(function()
        while true do
            local player = QBCore.Functions.GetPlayerData()
            while player == nil do
                player = QBCore.Functions.GetPlayerData()
                Wait(500)
            end
            for i = 1, slots do
                items[i] = player.items[i]
            end
            checkProps()
            Wait(1000)
        end
    end)
end

function checkProps()
    for i = 1, slots do
        if items[i] ~= nil then
            local name = items[i].name
            if Config.PropList[name] and CurrentProp == nil then
                HasItem = true
                AddPropToHands(name)
                disableControls()
            end
        end
    end

    local hasItem = false
    for j = 1, slots do
        if items[j] ~= nil then
            local name = items[j].name
            if name == lastProp then
                hasItem = true
            end
        end
    end
    if not hasItem then
        RemovePropFromHands()
    end
end

function AddPropToHands(PropName)
    lastProp = PropName
    AddProp(PropName)
    CreateThread(function()
        while HasItem do
            if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'walk', 3) then
                RequestAnimationDict("anim@heists@box_carry@")
                TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'walk', 8.0, 8.0, -1, 50, 0, false, false, false)
            end
            Wait(500)
        end
    end)
end

function disableControls()
    CreateThread(function()
        while HasItem do
            if invehicle == nil then
				invehicle = false
			end

			if IsPedGettingIntoAVehicle(PlayerPedId()) and HasItem then
				QBCore.Functions.Notify(Config.Lang['novehicle'], 'error')
				ClearPedTasksImmediately(PlayerPedId())
			end

            if not invehicle and IsPedInAnyVehicle(PlayerPedId(), true) then
				invehicle = true
				if HasItem then
					QBCore.Functions.Notify(Config.Lang['novehicle'], 'error')
					ClearPedTasksImmediately(PlayerPedId())
				end
			end

			if invehicle and not IsPedInAnyVehicle(PlayerPedId(), true) then
				invehicle = false
			end

            if IsPedRunning(PlayerPedId()) or IsPedSprinting(PlayerPedId()) then -- disable running
                SetPlayerControl(PlayerId(), 0, 0)
                Citizen.Wait(1000)
                SetPlayerControl(PlayerId(), 1, 1)
            end
            Wait(300)
        end
    end)
end

function AddProp(Name)
    if Config.PropList[Name] ~= nil then
        if CurrentProp == nil then
            RequestModelHash(Config.PropList[Name]['prop'])
            CurrentProp = CreateObject(Config.PropList[Name]['hash'], 0, 0, 0, true, true, false)
            AttachEntityToEntity(CurrentProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), Config.PropList[Name]['bone-index']['bone']), Config.PropList[Name]['bone-index']['X'], Config.PropList[Name]['bone-index']['Y'], Config.PropList[Name]['bone-index']['Z'], Config.PropList[Name]['bone-index']['XR'], Config.PropList[Name]['bone-index']['YR'], Config.PropList[Name]['bone-index']['ZR'], true, true, false, true, 1, true)
            HasProp = true
        end
    end
end

function RemoveProp()
    if CurrentProp ~= nil then
        if HasProp ~= nil then
            DetachEntity(CurrentProp, true, false)
            DeleteEntity(CurrentProp)
            DeleteObject(CurrentProp)
            HasProp = false
            CurrentProp = nil
        end
    end
end

function GetPropStatus()
    return HasProp
end

function GetPropName()
    return lastProp
end


function RemovePropFromHands()
    lastProp = nil
    HasItem = false
    RemoveProp()
    StopAnimTask(PlayerPedId(), 'anim@heists@box_carry@', 'walk', 1.0)
end

-- // Functions \\ --
function ResetAnimSet()
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end

function RequestAnimationDict(AnimDict)
    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Citizen.Wait(1)
    end
end

function RequestModelHash(Model)
    RequestModel(Model)
    while not HasModelLoaded(Model) do
        Wait(1)
    end
end

-- EVENTS
RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(5000)
    startPropsLoop()
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    startPropsLoop()
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
    RemovePropFromHands()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    RemovePropFromHands()
end)



