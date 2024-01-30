QBCore = exports['qb-core']:GetCoreObject()


function getCategoryIndexById(id, list)
    for a,b in next, list do
        if b.id == tonumber(id) then
            return a
        end
    end
end

function combineMaterialAmounts(list)
    local combinedMaterials = {}
    for _, items in next, list do
        for b, item in pairs(items) do
            if b == 'type' then
                local newItem = item
                if item == 'mod' then
                    newItem = 'mods'
                elseif item == 'livery' then
                    newItem = 'mods'
                elseif item == 'plate' then
                    newItem = 'mods'
                elseif item == 'color' then
                    newItem = 'spray'
                elseif item == 'wheel' then
                    newItem = 'wheels'
                elseif item == 'neonColor' then
                    newItem = 'neon'
                elseif item == 'xenonColor' then
                    newItem = 'xenon'
                end
                for _, material in pairs(Config.CustomMaterials[newItem]) do
                    local materialName = material.name
                    local materialAmount = material.amount
                    if combinedMaterials[materialName] then
                        combinedMaterials[materialName] = combinedMaterials[materialName] + materialAmount
                    else
                        combinedMaterials[materialName] = materialAmount
                    end
                end
            end
        end
    end
    return sortTableByAmount(combinedMaterials)
end

function sortTableByAmount(inputTable)
    local sortedTable = {}
    
    for name, amount in pairs(inputTable) do
        table.insert(sortedTable, { name = name, amount = amount })
    end
    
    table.sort(sortedTable, function(a, b) return a.amount > b.amount end)
    
    return sortedTable
end

