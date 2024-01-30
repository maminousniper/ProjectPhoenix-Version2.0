function DoProgressBarPlace(cb)
    if Config.Progress == "qb" then
        QBCore.Functions.Progressbar("pick-table", Config.Locale["placing"],  8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  Config.Animations["placing"].animDict,
            anim = Config.Animations["placing"].animName,
            flags = 49,
        }, {}, {}, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = 8000,
			label = Config.Locale["placing"],
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = Config.Animations["placing"].animDict,
				clip =  Config.Animations["placing"].animName,
			},
		}) then 
			ClearPedTasksImmediately(PlayerPedId())
            cb(true)
		else 
			cb(false)
		end
    end
end

function DoProgressAddQueenBee(cb)
    if Config.Progress == "qb" then
        QBCore.Functions.Progressbar("pick-table", Config.Locale["adding_queen_bee"],  8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  Config.Animations["adding_queen_bee"].animDict,
            anim = Config.Animations["adding_queen_bee"].animName,
            flags = 49,
        }, {}, {}, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = 8000,
			label = Config.Locale["adding_queen_bee"],
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = Config.Animations["adding_queen_bee"].animDict,
				clip =  Config.Animations["adding_queen_bee"].animName,
			},
		}) then 
			ClearPedTasksImmediately(PlayerPedId())
            cb(true)
		else 
			cb(false)
		end
    end
end

function DoProgressHarvestHoney(cb)
    if Config.Progress == "qb" then
        QBCore.Functions.Progressbar("pick-table", Config.Locale["harvesting_honey"],  8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  Config.Animations["harvest"].animDict,
            anim = Config.Animations["harvest"].animName,
            flags = 49,
        }, {}, {}, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = 8000,
			label = Config.Locale["harvesting_honey"],
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = Config.Animations["harvest"].animDict,
				clip =  Config.Animations["harvest"].animName,
			},
		}) then 
			ClearPedTasksImmediately(PlayerPedId())
            cb(true)
		else 
			cb(false)
		end
    end
end

function DoProgressDestroyBeehive(cb)
    if Config.Progress == "qb" then
        QBCore.Functions.Progressbar("pick-table", Config.Locale["destroying"],  8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict =  Config.Animations["destroy"].animDict,
            anim = Config.Animations["destroy"].animName,
            flags = 49,
        }, {}, {}, function() -- Done
            cb(true)
        end, function()
            cb(false)
        end)
    else
        if lib.progressCircle({
			duration = 8000,
			label = Config.Locale["harvesting_honey"],
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
			position= 'bottom',
			anim = {
				dict = Config.Animations["destroy"].animDict,
				clip =  Config.Animations["destroy"].animName,
			},
		}) then 
			ClearPedTasksImmediately(PlayerPedId())
            cb(true)
		else 
			cb(false)
		end
    end
end