local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

-- These stashes are all created on resource start
local stashes = {
	{
		-- Mech stash
		id = 'mech_stash',
		label = 'Mechanic Stash',
		slots = 50,
		weight = 1000000,
		owner = false,
		jobs = 'mechanic'
	},

}

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		for i=1, #stashes do
			local stash = stashes[i]
			ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.jobs)
		end
	end 
end)
