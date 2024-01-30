local function hideText()
    --[[ SendNUIMessage({
        action = 'HIDE_TEXT',
    }) ]]
    lib.hideTextUI()
end

local function drawText(text, position)
    --[[ if type(position) ~= "string" then position = "left" end

    SendNUIMessage({
        action = 'DRAW_TEXT',
        data = {
            text = text,
            position = position
        }
    }) ]]
    lib.showTextUI(text, {
        position = "left-center",
      })
end

local function changeText(text, position)
    if type(position) ~= "string" then position = "left" end

    SendNUIMessage({
        action = 'CHANGE_TEXT',
        data = {
            text = text,
            position = position
        }
    })
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        SendNUIMessage({
            action = 'KEY_PRESSED', 
        })
        Wait(500)
        hideText()
    end)
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    --lib.showTextUI(text)
    lib.showTextUI(text, {
        position = "left-center",
      })
    --drawText(text, position) --QB-Core crap
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    lib.hideTextUI()
    --hideText() --QB-Core crap
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)
