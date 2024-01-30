RPC.register("rho-tax:server:getCurrentTax", function(src, category)
    local result = exports.oxmysql:executeSync('SELECT tax_amount FROM _tax WHERE name = ?', {category})
    if result[1] then
        return result[1].tax_amount
    else
        return nil
    end
end)

--On update of tax value
RPC.register("rho-tax:server:updateTax", function(newTaxValue, category)
    exports.oxmysql:executeSync('UPDATE _tax SET tax_amount = ? WHERE name = ?', {newTaxValue, category})

    print("Updated Tax Amount For" .. category .. " New value is" .. newTaxValue)
end)