RegisterNetEvent('rho-mechanic:activeReceiptMenu', function(carInfo)
    local headerMenu = {}
    local options = {}
    carInfo.veh = nil
    local veh = nil
    local plate = carInfo.licensePlate
    local materialsList = combineMaterialAmounts(carInfo.myCar)
    local newText = ""
    if Config.Menu == 'qb' then
        for a,b in next, materialsList do
            newText = newText .. b.name .. ': ' .. b.amount .. '</br>'
        end
    elseif Config.Menu == 'ox' then
        for a,b in next, materialsList do
            newText = newText .. b.name .. ': ' .. b.amount .. '\n'
        end
    end
    local vehicles = QBCore.Functions.GetVehicles()
    for _, vehicle in next, vehicles do
        if QBCore.Functions.GetPlate(vehicle) == plate then
            veh = vehicle
        end
    end
    if Config.Menu == 'qb' then
        local vehName = GetLabelText(GetMakeNameFromVehicleModel(GetEntityModel(veh))) .. ' ' .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh))) .. '</br>Plate: ' .. plate
        if GetLabelText(GetMakeNameFromVehicleModel(GetEntityModel(veh))) == 'NULL' then
            vehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh))) .. '</br>Plate: ' .. plate
        end
        headerMenu[#headerMenu + 1] = {
            header = "Car Menu",
            txt = vehName,
            isMenuHeader = true, -- Set to true to make a nonclickable title
        }
        headerMenu[#headerMenu + 1] = {
            header = 'Materials',
            txt = newText,
            isMenuHeader = true
        }
    elseif Config.Menu == 'ox' then
        options[#options + 1] = {
            title = 'Plate',
            description = plate,
        }
        options[#options + 1] = {
            title = 'Materials',
            description = newText,
            -- disabled = true
        }
    end
    carInfo.veh = veh
    if veh then
        SetVehicleModKit(veh, 0)
        for i, upgrade in next, carInfo.myCar do
            if upgrade.type == 'mod' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'livery' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                    livery = upgrade.livery,
                    custom = true
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Livery',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Livery',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                        args = newCarInfo
                    }
                end
            elseif upgrade.type == 'engine' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'brakes' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'suspension' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'turbo' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'gear' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'armor' then
                local place = Config.vehicleCustomisation[getCategoryIndexById(upgrade.categoryID, Config.vehicleCustomisation)]
                if place.id == upgrade.categoryID then
                    newCarInfo = {
                        carInfo = carInfo,
                        index = i,
                        category = place.category
                    }
                    if Config.Menu == 'qb' then
                        headerMenu[#headerMenu+1] = {
                            header = place.category,
                            params = {
                                event = 'rho-mechainc:openNewMenu',
                                args = newCarInfo
                            }
                        }
                    elseif Config.Menu == 'ox' then
                        options[#options + 1] = {
                            title = place.category,
                            arrow = true,
                            icon = 'bars',
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    end
                end
            elseif upgrade.type == 'windowtint' then
                    local place = Config.vehicleWindowTintOptions[getCategoryIndexById(upgrade.categoryID, Config.vehicleWindowTintOptions)]
                    if place.id == upgrade.categoryID then
                        newCarInfo = {
                            carInfo = carInfo,
                            index = i,
                            category = place.name
                        }
                        if Config.Menu == 'qb' then
                            headerMenu[#headerMenu+1] = {
                                header = 'Window Tint',
                                params = {
                                    event = 'rho-mechainc:openNewMenu',
                                    args = newCarInfo
                                }
                            }
                        elseif Config.Menu == 'ox' then
                            options[#options + 1] = {
                                title = 'Window Tint',
                                arrow = true,
                                icon = 'bars',
                                event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                            }
                        end
                    end
            elseif upgrade.type == 'color' then
                for a,b in next, Config.vehicleResprayOptions[upgrade.categoryID + 1].colours do
                    if b.id == upgrade.colorID then
                        newCarInfo = {
                            carInfo = carInfo,
                            index = i,
                            category = b.name,
                            other = a
                        }
                        if Config.Menu == 'qb' then
                            headerMenu[#headerMenu+1] = {
                                header = 'Respray',
                                params = {
                                    event = 'rho-mechainc:openNewMenu',
                                    args = newCarInfo
                                }
                            }
                        elseif Config.Menu == 'ox' then
                            options[#options + 1] = {
                                title = 'Respray',
                                arrow = true,
                                icon = 'bars',
                                event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                            }
                        end
                    end
                end
            elseif upgrade.type == 'wheel' then
                for a,b in next, Config.vehicleWheelOptions do
                    if b.id == upgrade.wheelType then
                        local label = GetModTextLabel(veh, upgrade.categoryID, upgrade.wheelID)
                        local modName = GetLabelText(label)
                        newCarInfo = {
                            carInfo = carInfo,
                            index = i,
                            category = b.category,
                            other = a
                        }
                        if Config.Menu == 'qb' then
                            headerMenu[#headerMenu+1] = {
                                header = 'Wheels',
                                params = {
                                    event = 'rho-mechainc:openNewMenu',
                                    args = newCarInfo
                                }
                            }
                        elseif Config.Menu == 'ox' then
                            options[#options + 1] = {
                                title = 'Wheels',
                                arrow = true,
                                icon = 'bars',
                                event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                            }
                        end
                    end
                end
            elseif upgrade.type == 'tyreSmoke' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Tyre Smokes',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Tyre Smokes',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                        args = newCarInfo
                    }
                end
            elseif upgrade.type == 'neon' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Neon Activation',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Neon Activation',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            elseif upgrade.type == 'extra' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Extra Info',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Extra Info',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            elseif upgrade.type == 'neonColor' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Neon Colours',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Neon Colours',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            elseif upgrade.type == 'xenon' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Xenon Activation',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Xenon Activation',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            elseif upgrade.type == 'xenonColor' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Xenon Colour',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Xenon Colour',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            elseif upgrade.type == 'plate' then
                newCarInfo = {
                    carInfo = carInfo,
                    index = i,
                }
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        header = 'Plate',
                        params = {
                            event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                        }
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Plate',
                        arrow = true,
                        icon = 'bars',
                        event = 'rho-mechainc:openNewMenu',
                            args = newCarInfo
                    }
                end
            end
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                header = "⬅ Exit",
                params = {
                    event = Config.MenuEventPrefix .. ':closeMenu',
                }
            }
        end
        if Config.Menu == 'qb' then
            exports[Config.MenuFolderName]:openMenu(headerMenu)
        elseif Config.Menu == 'ox' then
            lib.registerContext({
                id = 'receiptMenu',
                title = 'Car Menu ' .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh))),
                options = options
            })
            lib.showContext('receiptMenu')
        end
    else
        QBCore.Functions.Notify('You are too far from the repaired vehicle', 'error', 5000)
    end
