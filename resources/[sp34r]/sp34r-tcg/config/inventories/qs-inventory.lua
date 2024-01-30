
if GetResourceState("qs-inventory") ~= "started" then return end

Inventory = exports['qs-inventory']

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, slot, metadata)
end
