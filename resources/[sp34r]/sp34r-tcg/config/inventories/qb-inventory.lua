
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

function RemoveItem(src, item, count, metadata, slot)
    Inventory:RemoveItem(src, item, count, slot)
end
