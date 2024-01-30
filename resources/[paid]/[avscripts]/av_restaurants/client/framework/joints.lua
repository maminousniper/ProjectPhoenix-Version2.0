AddEventHandler('av_restaurant:joint', function(data)
    local job = data['job']
    local type = 'joint'
    lib.callback('av_restaurant:getItems', false, function(items)
        local menu = {}
        for k, v in pairs(items) do
            local ingredientsLabel = ""
            local ingredients = false
            if v['ingredients'] then
                ingredients = json.decode(v['ingredients'])
                if ingredients then
                    for k, v in pairs(ingredients) do
                        if tonumber(k) == 1 then
                            ingredientsLabel = v
                        else
                            ingredientsLabel = ingredientsLabel.." | "..v
                        end
                    end
                end
            end
            menu[#menu+1] = {
                title = v['label'],
                description = "Ingredients: "..ingredientsLabel,
                event = "av_restaurant:craft",
                args = {
                    item = v['name'],
                    job = job,
                    type = type,
                    ingredients = ingredients,
                    image = v['image'],
                    itemLabel = v['label'],
                    prop = v['prop']
                }
            }
        end
        lib.registerContext({
            id = 'av_restaurants:joint',
            title = Lang['joint'],
            options = menu,
        })
        lib.showContext('av_restaurants:joint')
    end,{job = job, type = type})
end)