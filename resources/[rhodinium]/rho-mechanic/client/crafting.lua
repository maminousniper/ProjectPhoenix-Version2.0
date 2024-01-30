QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

local function getCarPartsByKey(key)
    local results = {}
    for k,v in next, Config.vehicleCustomisation do
        if string.find(v.category:lower(), key:lower()) then
            results[#results + 1] = v.itemname
        end
    end
    if string.find(Config.SprayItem:lower(), key:lower()) then
        results[#results + 1] = Config.SprayItem
    end
    if string.find(Config.NeonItem:lower(), key:lower()) then
        results[#results + 1] = Config.NeonItem
    end
    if string.find(Config.XenonItem:lower(), key:lower()) then
        results[#results + 1] = Config.XenonItem
    end
    if string.find(Config.WheelItem:lower(), key:lower()) then
        results[#results + 1] = Config.WheelItem
    end
    if string.find(Config.ExtraItem:lower(), key:lower()) then
        results[#results + 1] = Config.ExtraItem
    end
    if string.find(Config.WindowTintItem:lower(), key:lower()) then
        results[#results + 1] = Config.WindowTintItem
    end
    if string.find(Config.TyreSmokeItem:lower(), key:lower()) then
        results[#results + 1] = Config.TyreSmokeItem
    end
    return results
end

RegisterNetEvent('rho-mechanic:openCrafting', function()
    if Config.Menu == 'qb' then
        local headerMenu = {}
        headerMenu[#headerMenu + 1] = {
            header = 'Mechanic Crafting',
            isMenuHeader = true
        }
        headerMenu[#headerMenu + 1] = {
            header = 'Search',
            icon = 'fa-solid  fa-magnifying-glass',
            params = {
                event = 'rho-mechanic:openSearchMemu',
            }
        }
        local counter = 0
        for a,item in next, Config.vehicleCustomisation do
            if counter == 8 then
                break
            end
            local text = ""
            if item.materials then
                for k, v in next, item.materials do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if item.materials.money then
                    text = text .. 'Money: ' .. item.materials.money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = item.category,
                icon = item.itemname,
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = item.id,
                        materials = item.materials
                    }
                }
            }
            counter = counter + 1
        end
        
        local text = ""
        if Config.CustomMaterials['spray'] then
            for k, v in next, Config.CustomMaterials['spray'] do
                if type(v) == 'table' then
                    text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                end
            end
            if Config.CustomMaterials['spray'].money then
                text = text .. 'Money: ' .. Config.CustomMaterials['spray'].money .. '$<br>'
            end
        end
        if not counter == 9 then
            headerMenu[#headerMenu + 1] = {
                header = 'Respray',
                icon = 'spray',
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 255,
                        materials = Config.CustomMaterials['spray']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['neon'] then
                for k, v in next, Config.CustomMaterials['neon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['neon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['neon'] .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Neon',
                icon = 'neon',
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 256,
                        materials = Config.CustomMaterials['neon']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['xenon'] then
                for k, v in next, Config.CustomMaterials['xenon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['xenon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['xenon'] .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Xenon',
                icon = 'xenon',
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 257,
                        materials = Config.CustomMaterials['xenon']
                    }
                }
            }
        else
            headerMenu[#headerMenu + 1] = {
                header = 'Next Page →',
                params = {
                    event = "craft1forword",
                    args = {
                        type = 0
                    }
                }
            }
        end
        exports[Config.MenuFolderName]:openMenu(headerMenu)
    elseif Config.Menu == 'ox' then
        local options = {}
        
        local counter = 0
        options[#options + 1] = {
            title = 'Search',
            description = 'Search the item that you are looking for',
            icon = 'magnifying-glass',
            event = 'rho-mechanic:openSearchMemu',
        }
        for a,item in next, Config.vehicleCustomisation do
            if counter == 8 then
                break
            end
            local text = ""
            if item.materials then
                for k, v in next, item.materials do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if item.materials.money then
                    text = text .. 'Money: ' .. item.materials.money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = item.category,
                description = text,
                -- icon = '@[resources]/ps-inventory/html/images/'..item.itemname .. '.png',
                icon = Config.Images[item.itemname].image,
                image = Config.Images[item.itemname].image,
                -- icon = icon,
                onSelect = function()
                    local args = {
                        type = item.id,
                        materials = item.materials
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            counter = counter + 1
        end
        
        local text = ""
        if Config.CustomMaterials['spray'] then
            for k, v in next, Config.CustomMaterials['spray'] do
                if type(v) == 'table' then
                    text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                end
            end
            if Config.CustomMaterials['xenon'].money then
                text = text .. 'Money: ' .. Config.CustomMaterials['xenon'].money .. '$\n'
            end
        end
        if not counter == 9 then
            options[#options + 1] = {
                title = 'Respray',
                description = text,
                icon = Config.Images[Config.SprayItem].image,
                image = Config.Images[Config.SprayItem].image,
                onSelect = function()
                    local args = {
                        type = 255,
                        materials = Config.CustomMaterials['spray']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['neon'] then
                for k, v in next, Config.CustomMaterials['neon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['xenon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['xenon'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Neon',
                description = text,
                icon = Config.Images[Config.NeonItem].image,
                image = Config.Images[Config.NeonItem].image,
                onSelect = function()
                    local args = {
                        type = 256,
                        materials = Config.CustomMaterials['neon']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['xenon'] then
                for k, v in next, Config.CustomMaterials['xenon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['xenon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['xenon'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Xenon',
                description = text,
                icon = Config.Images[Config.XenonItem].image,
                image = Config.Images[Config.XenonItem].image,
                onSelect = function()
                    local args = {
                        type = 257,
                        materials = Config.CustomMaterials['xenon']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
        else
            options[#options + 1] = {
                title = 'Next Page →',
                onSelect = function()
                    local args = {
                        type = 0
                    }
                    TriggerEvent('craft1forword', args)
                end,
            }
        end
        lib.registerContext({
            id = 'craftingMenu_'.. counter,
            title = 'Mechanic Crafting',
            options = options
        })
        lib.showContext('craftingMenu_'.. counter)
    else
        print('unkown menu')
    end
end)

RegisterNetEvent('rho-mechanic:openSearchMemu', function()
    if Config.Menu == 'ox' then
        local input = lib.inputDialog('Basic dialog', {'Search Car Part'})
    
        if not input then return end
        local newMenu = getCarPartsByKey(input[1])
        TriggerEvent('rho-mechanic-openMenuSearch', newMenu)
    elseif Config.Menu == 'qb' then
        local dialog = exports['qb-input']:ShowInput({
            header = "Search Menu",
            inputs = {
                {
                    text = "Search Car Part", -- text you want to be displayed as a place holder
                    name = "key", -- name of the input should be unique otherwise it might override
                    type = "text", -- type of the input
                    isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    -- default = "CID-1234", -- Default text option, this is optional
                },
            }
        })
        if not dialog then return end
        local newMenu = getCarPartsByKey(dialog['key'])
        TriggerEvent('rho-mechanic-openMenuSearch', newMenu)
    end
end)

RegisterNetEvent('rho-mechanic-openMenuSearch', function(newMenu)
    local options = {}
    if Config.Menu == 'ox' then
        if newMenu and next(newMenu) then
            for _, menu in next, newMenu do
                if menu == Config.SprayItem or menu == Config.ExtraItem or menu == Config.XenonItem or menu == Config.WheelItem or menu == Config.NeonItem or menu == Config.WindowTintItem or menu == Config.TyreSmokeItem then
                    local newItem = menu
                    if newItem == 'spraycan' then
                        newItem = 'spray'
                    elseif newItem == Config.TyreSmokeItem then
                        newItem = 'tyreSmoke'
                    end
                    local text = ""
                    if Config.CustomMaterials[newItem] then
                        for k, v in next, Config.CustomMaterials[newItem] do
                            if type(v) == 'table' then
                                text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                            end
                        end
                        if Config.CustomMaterials[newItem].money then
                            text = text .. 'Money: ' .. Config.CustomMaterials[newItem].money .. '$\n'
                        end
                    end
                    local typeData = 255
                    if menu == Config.NeonItem then
                        typeData = 256
                    elseif menu == Config.XenonItem then
                        typeData = 257
                    elseif menu == Config.WheelItem then
                        typeData = 258
                    elseif menu == Config.ExtraItem then
                        typeData = 259
                    elseif menu == Config.WindowTintItem then
                        typeData = 260
                    elseif menu == Config.TyreSmokeItem then
                        typeData = 261
                    end
                    options[#options + 1] = {
                        title = QBCore.Shared.Items[menu].label,
                        description = text,
                        icon = Config.Images[menu].image,
                        image = Config.Images[menu].image,
                        onSelect = function()
                            local args = {
                                type = typeData,
                                materials = Config.CustomMaterials[newItem]
                            }
                            TriggerEvent('eventidkidk', args)
                        end,
                    }
                else
                    local index = 999
                    for i, v in next, Config.vehicleCustomisation do
                        if v.itemname == menu then
                            index = i
                            break
                        end
                    end
                    if index ~= 999 then
                        local menuItem = Config.vehicleCustomisation[index]
                        local text = ""
                        if menuItem.materials then
                            for k, v in next, menuItem.materials do
                                if type(v) == 'table' then
                                    text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                                end
                            end
                            if menuItem.materials.money then
                                text = text .. 'Money: ' .. menuItem.materials.money .. '$\n'
                            end
                        end
                        options[#options + 1] = {
                            title = menuItem.category,
                            description = text,
                            icon = Config.Images[menu].image,
                            image = Config.Images[menu].image,
                            onSelect = function()
                                local args = {
                                    type = menuItem.id,
                                    materials = menuItem.materials
                                }
                                TriggerEvent('eventidkidk', args)
                            end,
                        }
                    end
                end
            end
            options[#options + 1] = {
                title = 'Back', icon = 'left-long', event = 'rho-mechanic:openCrafting'
            }
            lib.registerContext({
                id = 'search2',
                title = 'Search Menu',
                options = options
            })
            lib.showContext('search2')
        else
            lib.registerContext({
                id = 'search1',
                title = 'Search Menu',
                options = {
                    {
                        title = 'Nothing Found', icon = 'circle-exclamation'
                    },
                    {
                        title = 'Back', icon = 'left-long', event = 'rho-mechanic:openCrafting'
                    }
                }
            })
            lib.showContext('search1')
        end
    elseif Config.Menu == 'qb' then
        if newMenu and next(newMenu) then
            local headerMenu = {}
            headerMenu[#headerMenu + 1] = {
                header = 'Search Menu',
                isMenuHeader = true
            }
            for _, menu in next, newMenu do
                if menu == Config.SprayItem or menu == Config.ExtraItem or menu == Config.XenonItem or menu == Config.WheelItem or menu == Config.NeonItem or menu == Config.WindowTintItem or menu == Config.TyreSmokeItem then
                    local newItem = menu
                    if newItem == 'spraycan' then
                        newItem = 'spray'
                    end
                    local text = ""
                    if Config.CustomMaterials[newItem] then
                        for k, v in next, Config.CustomMaterials[newItem] do
                            if type(v) == 'table' then
                                text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                            end
                        end
                        if Config.CustomMaterials[newItem].money then
                            text = text .. 'Money: ' .. Config.CustomMaterials[newItem].money .. '$<br>'
                        end
                    end
                    local typeData = 255
                    if menu == Config.NeonItem then
                        typeData = 256
                    elseif menu == Config.XenonItem then
                        typeData = 257
                    elseif menu == Config.WheelItem then
                        typeData = 258
                    elseif menu == Config.ExtraItem then
                        typeData = 259
                    elseif menu == Config.WindowTintItem then
                        typeData = 260
                    elseif menu == Config.TyreSmokeItem then
                        typeData = 261
                    end
                    headerMenu[#headerMenu + 1] = {
                        header = QBCore.Shared.Items[menu].label,
                        icon = Config.Images[menu].image,
                        txt = text,
                        params = {
                            event = "eventidkidk",
                            args = {
                                type = typeData,
                                materials = Config.CustomMaterials[newItem]
                            }
                        }
                    }
                else
                    local index = 999
                    for i, v in next, Config.vehicleCustomisation do
                        if v.itemname == menu then
                            index = i
                            break
                        end
                    end
                    if index ~= 999 then
                        local menuItem = Config.vehicleCustomisation[index]
                        local text = ""
                        if menuItem.materials then
                            for k, v in next, menuItem.materials do
                                if type(v) == 'table' then
                                    text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                                end
                            end
                            if menuItem.materials.money then
                                text = text .. 'Money: ' .. menuItem.materials.money .. '$<br>'
                            end
                        end
                        headerMenu[#headerMenu + 1] = {
                            header = menuItem.category,
                            icon = menuItem.itemname,
                            txt = text,
                            params = {
                                event = "eventidkidk",
                                args = {
                                    type = menuItem.id,
                                    materials = menuItem.materials
                                }
                            }
                        }
                    end
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Back',
                icon = 'fa-solid fa-left-long',
                params = {
                    event = 'rho-mechanic:openCrafting',
                }
            }
            exports[Config.MenuFolderName]:openMenu(headerMenu)
        else
            exports[Config.MenuFolderName]:openMenu({
                {
                    header = 'Nothing Found',
                    icon = 'fa-solid fa-circle-exclamation',
                    isMenuHeader = true
                },
                {
                    header = 'Back',
                    icon = 'fa-solid fa-left-long',
                    params = {
                        event = 'rho-mechanic:openCrafting',
                    }
                },
            })
        end
    end
end)

RegisterNetEvent('craft1back', function(data)
    local currentPage = data.type - 1
    if Config.Menu == 'qb' then
        local headerMenu = {}
        headerMenu[#headerMenu + 1] = {
            header = 'Mechanic Crafting',
            isMenuHeader = true
        }
        if currentPage >= 1 then
            headerMenu[#headerMenu + 1] = {
                header = '⬅ Back',
                params = {
                    event = "craft1back",
                    args = {
                        type = currentPage
                    }
                }
            }
        end
        local pageStart = currentPage * 8
        local stop = false
        local counter = 0
        for a,item in next, Config.vehicleCustomisation do
            if counter == pageStart + 8 then
                stop = true
                break
            end
            if counter >= pageStart then
                local text = ""
                if item.materials then
                    for k, v in next, item.materials do
                        if type(v) == 'table' then
                            text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                        end
                    end
                    if item.materials.money then
                        text = text .. 'Money: ' .. item.materials.money .. '$<br>'
                    end
                end
                headerMenu[#headerMenu + 1] = {
                    header = item.category,
                    icon = item.itemname,
                    txt = text,
                    params = {
                        event = "eventidkidk",
                        args = {
                            type = item.id,
                            materials = item.materials
                        }
                    }
                }
                counter = counter + 1
            else
                counter = counter + 1
            end
        end
        headerMenu[#headerMenu + 1] = {
            header = 'Next Page →',
            params = {
                event = "craft1forword",
                args = {
                    type = currentPage
                }
            }
        }
        exports[Config.MenuFolderName]:openMenu(headerMenu)
    elseif Config.Menu == 'ox' then
        local options = {}
        if currentPage >= 1 then
            options[#options + 1] = {
                title = '⬅ Back',
                onSelect = function()
                    local args = {
                        type = currentPage
                    }
                    TriggerEvent('craft1back', args)
                end,
            }
        end
        local pageStart = currentPage * 8
        local stop = false
        local counter = 0
        for a,item in next, Config.vehicleCustomisation do
            if counter == pageStart + 8 then
                stop = true
                break
            end
            if counter >= pageStart then
                local text = ""
                if item.materials then
                    for k, v in next, item.materials do
                        if type(v) == 'table' then
                            text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                        end
                    end
                    if item.materials.money then
                        text = text .. 'Money: ' .. item.materials.money .. '$\n'
                    end
                end
                options[#options + 1] = {
                    title = item.category,
                    description = text,
                    icon = Config.Images[item.itemname].image,
                    image = Config.Images[item.itemname].image,
                    onSelect = function()
                        local args = {
                            type = item.id,
                            materials = item.materials
                        }
                        TriggerEvent('eventidkidk', args)
                    end,
                }
                counter = counter + 1
            else
                counter = counter + 1
            end
        end
        options[#options + 1] = {
            title = 'Next Page →',
            onSelect = function()
                local args = {
                    type = currentPage
                }
                TriggerEvent('craft1forword', args)
            end,
        }
        lib.registerContext({
            id = 'craftingMenu_'.. counter,
            title = 'Mechanic Crafting',
            options = options
        })
        lib.showContext('craftingMenu_'.. counter)
    else
        print('unknown menu')
    end
end)

RegisterNetEvent('craft1forword', function(data)
    if Config.Menu == 'qb' then
        local currentPage = data.type + 1
        local headerMenu = {}
        headerMenu[#headerMenu + 1] = {
            header = 'Mechanic Crafting',
            isMenuHeader = true
        }
        headerMenu[#headerMenu + 1] = {
            header = '← Back',
            params = {
                event = "craft1back",
                args = {
                    type = currentPage
                }
            }
        }
        local pageStart = currentPage * 8
        local stop = false
        local counter = 0
        
        for a,item in next, Config.vehicleCustomisation do
            if counter == pageStart + 8 then
                stop = true
                break
            end
            if counter >= pageStart then
                local text = ""
                if item.materials then
                    for k, v in next, item.materials do
                        if type(v) == 'table' then
                            text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                        end
                    end
                    if item.materials.money then
                        text = text .. 'Money: ' .. item.materials.money .. '$<br>'
                    end
                end
                headerMenu[#headerMenu + 1] = {
                    header = item.category,
                    icon = item.itemname,
                    txt = text,
                    params = {
                        event = "eventidkidk",
                        args = {
                            type = item.id,
                            materials = item.materials
                        }
                    }
                }
                counter = counter + 1
            else
                counter = counter + 1
            end 
        end
        if #Config.vehicleCustomisation <= pageStart then
            counter = 0
            stop = false
        end
        local text = ""
        if Config.CustomMaterials['spray'] then
            for k, v in next, Config.CustomMaterials['spray'] do
                if type(v) == 'table' then
                    text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                end
            end
            if Config.CustomMaterials['spray'].money then
                text = text .. 'Money: ' .. Config.CustomMaterials['spray'].money .. '$<br>'
            end
        end
        if not stop and counter < 5 then
            headerMenu[#headerMenu + 1] = {
                header = 'Respray',
                Config.SprayItem,
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 255,
                        materials = Config.CustomMaterials['spray']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['neon'] then
                for k, v in next, Config.CustomMaterials['neon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['neon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['neon'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Neon',
                Config.NeonItem,
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 256,
                        materials = Config.CustomMaterials['neon']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['xenon'] then
                for k, v in next, Config.CustomMaterials['xenon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['xenon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['xenon'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Xenon',
                Config.XenonItem,
                txt = text,
                params = {
                    event = "eventidkidk",
                    args = {
                        type = 257,
                        materials = Config.CustomMaterials['xenon']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['wheels'] then
                for k, v in next, Config.CustomMaterials['wheels'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['wheels'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['wheels'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Wheels',
                Config.WheelItem,
                txt = text,
                params = {
                    event = 'eventidkidk',
                    args = {
                        type = 258,
                        materials = Config.CustomMaterials['wheels']
                    }
                }
            }
            if Config.CustomMaterials['windowtint'] then
                for k, v in next, Config.CustomMaterials['windowtint'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['windowtint'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['windowtint'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Window Tint',
                icon = Config.WindowTintItem,
                txt = text,
                params = {
                    event = 'eventidkidk',
                    args = {
                        type = 260,
                        materials = Config.CustomMaterials['windowtint']
                    }
                }
            }
            if Config.CustomMaterials['TyreSmokeItem'] then
                for k, v in next, Config.CustomMaterials['TyreSmokeItem'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['TyreSmokeItem'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['TyreSmokeItem'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Tyre Smoke',
                icon = Config.TyreSmokeItem,
                txt = text,
                params = {
                    event = 'eventidkidk',
                    args = {
                        type = 261,
                        materials = Config.CustomMaterials['TyreSmokeItem']
                    }
                }
            }
            local text = ""
            if Config.CustomMaterials['extra'] then
                for k, v in next, Config.CustomMaterials['extra'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "<br>"
                    end
                end
                if Config.CustomMaterials['extra'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['extra'].money .. '$<br>'
                end
            end
            headerMenu[#headerMenu + 1] = {
                header = 'Extra',
                Config.ExtraItem,
                txt = text,
                params = {
                    event = 'eventidkidk',
                    args = {
                        type = 259,
                        materials = Config.CustomMaterials['extra']
                    }
                }
            }
            
        else
            headerMenu[#headerMenu + 1] = {
                header = 'Next Page →',
                params = {
                    event = "craft1forword",
                    args = {
                        type = currentPage
                    }
                }
            }
        end
        exports[Config.MenuFolderName]:openMenu(headerMenu)
    elseif Config.Menu == 'ox' then
        local currentPage = data.type + 1
        local options = {}
        options[#options + 1] = {
            title = '⬅ Back',
            onSelect = function()
                local args = {
                    type = currentPage
                }
                TriggerEvent('craft1back', args)
            end,
        }
        local pageStart = currentPage * 8
        local stop = false
        local counter = 0
        
        for a,item in next, Config.vehicleCustomisation do
            if counter == pageStart + 8 then
                stop = true
                break
            end
            if counter >= pageStart then
                local text = ""
                if item.materials then
                    for k, v in next, item.materials do
                        if type(v) == 'table' then
                            text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                        end
                    end
                    if item.materials.money then
                        text = text .. 'Money: ' .. item.materials.money .. '$\n'
                    end
                end
                options[#options + 1] = {
                    title = item.category,
                    description = text,
                    icon = Config.Images[item.itemname].image,
                    image = Config.Images[item.itemname].image,
                    onSelect = function()
                        local args = {
                            type = item.id,
                            materials = item.materials
                        }
                        TriggerEvent('eventidkidk', args)
                    end,
                }
                counter = counter + 1
            else
                counter = counter + 1
            end 
        end
        if #Config.vehicleCustomisation <= pageStart then
            counter = 0
            stop = false
        end
        local text = ""
        if Config.CustomMaterials['spray'] then
            for k, v in next, Config.CustomMaterials['spray'] do
                if type(v) == 'table' then
                    text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                end
            end
            if Config.CustomMaterials['spray'].money then
                text = text .. 'Money: ' .. Config.CustomMaterials['spray'].money .. '$\n'
            end
        end
        if not stop and counter < 5 then
            options[#options + 1] = {
                title = 'Respray',
                description = text,
                icon = Config.Images[Config.SprayItem].image,
                image = Config.Images[Config.SprayItem].image,
                onSelect = function()
                    local args = {
                        type = 255,
                        materials = Config.CustomMaterials['spray']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['neon'] then
                for k, v in next, Config.CustomMaterials['neon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['neon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['neon'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Neon',
                description = text,
                icon = Config.Images[Config.NeonItem].image,
                image = Config.Images[Config.NeonItem].image,
                onSelect = function()
                    local args = {
                        type = 256,
                        materials = Config.CustomMaterials['neon']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['xenon'] then
                for k, v in next, Config.CustomMaterials['xenon'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['xenon'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['xenon'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Xenon',
                description = text,
                icon = Config.Images[Config.XenonItem].image,
                image = Config.Images[Config.XenonItem].image,
                onSelect = function()
                    local args = {
                        type = 257,
                        materials = Config.CustomMaterials['xenon']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['wheels'] then
                for k, v in next, Config.CustomMaterials['wheels'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['wheels'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['wheels'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Wheels',
                description = text,
                icon = Config.Images[Config.WheelItem].image,
                image = Config.Images[Config.WheelItem].image,
                onSelect = function()
                    local args = {
                        type = 258,
                        materials = Config.CustomMaterials['wheels']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['windowtint'] then
                for k, v in next, Config.CustomMaterials['windowtint'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['windowtint'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['windowtint'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Window Tint',
                description = text,
                icon = Config.Images[Config.WindowTintItem].image,
                image = Config.Images[Config.WindowTintItem].image,
                onSelect = function()
                    local args = {
                        type = 260,
                        materials = Config.CustomMaterials['windowtint']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['tyreSmoke'] then
                for _, v in next, Config.CustomMaterials['tyreSmoke'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['tyreSmoke'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['tyreSmoke'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Tyre Smoke',
                description = text,
                icon = Config.Images[Config.TyreSmokeItem].image,
                image = Config.Images[Config.TyreSmokeItem].image,
                onSelect = function()
                    local args = {
                        type = 261,
                        materials = Config.CustomMaterials['tyreSmoke']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
            local text = ""
            if Config.CustomMaterials['extra'] then
                for k, v in next, Config.CustomMaterials['extra'] do
                    if type(v) == 'table' then
                        text = text .. '' .. v.label .. ": " .. v.amount .. "\n"
                    end
                end
                if Config.CustomMaterials['extra'].money then
                    text = text .. 'Money: ' .. Config.CustomMaterials['extra'].money .. '$\n'
                end
            end
            options[#options + 1] = {
                title = 'Extra',
                description = text,
                icon = Config.Images[Config.ExtraItem].image,
                image = Config.Images[Config.ExtraItem].image,
                onSelect = function()
                    local args = {
                        type = 259,
                        materials = Config.CustomMaterials['extra']
                    }
                    TriggerEvent('eventidkidk', args)
                end,
            }
        else
            options[#options + 1] = {
                title = 'Next Page →',
                onSelect = function()
                    local args = {
                        type = currentPage
                    }
                    TriggerEvent('craft1forword', args)
                end,
            }
        end
        lib.registerContext({
            id = 'craftingMenu_'.. counter,
            title = 'Mechanic Crafting',
            options = options
        })
        lib.showContext('craftingMenu_'.. counter)
    else
        print('unkown menu')
    end
end)

RegisterNetEvent('eventidkidk', function(data)
    local modType = data.type
    local materials = data.materials
    local enable = true
    -- for a,b in next, materials do
    --     enable = exports[Config.InventoryFolder]:HasItem(b.name, b.amount)
    -- end
    if enable then
        if tonumber(modType) == 255 then
            local good = false
            local vehColours = {}
            if Config.Menu == 'qb' then
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Colours",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Vehicle Colours",
                            name = "paintType",
                            type = "select",
                            options = {
                                { value = "0", text = "Primary Colour" },
                                { value = "1", text = "Secondary Colour"},
                                { value = "2", text = "Pearlescent Colour" },
                                { value = "3", text = "Wheel Colour" },
                                { value = "4", text = "Dash Colour" },
                                { value = "5", text = "Interior Colour" },
                            },
                        },
                        {
                            text = "Select Category",
                            name = "paintCategory",
                            type = "select",
                            options = {
                                { value = "0", text = "Classic" },
                                { value = "1", text = "Metallic"},
                                { value = "2", text = "Matte" },
                                { value = "3", text = "Metals"}
                            },
                        },
                        {
                            text = "Colour Type",
                            name = "paintID",
                            type = "text",
                            isRequired = true,
                        },
                    },
                })
                good = true
                vehColours = {
                    paintType = tonumber(dialog2['paintType']),
                    paintCategory = tonumber(dialog2['paintCategory']),
                    paintID = tonumber(dialog2['paintID'])
                }
            elseif Config.Menu == 'ox' then
                local options1 = {
                    { value = "0", label = "Primary Colour" },
                    { value = "1", label = "Secondary Colour"},
                    { value = "2", label = "Pearlescent Colour" },
                    { value = "3", label = "Wheel Colour" },
                    { value = "4", label = "Dash Colour" },
                    { value = "5", label = "Interior Colour" },
                }
                local options2 = {
                    { value = "0", label = "Classic" },
                    { value = "1", label = "Metallic"},
                    { value = "2", label = "Matte" },
                    { value = "3", label = "Metals"}
                }
                local dialog2 = lib.inputDialog('Vehicle Mechanic Colours', {
                    {type = 'select', label = 'Vehicle Colours', default = '0', options = options1},
                    {type = 'select', label = 'Select Category', default = '0', options = options2},
                    {type = 'input', label = 'Colour Type'},
                })
                if dialog2 then
                    good = true
                    vehColours = {
                        paintType = tonumber(dialog2[1]),
                        paintCategory = tonumber(dialog2[2]),
                        paintID = tonumber(dialog2[3])
                    }
                end
            else
                print('unkown menu')
            end
            if good then
                TriggerServerEvent('rho-mechainc:server:getSprayForVehicle', vehColours, materials)
            end
        elseif tonumber(modType) == 256 then
            if Config.Menu == 'qb' then
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Neon Color (R)",
                            name = "r",
                            type = "text",
                            isRequired = true,
                        },
                        {
                            text = "Neon Color (G)",
                            name = "g",
                            type = "text",
                            isRequired = true,
                        },
                        {
                            text = "Neon Color (B)",
                            name = "b",
                            type = "text",
                            isRequired = true,
                        },
                        {
                            text = "Activation Right Side",
                            name = "neonactiveR",
                            type = "select",
                            options = {
                                { value = "1", text = "True"},
                                { value = "0", text = "False"},
                            },
                            default = '0',
                        },
                        {
                            text = "Activation Left Side",
                            name = "neonactiveL",
                            type = "select",
                            options = {
                                { value = "1", text = "True"},
                                { value = "0", text = "False"},
                            },
                            default = '0',
                        },
                        {
                            text = "Activation Back Side",
                            name = "neonactiveB",
                            type = "select",
                            options = {
                                { value = "1", text = "True"},
                                { value = "0", text = "False"},
                            },
                            default = '0',
                        },
                        {
                            text = "Activation Front Side",
                            name = "neonactiveF",
                            type = "select",
                            options = {
                                { value = "1", text = "True"},
                                { value = "0", text = "False"},
                            },
                            default = '0',
                        },
                    },
                })
                if dialog2 then
                    local neonColour = {
                        activeR = tonumber(dialog2['neonactiveR']),
                        activeL = tonumber(dialog2['neonactiveL']),
                        activeB = tonumber(dialog2['neonactiveB']),
                        activeF = tonumber(dialog2['neonactiveF']),
                        neonRGB = {
                            r = tonumber(dialog2['r']),
                            g = tonumber(dialog2['g']),
                            b = tonumber(dialog2['b'])
                        }
                    }
                    TriggerServerEvent('rho-mechainc:server:getNeonMod', neonColour, materials)
                end
            elseif Config.Menu == 'ox' then
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'input', label = 'Neon Color (R)', required = true},
                    {type = 'input', label = 'Neon Color (G)', required = true},
                    {type = 'input', label = 'Neon Color (B)', required = true},
                    {type = 'select', label = 'Activation Right Side', default = '0', options = {
                        { value = "1", label = "True"},
                        { value = "0", label = "False"}}},
                    {type = 'select', label = 'Activation Left Side', default = '0', options = {
                        { value = "1", label = "True"},
                        { value = "0", label = "False"},
                    }}, 
                    {type = 'select', label = 'Activation Back Side', default = '0', options = {
                        { value = "1", label = "True"},
                        { value = "0", label = "False"},
                    }}, 
                    {type = 'select', label = 'Activation Front Side', default = '0', options = {
                        { value = "1", label = "True"},
                        { value = "0", label = "False"},
                    }}, 
                })
                if dialog2 then
                    local neonColour = {
                        activeR = tonumber(dialog2[4]),
                        activeL = tonumber(dialog2[5]),
                        activeB = tonumber(dialog2[6]),
                        activeF = tonumber(dialog2[7]),
                        neonRGB = {
                            r = tonumber(dialog2[1]),
                            g = tonumber(dialog2[2]),
                            b = tonumber(dialog2[3])
                        }
                    }
                    TriggerServerEvent('rho-mechainc:server:getNeonMod', neonColour, materials)
                end
            else
                print('unkown menu')
            end
        elseif tonumber(modType) == 257 then
            if Config.Menu == 'qb' then
                local values = {}
                for a,b in next, Config.vehicleXenonOptions.xenonColours do
                    values[#values + 1] = {
                        value = b.id,
                        text = b.name
                    }
                end
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Xenon Colour",
                            name = "xenonLight",
                            type = "select",
                            options = values,
                            default = '0',
                        },
                        {
                            text = "Xenon Activation",
                            name = "xenonactive",
                            type = "select",
                            options = {
                                { value = "1", text = "True"},
                                { value = "0", text = "False"},
                            },
                            default = '1',
                        },
                    },
                })
                local idk = false
                if tonumber(dialog2['xenonactive']) == 1 then
                    idk = true
                end
                local xenonData = {
                    xenonColour = tonumber(dialog2['xenonLight']),
                    xenonActive = idk
                }
                TriggerServerEvent('rho-mechainc:server:getXenonMod', xenonData)
            elseif Config.Menu == 'ox' then
                local values = {}
                for a,b in next, Config.vehicleXenonOptions.xenonColours do
                    values[#values + 1] = {
                        value = b.id,
                        label = b.name
                    }
                end
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'select', label = 'Xenon Colour', default = '0', options = values},
                    {type = 'select', label = 'Xenon Activation', default = '0', options = {
                        { value = "1", label = "True"},
                        { value = "0", label = "False"},
                    }},
                })
                local idk = false
                if tonumber(dialog2[2]) == 1 then
                    idk = true
                end
                local xenonData = {
                    xenonColour = tonumber(dialog2[1]),
                    xenonActive = idk
                }
                TriggerServerEvent('rho-mechainc:server:getXenonMod', xenonData)
            end
        elseif tonumber(modType) == 258 then
            if Config.Menu == 'qb' then
                local values = {}
                for a,b in next, Config.vehicleWheelOptions do
                    values[#values + 1] = {
                        value = b.id,
                        text = b.category
                    }
                end
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Wheel Category",
                            name = "wheelcat",
                            type = "select",
                            options = values,
                            default = '0',
                        },
                        {
                            text = "Wheel Category",
                            name = "wheelcustom",
                            type = "select",
                            options = {
                                { value = true, text = "True"},
                                { value = false, text = "False"},
                            },
                            default = false,
                        },
                        {
                            text = "Wheel Type",
                            name = "type",
                            type = "text",
                            isRequired = true,
                        },
                    },
                })
                local idk = false
                if tonumber(dialog2['xenonactive']) == 1 then
                    idk = true
                end
                local wheelData = {
                    wheelCat = tonumber(dialog2['wheelcat']),
                    wheelType = tonumber(dialog2['type']),
                    isCustom = dialog2['wheelcustom']
                }
                TriggerServerEvent('rho-mechainc:server:getWheelMod', wheelData)
            elseif Config.Menu == 'ox' then
                local values = {}
                for a,b in next, Config.vehicleWheelOptions do
                    values[#values + 1] = {
                        value = b.id,
                        label = b.category
                    }
                end
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'select', label = 'Wheel Category', default = '0', options = values},
                    {type = 'select', label = 'Xenon Activation', default = false, options = {
                        { value = true, label = "True"},
                        { value = false, label = "False"},
                    }},
                    {type = 'input', label = 'Wheel Type', required = true},
                })
                local wheelData = {
                    wheelCat = tonumber(dialog2[1]),
                    wheelType = tonumber(dialog2[3]),
                    isCustom = dialog2[2]
                }
                TriggerServerEvent('rho-mechainc:server:getWheelMod', wheelData)
            end
        elseif tonumber(modType) == 259 then
            if Config.Menu == 'qb' then
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Extra Number",
                            name = "extranum",
                            type = "text",
                            isRequired = true,
                        },
                        {
                            text = "Extra Activation",
                            name = "extraactive",
                            type = "select",
                            options = {
                                { value = 0, text = "True"},
                                { value = 1, text = "False"},
                            },
                            default = 0,
                        },
                    },
                })
                local wheelData = {
                    extraID = tonumber(dialog2['extranum']),
                    active = tonumber(dialog2['extraactive'])
                }
                TriggerServerEvent('rho-mechainc:server:getExtraMod', wheelData)
            elseif Config.Menu == 'ox' then
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'input', label = 'Extra Number', required = true},
                    {type = 'select', label = 'Extra Activation', default = 0, options = {
                        { value = 0, label = "True"},
                        { value = 1, label = "False"},
                    }},  
                })
                local wheelData = {
                    extraID = tonumber(dialog2[1]),
                    active = tonumber(dialog2[2])
                }
                TriggerServerEvent('rho-mechainc:server:getExtraMod', wheelData)
            end
        elseif tonumber(modType) == 260 then
            if Config.Menu == 'qb' then
                local newOptions = {}
                for a,b in next, Config.vehicleWindowTintOptions do
                    newOptions[#newOptions+1] = {
                        value = b.id,
                        text = b.name
                    }
                end
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Window Tint Selection",
                            name = "windowtint",
                            type = "select",
                            options = newOptions,
                            default = 0,
                        },
                    },
                })
                local wheelData = {
                    windowTint = tonumber(dialog2['windowtint']),
                }
                TriggerServerEvent('rho-mechainc:server:getWindowTint', wheelData)
            elseif Config.Menu == 'ox' then
                local newOptions = {}
                for a,b in next, Config.vehicleWindowTintOptions do
                    newOptions[#newOptions+1] = {
                        value = b.id,
                        label = b.name
                    }
                end
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'select', label = 'Window Tint Selection', default = 0, options = newOptions},  
                })
                local wheelData = {
                    windowTint = tonumber(dialog2[1]),
                }
                TriggerServerEvent('rho-mechainc:server:getWindowTint', wheelData)
            end
        elseif tonumber(modType) == 261 then
            if Config.Menu == 'qb' then
                local newOptions = {}
                for a,b in next, Config.vehicleTyreSmokeOptions do
                    newOptions[#newOptions+1] = {
                        value = a,
                        text = b.name
                    }
                end
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Upgrades",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Tyre Color Selection",
                            name = "tyreSmoke",
                            type = "select",
                            options = newOptions,
                        },
                    },
                })
                local wheelData = {
                    tyreSmokeR = tonumber(Config.vehicleTyreSmokeOptions[dialog2['tyreSmoke']].r),
                    tyreSmokeG = tonumber(Config.vehicleTyreSmokeOptions[dialog2['tyreSmoke']].g),
                    tyreSmokeB = tonumber(Config.vehicleTyreSmokeOptions[dialog2['tyreSmoke']].b),
                }
                TriggerServerEvent('rho-mechainc:server:getTyreSmoke', wheelData)
            elseif Config.Menu == 'ox' then
                local newOptions = {}
                for a,b in next, Config.vehicleTyreSmokeOptions do
                    newOptions[#newOptions+1] = {
                        value = a,
                        label = b.name
                    }
                end
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'select', label = 'Window Tint Selection', default = 0, options = newOptions},
                })
                local wheelData = {
                    tyreSmokeR = tonumber(Config.vehicleTyreSmokeOptions[dialog2[1]].r),
                    tyreSmokeG = tonumber(Config.vehicleTyreSmokeOptions[dialog2[1]].g),
                    tyreSmokeB = tonumber(Config.vehicleTyreSmokeOptions[dialog2[1]].b),
                }
                TriggerServerEvent('rho-mechainc:server:getTyreSmoke', wheelData)
            end
        elseif modType == 18 then
            if Config.Menu == 'qb' then
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Mod Type",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Turbo Category",
                            name = "turbo",
                            type = "select",
                            options = {{value = 1, text = 'enable'}, {value = 0, text = 'disable'}},
                            default = '1',
                        },
                    },
                })
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2['turbo'])
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            elseif Config.Menu == 'ox' then
                local dialog2 = lib.inputDialog('ehicle Mechanic Mod Type', {
                    {type = 'select', label = 'Turbo Category', default = '1', options = {{value = 1, label = 'enable'}, {value = 0, label = 'disable'}},},
                })
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2[1])
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            end
        elseif modType == 48 then
            if Config.Menu == 'qb' then
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Mod Type",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Mod Type",
                            name = "modID",
                            type = "text",
                            isRequired = true,
                        },
                        {
                            text = "Custom",
                            name = "isCustom",
                            type = "select",
                            options = {{value = true, text = 'True'}, {value = false, text = 'False'}},
                            default = false,
                        },
                    },
                })
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2['modID']),
                    isCustom = dialog2['isCustom']
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            elseif Config.Menu == 'ox' then
                local dialog2 = lib.inputDialog('ehicle Mechanic Mod Type', {
                    {type = 'input', label = 'Mod Type', required = true}, 
                    {type = 'select', label = 'Custom', default = false, options = {{value = true, label = 'True'}, {value = false, label = 'False'}},},
                })
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2[1]),
                    isCustom = dialog2[2]
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            end
        else
            if Config.Menu == 'qb' then
                local index = getCategoryIndexById(modType, Config.vehicleCustomisation)
                local dialog2 = exports['qb-input']:ShowInput({
                    header = "Vehicle Mechanic Mod Type",
                    submitText = "Next",
                    inputs = {
                        {
                            text = "Mod Type",
                            name = "modID",
                            type = "text",
                            isRequired = true,
                        },
                    },
                })
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2['modID'])
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            elseif Config.Menu == 'ox' then
                local dialog2 = lib.inputDialog('Vehicle Mechanic Upgrades', {
                    {type = 'input', label = 'Mod Type', required = true}, 
                })
                local index = getCategoryIndexById(modType, Config.vehicleCustomisation)
                local vehUpgrade = {
                    categoryID = tonumber(modType),
                    modID = tonumber(dialog2[1])
                }
                TriggerServerEvent('rho-mechainc:server:getModByID', vehUpgrade, materials)
            end
        end
    else
        QBCore.Functions.Notify(Config.Text.errors.missingItem, 'error', 5000)
    end
end)