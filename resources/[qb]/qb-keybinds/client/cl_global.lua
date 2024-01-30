-- Binds that are used globaly and do not fit in a single resouce
-- All Binds should use the event name and bool


-- disable pause
Citizen.CreateThread(function()
	while true do
		DisableControlAction(1, 199, true)
		Wait(5)
	end
end)
