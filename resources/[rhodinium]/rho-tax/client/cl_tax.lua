-- Function to get current tax
function getCurrentTax(category)
    local currentTax = RPC.execute("rho-tax:server:getCurrentTax", category)
    return currentTax -- Return the tax_amount directly
end
exports('getCurrentTax', getCurrentTax)

-- Function to update tax
function updateTax(newTaxValue, category)
    local updatedTaxTable = RPC.execute("rho-tax:server:updateTax", newTaxValue, category)
    return updatedTaxTable
end
exports('updateTax', updateTax)

function calculateTotalCostWithTax(amount, category)
    local currentTaxAmount = getCurrentTax(category)
    local taxAmount = amount * (currentTaxAmount / 100)
    local totalCost = amount + taxAmount 
    return totalCost
end
exports('calculateTotalCostWithTax', calculateTotalCostWithTax)

--[[ RegisterNetEvent('calculateTotalCostWithTax')
AddEventHandler('calculateTotalCostWithTax', function(amount, category)
    local src = source
    local source = src
    local currentTaxAmount = getCurrentTax(category)
    local taxAmount = amount * (currentTaxAmount / 100)
    local totalCost = amount + taxAmount 
    print(totalCost)
    TriggerEvent('qb-phone:client:RemoveBankMoney', src, totalCost)
    --TriggerServerEvent('calculateTotalCostWithTax:response', totalCost)
end) ]]

RegisterCommand('testGetCurrentTax', function()
    local taxTable = getCurrentTax("vehicle")
    print(taxTable)
end, false)



--[[ RegisterCommand('testprog', function()
    exports['bp-notifyprogbar']:progbaractive("Helpp", 4000)
    TriggerEvent('bp-notifyprogbar:notify', "You can write anything here." , 4000, "info")
    TriggerEvent('bp-notifyprogbar:notify', "You can write anything here." , 4000, "error")
    TriggerEvent('bp-notifyprogbar:notify', "You can write anything here." , 4000, "success")
    TriggerEvent('bp-notifyprogbar:openinfo', "Get Car" , "Go to motel and take car.")
    TriggerEvent('bp-notifyprogbar:closeinfo')
end, false) ]]