end)


RegisterNetEvent('rho-mechainc:openNewMenu', function(carInfo)
    local index = carInfo.index
    local vehInfo = carInfo.carInfo.myCar
    local veh = carInfo.carInfo.veh
    local headerMenu = {}
    local options = {}

    if Config.Menu == 'qb' then
        headerMenu[#headerMenu + 1] = {
            header = "| Car Menu |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        }
    end
    if vehInfo[index].type == 'windowtint' then
        local newName = 'error'
        for _,b in next, Config.vehicleWindowTintOptions do
            if b.id == vehInfo[index].categoryID then
                newName = b.name
            end
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header = carInfo.category,
                txt = 'Category: Window Tint | Type: ' .. newName,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Plate',
                description = 'Category: Window Tint | Type: ' .. newName,
            }
        end
    elseif vehInfo[index].type == 'color' then
        local main = ""
        if vehInfo[index].colorType == 0 then
            main = 'Primary Colour'
        elseif vehInfo[index].colorType == 1 then
            main = 'Secondary Colour'
        elseif vehInfo[index].colorType == 2 then
            main = 'Pearlescent Colour'
        elseif vehInfo[index].colorType == 3 then
            main = 'Wheel Colour'
        elseif vehInfo[index].colorType == 4 then
            main = 'Dash Colour'
        elseif vehInfo[index].colorType == 0 then
            main = 'Interior Colour'
        end
        local category = ""
        if vehInfo[index].categoryID == 0 then
            category = 'Classic'
        elseif vehInfo[index].categoryID == 1 then
            category = 'Metallic'
        elseif vehInfo[index].categoryID == 2 then
            category = 'Matte'
        elseif vehInfo[index].categoryID == 3 then
            category = 'Metals'
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header = main .. ' | ' .. Config.vehicleResprayOptions[vehInfo[index].categoryID + 1].colours[carInfo.other].name,
                txt = 'Category: ' .. category .. ' | Type: ' .. vehInfo[index].colorID,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = main .. ' | ' .. Config.vehicleResprayOptions[vehInfo[index].categoryID + 1].colours[carInfo.other].name,
                description = 'Category: ' .. category .. ' | Type: ' .. vehInfo[index].colorID,
            }
        end
    elseif vehInfo[index].type == 'extra' then
        local active = 'False'
        if not vehInfo[index].modID then
            active = 'True'
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header =  'Extra | Option ' .. vehInfo[index].categoryID,
                txt = 'Extra ' .. vehInfo[index].categoryID .. ' | Activation: ' .. active,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Extra | Option ' .. vehInfo[index].categoryID,
                description = 'Extra ' .. vehInfo[index].categoryID .. ' | Activation: ' .. active,
            }
        end
    elseif vehInfo[index].type == 'wheel' then
        if vehInfo[index].wheelID > 0 then
            if vehInfo[index].wheelType then
                SetVehicleWheelType(veh, vehInfo[index].wheelType)
            end
            local custom = 'True'
            if not vehInfo[index].allData.doesHaveCustomWheels then
                custom = 'False'
            end
            local wheelName = GetLabelText(GetModTextLabel(veh, 23, wheel))
            if Config.Menu == 'qb' then
                headerMenu[#headerMenu+1] = {
                    isMenuHeader = true,
                    header =  'Wheels | ' .. GetLabelText(GetModTextLabel(veh, vehInfo[index].categoryID, vehInfo[index].wheelID)),
                    txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].wheelID .. ' | Custom: ' .. custom,
                }
            elseif Config.Menu == 'ox' then
                options[#options + 1] = {
                    title = 'Wheels | ' .. GetLabelText(GetModTextLabel(veh, vehInfo[index].categoryID, vehInfo[index].wheelID)),
                    description = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].wheelID .. ' | Custom: ' .. custom,
                }
            end
        else
            if Config.Menu == 'qb' then
                headerMenu[#headerMenu+1] = {
                    isMenuHeader = true,
                    header =  'Wheels | ' .. carInfo.category .. ' Stock',
                    txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].wheelID .. ' | Custom: ' .. custom,
                }
            elseif Config.Menu == 'ox' then
                options[#options + 1] = {
                    title = 'Wheels | ' .. carInfo.category .. ' Stock',
                    description = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].wheelID .. ' | Custom: ' .. custom,
                }
            end
        end
    elseif vehInfo[index].type == 'neon' then
        local main = ""
        if vehInfo[index].categoryID == 0 then
            main = 'Left Neon'
        elseif vehInfo[index].categoryID == 1 then
            main = 'Right Neon'
        elseif vehInfo[index].categoryID == 2 then
            main = 'Front Neon'
        elseif vehInfo[index].categoryID == 3 then
            main = 'Rear Neon'
        end
        local active = 'False'
        if vehInfo[index].neonID == 1 then
            active = 'True'
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header =  'Neon Activatoin',
                txt = 'Side: ' .. main .. ' | Active: ' .. active,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Neon Activatoin',
                description = 'Side: ' .. main .. ' | Active: ' .. active,
            }
        end
    elseif vehInfo[index].type == 'tyreSmoke' then
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header =  'Tyre Smoke',
                txt = 'R: ' .. vehInfo[index].r  .. ' | G: ' .. vehInfo[index].g .. ' | B: ' .. vehInfo[index].b,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Tyre Smoke',
                description = 'R: ' .. vehInfo[index].r  .. ' | G: ' .. vehInfo[index].g .. ' | B: ' .. vehInfo[index].b,
            }
        end
    elseif vehInfo[index].type == 'neonColor' then
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header =  'Neon Colours',
                txt = 'R: ' .. vehInfo[index].r  .. ' | G: ' .. vehInfo[index].g .. ' | B: ' .. vehInfo[index].b,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Neon Colours',
                description = 'R: ' .. vehInfo[index].r  .. ' | G: ' .. vehInfo[index].g .. ' | B: ' .. vehInfo[index].b,
            }
        end
    elseif vehInfo[index].type == 'xenon' then
        local active = 'False'
        if vehInfo[index].state == 1 then
            active = 'True'
        end
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header =  'Xenon Activatoin',
                txt = 'Active: ' .. active,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Xenon Activatoin',
                description = 'Active: ' .. active,
            }
        end
    elseif vehInfo[index].type == 'xenonColor' then
        for a,b in next, Config.vehicleXenonOptions.xenonColours do
            if b.id == vehInfo[index].color then
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header =  'Xenon Colours',
                        txt = 'Colour: ' .. b.name,
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = 'Xenon Colours',
                        description = 'Colour: ' .. b.name,
                    }
                end
            end
        end
    elseif vehInfo[index].type == 'plate' then
        local plateTypes = {
            "Blue on White #1",
            "Yellow on Black",
            "Yellow on Blue",
            "Blue on White #2",
            "Blue on White #3",
            "North Yankton",
        }
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header = plateTypes[vehInfo[index].plate + 1],
                txt = 'Category: Plate | Type: ' .. vehInfo[index].plate,
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = plateTypes[vehInfo[index].plate + 1],
                description = 'Category: Plate | Type: ' .. vehInfo[index].plate,
            }
        end
    -- elseif vehInfo[index].type == 'engine' then
    --     headerMenu[#headerMenu+1] = {
    --         isMenuHeader = true,
    --         header = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
    --         txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
    --     }
    -- elseif vehInfo[index].type == 'brakes' then
    --     headerMenu[#headerMenu+1] = {
    --         isMenuHeader = true,
    --         header = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
    --         txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
    --     }
    -- elseif vehInfo[index].type == 'gear' then
    --     headerMenu[#headerMenu+1] = {
    --         isMenuHeader = true,
    --         header = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
    --         txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
    --     }
    -- elseif vehInfo[index].type == 'armor' then
    --     headerMenu[#headerMenu+1] = {
    --         isMenuHeader = true,
    --         header = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
    --         txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
    --     }
    elseif vehInfo[index].type == 'livery' then
        if Config.Menu == 'qb' then
            headerMenu[#headerMenu+1] = {
                isMenuHeader = true,
                header = 'Livery',
                txt = 'Category: Livery | Type: ' .. vehInfo[index].livery .. ' | Custom: True',
            }
        elseif Config.Menu == 'ox' then
            options[#options + 1] = {
                title = 'Livery',
                description = 'Category: Livery | Type: ' .. vehInfo[index].livery .. ' | Custom: True',
            }
        end
    else
        if GetLabelText(GetModTextLabel(veh, vehInfo[index].categoryID, vehInfo[index].modID)) == 'NULL' then
            if vehInfo[index].categoryID == 18 then
                local active = 'False | Type: Disable'
                if vehInfo[index].modID + 1 == 1 then
                    active = 'True | Type: Enable'
                end
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header = carInfo.category,
                        txt = 'Activation: ' .. active,
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = carInfo.category,
                        description = 'Activation: ' .. active,
                    }
                end
            elseif vehInfo[index].categoryID == 14 then
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header = carInfo.category,
                        txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = carInfo.category,
                        description = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                end
            else
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
                        txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = carInfo.category .. ' ' .. vehInfo[index].modID + 1,
                        description = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                end
            end
        else
            if vehInfo[index].categoryID == 48 then
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header = carInfo.category,
                        txt = 'Category: Livery | Type: ' .. vehInfo[index].modID .. ' | Custom: False',
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = carInfo.category,
                        description = 'Category: Livery | Type: ' .. vehInfo[index].modID .. ' | Custom: False',
                    }
                end
            else
                if Config.Menu == 'qb' then
                    headerMenu[#headerMenu+1] = {
                        isMenuHeader = true,
                        header = GetLabelText(GetModTextLabel(veh, vehInfo[index].categoryID, vehInfo[index].modID)),
                        txt = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                elseif Config.Menu == 'ox' then
                    options[#options + 1] = {
                        title = GetLabelText(GetModTextLabel(veh, vehInfo[index].categoryID, vehInfo[index].modID)),
                        description = 'Category: ' .. carInfo.category .. ' | Type: ' .. vehInfo[index].modID,
                    }
                end
            end
        end
    end
    if Config.Menu == 'qb' then
        headerMenu[#headerMenu+1] = {
            header = "⬅ BACK",
            params = {
                event = 'rho-mechanic:activeReceiptMenu',
                args = carInfo.carInfo           
            }
        }
    elseif Config.Menu == 'ox' then
        options[#options + 1] = {
            title = "⬅ BACK",
            onSelect = function()
                TriggerEvent('rho-mechanic:activeReceiptMenu', carInfo.carInfo)
            end
        }
    end
    
    if Config.Menu == 'qb' then
        exports[Config.MenuFolderName]:openMenu(headerMenu)
    elseif Config.Menu == 'ox' then
        lib.registerContext({
            id = 'receiptActive2',
            title = '| Car Menu |',
            options = options
        })
        lib.showContext('receiptActive2')
    end
end)

