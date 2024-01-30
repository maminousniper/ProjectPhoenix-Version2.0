AddEventHandler('av_restaurant:others', function(data)
    local job = data['job']
    local type = 'others'
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
            id = 'av_restaurants:others',
            title = Lang['others'],
            options = menu,
        })
        lib.showContext('av_restaurants:others')
    end,{job = job, type = type})
end)

AddEventHandler('av_restaurant:washhands', function(data)
    local job = data['job']
    local type = 'washhands'
    lib.callback('av_restaurant:getItems', false, function(items)
        local menu = {}
        for k, v in pairs(items) do
            menu[#menu+1] = {
                title = v['label'],
                description = v['description'],
                event = "av_restaurant:craft",
                args = {
                    item = v['name'],
                    job = job,
                    type = type
                }
            }
        end
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)

        QBCore.Functions.Progressbar("clean", "Washing hands...", 10000, false, true, { 
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            disable_actions = false
            ClearPedTasksImmediately(playerPed)
        end, function() -- Cancel
            ClearPedTasksImmediately(playerPed)
        end)
    
    end,{job = job, type = type})
end)