
if GetResourceState("ox_inventory") ~= "started" then return end

Inventory = exports['ox_inventory']

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, metadata, slot)
end