function SprayEffects()
    local dict = "scr_recartheft"
    local name = "scr_wheel_burnout"
    
    local ped = PlayerPedId()
    local fwd = GetEntityForwardVector(ped)
    local coords = GetEntityCoords(ped) + fwd * 0.5 + vector3(0.0, 0.0, -0.5)

	RequestNamedPtfxAsset(dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
	end

	local pointers = {}
    
    -- local playerGang = QBCore.Functions.GetPlayerData().gang.name
    local color = {r = 0, g = 0, b = 0}
    local heading = GetEntityHeading(ped)

    UseParticleFxAssetNextCall(dict)
    SetParticleFxNonLoopedColour(color.r / 255, color.g / 255, color.b / 255)
    SetParticleFxNonLoopedAlpha(1.0)
    local ptr = StartNetworkedParticleFxNonLoopedAtCoord(
        name, 
        coords.x, coords.y, coords.z + 1.0, 
        0.0, 0.0, heading, 
        0.7, 
        0.0, 0.0, 0.0
    )
    RemoveNamedPtfxAsset(dict)
end

RegisterNetEvent('rho-mechanic:client:changeVehColour', function(vehColourData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if vehicle ~= nil and vehicle ~= 0 then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
            -- local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
            -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
            TriggerServerEvent('rho-mechanic:server:removeTheSpray', slot)
            active = true
            local canPos = vector3(0.08, 0.001, -0.06)
            local canRot = vector3(33.0, 38.0, 0.0)
            Citizen.CreateThread(function()
                Wait(2000)
                while active do
                    SprayEffects()
                    Wait(5000)
                end
            end)
            QBCore.Functions.Progressbar("vehColour", "Changing Vehicle Colour", 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                anim = "weed_spraybottle_crouch_spraying_03_inspector",
                flags = 1,
            }, {
                model = "ng_proc_spraycan01b",
                bone = 57005,
                coords = { x = canPos.x,y = canPos.y,z = canPos.z },
                rotation = { canRot.x, canRot.y, canRot.z },
            }, {}, function()
                active = false
                ClearPedTasksImmediately(PlayerPedId())
                local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
                local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
                local paintType = vehColourData.paintType
                local paintCategory = vehColourData.paintCategory
                local paintID = vehColourData.paintID

                if paintType == 0 then -- Primary Colour
                    if paintCategory == 1 then --Metallic Paint
                        SetVehicleColours(vehicle, paintID, vehSecondaryColour)
                        SetVehicleExtraColours(vehicle, paintID, vehWheelColour)
                        -- originalPrimaryColour = paintID
                    else
                        SetVehicleColours(vehicle, paintID, vehSecondaryColour)
                        -- originalPrimaryColour = paintID
                    end
                elseif paintType == 1 then --Secondary Colour
                    SetVehicleColours(vehicle, vehPrimaryColour, paintID)
                    -- originalSecondaryColour = paintID
                elseif paintType == 2 then --Pearlescent Colour
                    SetVehicleExtraColours(vehicle, paintID, vehWheelColour)
                    -- originalPearlescentColour = paintID
                elseif paintType == 3 then --Wheel Colour
                    SetVehicleExtraColours(vehicle, vehPearlescentColour, paintID)
                    -- originalWheelColour = paintID
                elseif paintType == 4 then --Dash Colour
                    SetVehicleDashboardColour(vehicle, paintID)
                    -- originalDashColour = paintID
                elseif paintType == 5 then --Interior Colour
                    SetVehicleInteriorColour(vehicle, paintID)
                    -- originalInterColour = paintID
                end
                local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                QBCore.Functions.Notify(Config.Text.success.colorUpgrade, "success", 5000)
            end, function()
                active = false
            end, 'spraycan')
            -- end
        end
    end
end)

RegisterNetEvent('rho-mechanic:client:changeXenonColour', function(vehColourData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                    if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                        TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                        QBCore.Functions.Progressbar("vehColour", "Changing Vehicle Colour", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_player",
                            flags = 17,
                        }, {}, {}, function() -- Done
                            ClearPedTasksImmediately(PlayerPedId())
                            local colour = vehColourData.xenonColour
                            local state = vehColourData.xenonActive
                            SetVehicleHeadlightsColour(vehicle, colour)
                            ToggleVehicleMod(vehicle, 22, state)
                            local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                            TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                            QBCore.Functions.Notify(Config.Text.success.xenonUpgrade, "success", 5000)
                        end, function()
                            print('')
                        end, 'xenon')
                    else
                        QBCore.Functions.Notify(Config.Text.errors.front, 'error')
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

function IsBackEngine(vehModel)
    for _, model in pairs(Config.BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

function ToggleHood(vehicle, isOpen)
    if (IsBackEngine(GetEntityModel(vehicle))) then
        if isOpen then
            SetVehicleDoorOpen(vehicle, 5, false, false)
        else
            SetVehicleDoorShut(vehicle, 5, false, false)
        end
    else
        if isOpen then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        else
            SetVehicleDoorShut(vehicle, 4, false, false)
        end
    end
end

RegisterNetEvent('rho-mechanic:client:changeVehMod', function(vehMods, itemName, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                local frontMods = {1, 6, 7, 11, 12, 13, 18, 39, 40}
                local hoodUpsMods = {7, 11, 12, 13, 18, 39, 40}
                local notNeed = {3, 5, 10, 15, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 41, 42, 43, 44, 45, 46, 48}
                local need = false
                local front = false
                local closeEnough = false
                local hoodUp = false
                for a,b in next, notNeed do
                    if vehMods.categoryID == b then
                        need = true
                    end
                end
                for a,b in next, hoodUpsMods do
                    if vehMods.categoryID == b then
                        hoodUp = true
                    end
                end
                for a,b in next, frontMods do
                    if vehMods.categoryID == b then
                        front = true
                        break
                    end
                end
                if not need then
                    if front then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            closeEnough = true
                        end
                    else
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            closeEnough = true
                        end
                    end
                else
                    closeEnough = true
                end
                if closeEnough then
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        if GetVehicleBodyHealth(vehicle) < 1000.0 then
                            QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                        else
                            if hoodUp then
                                ToggleHood(vehicle, true)
                            end
                            TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                            QBCore.Functions.Progressbar("vehColour", "Changing Vehicle Mod", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 17,
                            }, {}, {}, function() -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                local categoryID = vehMods.categoryID
                                local modID = vehMods.modID
                                if tonumber(categoryID) == 48 then
                                    if vehMods.isCustom then
                                        SetVehicleLivery(vehicle, modID)
                                    else
                                        SetVehicleMod(vehicle, categoryID, modID)
                                    end
                                else 
                                    SetVehicleMod(vehicle, categoryID, modID)
                                end
                                local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                                TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                                QBCore.Functions.Notify(Config.Text.success.modUpgrade, "success", 5000)
                                ToggleHood(vehicle, false)
                            end, function()
                                print('')
                            end, itemName)
                        end
                    end
                else
                    if front then
                        QBCore.Functions.Notify(Config.Text.errors.front, 'error', 5000)
                    else
                        QBCore.Functions.Notify(Config.Text.errors.back, 'error', 5000)
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:changeVehWindowTint', function(windowTintData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    if GetVehicleBodyHealth(vehicle) < 1000.0 then
                        QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                    else
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                    TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                    QBCore.Functions.Progressbar("vehExtra", "Installing Window Tint", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 17,
                    }, {}, {}, function() -- Done
                        ClearPedTasksImmediately(PlayerPedId())
                        SetVehicleModKit(vehicle, 0)
                        SetVehicleWindowTint(vehicle, tonumber(windowTintData.windowTint))
                        local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                        TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                        QBCore.Functions.Notify(Config.Text.success.windowTintUpgrade, "success", 5000)
                    end, function()
                        print('')
                    end)
                    -- end
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:changeVehExtra', function(extraData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    if GetVehicleBodyHealth(vehicle) < 1000.0 then
                        QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                    else
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                    TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                    QBCore.Functions.Progressbar("vehExtra", "Installing extra", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 17,
                    }, {}, {}, function() -- Done
                        ClearPedTasksImmediately(PlayerPedId())
                        SetVehicleExtra(vehicle, tonumber(extraData.extraID), tonumber(extraData.active))
                        SetVehiclePetrolTankHealth(vehicle,4000.0)
                        local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                        TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                        QBCore.Functions.Notify(Config.Text.success.extraUpgrade, "success", 5000)
                    end, function()
                        print('')
                    end, 'extra')
                    -- end
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:changeTyreSmoke', function(tyreData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    if GetVehicleBodyHealth(vehicle) < 1000.0 then
                        QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                    else
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                    TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                    QBCore.Functions.Progressbar("vehSmoke", "Installing smoke", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 17,
                    }, {}, {}, function() -- Done
                        ClearPedTasksImmediately(PlayerPedId())
                        ToggleVehicleMod(vehicle, 20, true)
                        SetVehicleTyreSmokeColor(vehicle, tyreData.tyreSmokeR, tyreData.tyreSmokeR, tyreData.tyreSmokeB)
                        local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                        TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                        QBCore.Functions.Notify(Config.Text.success.tyreSmokeUpgrade, "success", 5000)
                    end, function()
                        print('')
                    end)
                    -- end
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:changeVehWheel', function(wheelData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    if GetVehicleBodyHealth(vehicle) < 1000.0 then
                        QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                    else
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                    TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                    QBCore.Functions.Progressbar("vehColour", "Changing Vehicle Wheels", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 17,
                    }, {}, {}, function() -- Done
                        ClearPedTasksImmediately(PlayerPedId())
                        SetVehicleWheelType(vehicle, wheelData.wheelCat)
                        SetVehicleMod(vehicle, 23, wheelData.wheelType, wheelData.isCustom)
                        if GetVehicleClass(vehicle) == 8 then --Motorcycle
                            SetVehicleMod(vehicle, 24, wheelData.wheelType, wheelData.isCustom)
                        end
                        local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                        TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                        QBCore.Functions.Notify(Config.Text.success.wheelUpgrade, "success", 5000)
                    end, function()
                        print('')
                    end, 'wheel')
                    -- end
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:changeVehNeonColour', function(neonData, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    QBCore.Functions.TriggerCallback("qb-customs:server:canUpgradeThisCar", function(result)
        if result then
            if vehicle ~= nil and vehicle ~= 0 then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local vehpos = GetEntityCoords(vehicle)
                if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                    if GetVehicleBodyHealth(vehicle) < 1000.0 then
                        QBCore.Functions.Notify(Config.Text.errors.dmgveh, "error", 5000)
                    else
                    local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        -- if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            TriggerServerEvent('rho-mechanic:server:removeTheMod', slot)
                            QBCore.Functions.Progressbar("vehColour", "Changing Vehicle Mod", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 17,
                            }, {}, {}, function() -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                local colour = {
                                    r = neonData.neonRGB.r,
                                    g = neonData.neonRGB.g,
                                    b = neonData.neonRGB.b
                                }
                                SetVehicleNeonLightEnabled(vehicle, 0, neonData.activeL)
                                SetVehicleNeonLightEnabled(vehicle, 1, neonData.activeR)
                                SetVehicleNeonLightEnabled(vehicle, 2, neonData.activeF)
                                SetVehicleNeonLightEnabled(vehicle, 3, neonData.neonactiveB)

                                SetVehicleNeonLightsColour(vehicle, colour.r, colour.g, colour.b)
                                local myCar = QBCore.Functions.GetVehicleProperties(vehicle)
                                TriggerServerEvent('qb-customs:server:updateVehicle', myCar)
                                QBCore.Functions.Notify(Config.Text.success.neonUpgrade, "success", 5000)
                            end, function()
                                print('')
                            end, 'neon')
                        -- end
                    end
                end
            end
        else
            QBCore.Functions.Notify(Config.Text.errors.unknownveh, 'error')
        end
    end, GetVehicleNumberPlateText(vehicle))
end)

RegisterNetEvent('rho-mechanic:client:pepe')
AddEventHandler('rho-mechanic:client:pepe', function()
    print("HMM")
end)