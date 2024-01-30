local xhairActive = false
local disableXhair = false

RegisterCommand("togglexhair", function()
    disableXhair = not disableXhair
end)

Citizen.CreateThread(function()
    while true do
        Wait(500)
        local get_ped = PlayerPedId()
        local get_ped_veh = GetVehiclePedIsIn(get_ped, false)

        if xhairActive and IsPedArmed(get_ped, 7) and not IsControlPressed(0, 25) then
            xhairActive = false
            SendNUIMessage("xhairHide")
        end

        if not disableXhair and not xhairActive and IsPedArmed(get_ped, 7) and IsControlPressed(0, 25) then 
            xhairActive = true
            SendNUIMessage("xhairShow")
        elseif not IsPedArmed(PlayerPedId(), 7) and xhairActive then
            xhairActive = false
            SendNUIMessage("xhairHide")
        end
    end
end) 

--[[------------------------------------------------------------------------
    Remove Reticle on ADS (Third Person)
------------------------------------------------------------------------]]--
local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282  -- WEAPON_MARKSMANRIFLE
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local _, hash = GetCurrentPedWeapon( ped, true )

        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and not HashInTable( hash ) ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
	
		HideHudComponentThisFrame( 14 )		
		Citizen.Wait( 0 )

    end 
end )