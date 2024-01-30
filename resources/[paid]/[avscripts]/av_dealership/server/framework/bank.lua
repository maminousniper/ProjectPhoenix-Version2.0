-- In this file you can find all the functions used to retrieve, add or remove the dealership funds
-- I don't give any support on how to make it compatible with X bank/society script
-- I don't give any support on how to make it compatible with X bank/society script
-- I don't give any support on how to make it compatible with X bank/society script

function dealershipCreated(name,label,funds)
 -- This function will be triggered when a new dealership is created
    if Config.Debug then
        print("dealershipCreated", name, label, funds)
    end
end

function dealershipDeleted(name)
    -- Triggered when a dealership gets deleted
end

function getFunds(name)
    local funds = 0
    local myDealer = dealership_data[name]
    if myDealer and myDealer['funds'] then
        funds = myDealer['funds']
    end
    return funds
end

function addFunds(name, amount)
    local myDealer = dealership_data[name]
    if myDealer and myDealer['funds'] then
        myDealer['funds'] += amount
    end
end

function removeFunds(name,amount)
    local myDealer = dealership_data[name]
    if myDealer and myDealer['funds'] then
        myDealer['funds'] -= amount
    end
end

function setFunds(name, amount)
    local myDealer = dealership_data[name]
    if myDealer and myDealer['funds'] then
        myDealer['funds'] = amount
    end
end