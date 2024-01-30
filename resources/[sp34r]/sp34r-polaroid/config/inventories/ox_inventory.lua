
if GetResourceState("ox_inventory") ~= "started" then return end

Inventory = exports['ox_inventory']

function AddItem(src, item, count, metadata)
    Inventory:AddItem(src, item, count, metadata)
end

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, metadata, slot)
end

function HaveItem(src, item)
    local result = Inventory:GetItemCount(src, item) >= 1
    return result
end