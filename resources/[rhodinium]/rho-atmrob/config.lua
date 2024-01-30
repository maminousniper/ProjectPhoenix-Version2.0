RHO = {}

local QBCore = exports['qb-core']:GetCoreObject()

RHO.MinimumATMRobberyPolice = 0
RHO.Target = "qb-target"
RHO.ProgressBar = "qb-taskbar"
RHO.CrackIcon = "fas fa-recycle"
RHO.Payment = math.random(1500, 3500)
-- REWARD OPTIONS

-- TIMES
RHO.BrokeTime = math.random(25000, 45000)
RHO.ProgressTime = 7000
RHO.TextLength = 2000 -- 3d text leight

-- LOCALES
RHO.TextCrack = "Collecting coins"
RHO.TextPutToCar = "You Tie the Rope to the Vehicle"
RHO.TextAttach = "You Tie the Rope to the ATM"
RHO.TextTCrack = "You're smashing the ATM"
RHO.Text = "E CONNECT ATM| X REMOVE ROPE"

-- ROPE ITEM
RHO.RopeItemName = "towingrope"
RHO.RopeItemCount = 1 -- how many ropes will be removed
RHO.UseRopeNotify = "You used rope"
RHO.DontHaveRope = "You dont have rope"