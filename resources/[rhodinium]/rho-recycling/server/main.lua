RegisterNetEvent('rho-recycling:giveitem')
AddEventHandler('rho-recycling:giveitem', function(Item, Amount)
local Player = source
local Item = Item
local Amount = Amount
exports.ox_inventory:AddItem(Player, Item, Amount)
end)

RegisterNetEvent('rho-recycling:removeitem')
AddEventHandler('rho-recycling:removeitem', function(Item, Amount)
local Player = source
local Item = Item
local Amount = Amount
exports.ox_inventory:RemoveItem(Player, Item, Amount)
end)
