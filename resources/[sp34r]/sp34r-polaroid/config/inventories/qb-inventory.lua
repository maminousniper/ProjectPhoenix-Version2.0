
local qbVariations = {"qb-inventory", "ps-inventory", "lj-inventory"}
local Inventory = exports["qb-inventory"]
local foundInv = false

for i = 1, #qbVariations do
    if GetResourceState(qbVariations[i]) ~= "started" then
        if i == #qbVariations then
            if not foundInv then
                return
            end
        end
    else
        foundInv = true
        Inventory = exports[qbVariations[i]]
    end
end

function AddItem(src, item, count, metadata)
    Inventory:AddItem(src, item, count, false, metadata)
end

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, slot)
end

function HaveItem(src, item)
    if #Inventory:GetItemsByName(src, item) >= 1 then 
        return true 
    end
    return false
end