--[[
    Arm Wrestle Simulator Hub
    by Niga Hub
]]

--------------------
--    Library
--------------------
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

--------------------
--    Services
--------------------
local RunService        = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--------------------
--    Remotes
--------------------
local Knit = ReplicatedStorage
    :WaitForChild("Packages")
    :WaitForChild("Knit")
    :WaitForChild("Services")

-- Arm Wrestle
local armRF       = Knit:WaitForChild("ArmWrestleService"):WaitForChild("RF")
local StartFight  = armRF:WaitForChild("RequestStartFight")
local ClickRemote = armRF:WaitForChild("RequestClick")
local CritRemote  = armRF:WaitForChild("RequestCritHit")

-- Tool (Bicep / Hand)
local toolRE    = Knit:WaitForChild("ToolService"):WaitForChild("RE")
local ToolClick = toolRE:WaitForChild("onClick")

-- Egg
local eggRF       = Knit:WaitForChild("EggService"):WaitForChild("RF")
local PurchaseEgg = eggRF:WaitForChild("purchaseEgg")

-- NEW (safe, won't freeze if service is gone)
local graveService = Knit:FindFirstChild("GraveDiggerService")
local DigGrave = graveService
    and graveService:FindFirstChild("RF")
    and graveService.RF:FindFirstChild("DigGrave")
    or nil
    
-- Intermission
local personalRF        = Knit:WaitForChild("PersonalWrestleService"):WaitForChild("RF")
local ClaimIntermission = personalRF:WaitForChild("Claim")

-- Carrot
local carrotRF    = Knit:WaitForChild("CarrotSpawningService"):WaitForChild("RF")
local CarrotBatch = carrotRF:WaitForChild("CarrotCollectedBatch")

--------------------
--    Egg & Boss Lists (auto-built)
--------------------
local function BuildEggList()
    local seen, out = {}, {}
    local eggsFolder = ReplicatedStorage:FindFirstChild("Eggs")
    if eggsFolder then
        for _, v in ipairs(eggsFolder:GetChildren()) do
            if not seen[v.Name] then seen[v.Name] = true; table.insert(out, v.Name) end
        end
    end
    local enumsFolder = ReplicatedStorage:FindFirstChild("Enums")
    if enumsFolder then
        local eggTypes = enumsFolder:FindFirstChild("EggTypes")
        if eggTypes and eggTypes:IsA("ModuleScript") then
            local ok, data = pcall(require, eggTypes)
            if ok and type(data) == "table" then
                for key in pairs(data) do
                    if not seen[key] then seen[key] = true; table.insert(out, key) end
                end
            end
        end
    end
    table.sort(out)
    return #out > 0 and out or { "DungeonGate" }
end

local function BuildBossList()
    local out = {}
    local enumsFolder = ReplicatedStorage:FindFirstChild("Enums")
    if enumsFolder then
        local npcTypes = enumsFolder:FindFirstChild("ArmWrestleNPCTypes")
        if npcTypes and npcTypes:IsA("ModuleScript") then
            local ok, data = pcall(require, npcTypes)
            if ok and type(data) == "table" then
                for key in pairs(data) do table.insert(out, key) end
            end
        end
    end
    table.sort(out)
    return #out > 0 and out or { "DungeonKeeper" }
end

local EggList  = BuildEggList()
local BossList = BuildBossList()

--------------------
--    Heartbeat System
--------------------
local activeTasks         = {}
local heartbeatConnection = nil

local function startHeartbeatIfNeeded()
    if not heartbeatConnection and next(activeTasks) ~= nil then
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            for taskName, taskFn in pairs(activeTasks) do
                local ok, err = pcall(taskFn)
                if not ok then
                    warn("Task '" .. tostring(taskName) .. "' errored:", err)
                end
            end
        end)
    end
end

local function stopHeartbeatIfNeeded()
    if heartbeatConnection and next(activeTasks) == nil then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
end

local function setTask(name, fn)
    activeTasks[name] = fn
    startHeartbeatIfNeeded()
    stopHeartbeatIfNeeded()
end

--------------------
--    Main Tab Vars
--------------------
local clickdelay    = 0
local lastToolClick = 0

--------------------
--    Dig Grave Vars
--------------------
local lastGraveCheck = 0
local GRAVE_INTERVAL = 1

local function GetGraveTimer(grave)
    local ok, text = pcall(function()
        return grave
            :WaitForChild("Primary", 1)
            :WaitForChild("TimerAtt", 1)
            :WaitForChild("BillboardGui", 1)
            :WaitForChild("Title", 1)
            :WaitForChild("TextLabel", 1).Text
    end)
    return ok and type(text) == "string" and text:match("^%s*(.-)%s*$") or nil
end

local function IsGraveReady(t)
    return t == "00s" or t == "2m 59s"
end

--------------------
--    Intermission Vars
--------------------
local lastIntermission      = 0
local INTERMISSION_INTERVAL = 1

--------------------
--    Boss Vars
--------------------
local selectedboss = BossList[1] or "DungeonKeeper"
local lastBossTry  = 0
local BOSS_DELAY   = 0.5

--------------------
--    Crit Vars
--------------------
local lastCritTime  = 0
local CRIT_COOLDOWN = 0.12

--------------------
--    Egg Vars
--------------------
local selectedegg = EggList[1] or "DungeonGate"

--------------------
--    Carrot Vars
--------------------
local carrotconn = nil

local function CollectCarrot(v)
    local id   = v:GetAttribute("CarrotGuid")
    local zone = v:GetAttribute("CarrotZone")
    pcall(function() CarrotBatch:InvokeServer({{ zone, id }}) end)
    pcall(function() v:Destroy() end)
end

--------------------
--    Task Functions
--------------------
local function taskToolClick()
    local now = os.clock()
    if clickdelay <= 0 or now - lastToolClick >= clickdelay then
        lastToolClick = now
        ToolClick:FireServer()
    end
end

local function taskDigGrave()
  if not DigGrave then return end
    local now = os.clock()
    if now - lastGraveCheck < GRAVE_INTERVAL then return end
    lastGraveCheck = now
    local folder = workspace:FindFirstChild("GameObjects")
        and workspace.GameObjects:FindFirstChild("GraveDigging")
    if not folder then return end
    for _, grave in ipairs(folder:GetChildren()) do
        if grave:IsA("Model") or grave:IsA("Folder") then
            local t = GetGraveTimer(grave)
            if t and IsGraveReady(t) then
                DigGrave:InvokeServer(grave)
            end
        end
    end
end

local function taskIntermission()
    local now = os.clock()
    if now - lastIntermission < INTERMISSION_INTERVAL then return end
    lastIntermission = now
    for i = 1, 5 do
        ClaimIntermission:InvokeServer("Intermission" .. i .. "_V1")
    end
end

local function taskBoss()
    local now = os.clock()
    if now - lastBossTry < BOSS_DELAY then return end
    lastBossTry = now
    StartFight:InvokeServer(selectedboss)
end

local function taskClickBoss()
    ClickRemote:InvokeServer()
    ClickRemote:InvokeServer()
end

local function taskCrit()
    local now = os.clock()
    if now - lastCritTime < CRIT_COOLDOWN then return end
    lastCritTime = now
    CritRemote:InvokeServer()
end

local function taskFastBoss()
    StartFight:InvokeServer(selectedboss)
end

local function taskFastClick()
    ClickRemote:InvokeServer()
end

local function taskFastCrit()
    CritRemote:InvokeServer()
end

local function taskAutoEgg()
    PurchaseEgg:InvokeServer(selectedegg, false, false, false, false, true)
end

--------------------
--    Window
--------------------
local Window = WindUI:CreateWindow({
    Title       = "Arm Wrestle Simulator",
    Icon        = "swords",
    Author      = "Niga Hub",
    Folder      = "ArmWrestle_Hub",
    Size        = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme       = "Dark",
    Resizable   = true,
})

local AutoSave = Window.ConfigManager:CreateConfig("autosave")

--------------------
--    Tabs
--------------------
local Tab_Main     = Window:Tab({ Title = "Main",      Icon = "hand"     })
local Tab_Boss     = Window:Tab({ Title = "Boss",      Icon = "swords"   })
local Tab_FastBoss = Window:Tab({ Title = "Fast Boss", Icon = "zap"      })
local Tab_Egg      = Window:Tab({ Title = "Egg",       Icon = "egg"      })
local Tab_Settings = Window:Tab({ Title = "Settings",  Icon = "settings" })

-- ══════════════════════════════════════════
--             MAIN TAB
-- ══════════════════════════════════════════

Tab_Main:Space()

local T_MainAutoClick = Tab_Main:Toggle({
    Title    = "Auto Click",
    Desc     = "Only works for Bicep and Hand",
    Flag     = "MainAutoClick",
    Value    = false,
    Callback = function(state)
        setTask("ToolClick", state and taskToolClick or nil)
    end,
})

Tab_Main:Space()

Tab_Main:Slider({
    Title    = "Click Speed (delay)",
    Desc     = "Seconds between clicks — 0 = fastest",
    Value    = { Min = 0, Max = 2, Default = 0 },
    Step     = 0.05,
    Callback = function(value)
        clickdelay = value
    end,
})

Tab_Main:Space()

--------------------
--    Dig Grave
--------------------
Tab_Main:Section({ Title = "Dig Grave - Event Atomic Island" })

Tab_Main:Paragraph({
    Title = "How it works",
    Desc  = "Scans graves every 1s. Only digs ones showing '00s' or '2m 59s'.",
    Color = "Blue",
})

Tab_Main:Space()

local T_AutoDigGrave = Tab_Main:Toggle({
    Title    = "Auto Dig Grave",
    Desc     = "Automatically digs every ready grave",
    Flag     = "AutoDigGrave",
    Value    = false,
    Callback = function(state)
        setTask("DigGrave", state and taskDigGrave or nil)
        if state then
            WindUI:Notify({ Title = "Auto Dig Grave", Content = "Scanning graves every 1s.", Icon = "shovel", Duration = 3 })
        end
    end,
})

Tab_Main:Space()

Tab_Main:Button({
    Title    = "Dig Ready Graves (Once)",
    Desc     = "Manual one-shot scan & dig",
    Callback = function()
      if not DigGrave then
            WindUI:Notify({ Title = "Dig Grave", Content = "GraveDiggerService not found in this update!", Icon = "x", Duration = 4 })
            return
        end
        local folder = workspace:FindFirstChild("GameObjects")
            and workspace.GameObjects:FindFirstChild("GraveDigging")
        if not folder then
            WindUI:Notify({ Title = "Dig Grave", Content = "GraveDigging folder not found!", Icon = "x", Duration = 4 })
            return
        end
        local dug = 0
        for _, grave in ipairs(folder:GetChildren()) do
            local t = GetGraveTimer(grave)
            if t and IsGraveReady(t) then
                if pcall(function() DigGrave:InvokeServer(grave) end) then
                    dug = dug + 1
                end
            end
        end
        WindUI:Notify({ Title = "Dig Grave (Once)", Content = "Dug " .. dug .. " grave(s).", Icon = "check", Duration = 3 })
    end,
})

Tab_Main:Space()

--------------------
--    Auto Intermission
--------------------
local T_AutoIntermission = Tab_Main:Toggle({
    Title    = "Auto Intermission",
    Desc     = "Claims all 5 Intermission rewards every second",
    Flag     = "AutoIntermission",
    Value    = false,
    Callback = function(state)
        setTask("Intermission", state and taskIntermission or nil)
        if state then
            WindUI:Notify({ Title = "Auto Intermission", Content = "Now claiming intermissions.", Icon = "star", Duration = 3 })
        end
    end,
})

Tab_Main:Space()

--------------------
--    Auto Carrot
--------------------
Tab_Main:Section({ Title = "Auto Carrot" })

Tab_Main:Paragraph({
    Title = "How it works",
    Desc  = "Uses ChildAdded — collects carrots the instant they spawn, no delay.",
    Color = "Blue",
})

Tab_Main:Space()

local T_AutoCarrot = Tab_Main:Toggle({
    Title    = "Auto Collect Carrots",
    Desc     = "Instantly collects every carrot that spawns",
    Flag     = "AutoCarrot",
    Value    = false,
    Callback = function(state)
        if state then
            local folder = workspace:FindFirstChild("GameObjects")
                and workspace.GameObjects:FindFirstChild("Carrots")
            if not folder then
                WindUI:Notify({ Title = "Auto Carrot", Content = "GameObjects.Carrots not found!", Icon = "x", Duration = 4 })
                return
            end
            for _, v in pairs(folder:GetChildren()) do
                CollectCarrot(v)
            end
            carrotconn = folder.ChildAdded:Connect(function(v)
                CollectCarrot(v)
            end)
            WindUI:Notify({ Title = "Auto Carrot", Content = "Now collecting carrots!", Icon = "check", Duration = 3 })
        else
            if carrotconn then
                carrotconn:Disconnect()
                carrotconn = nil
            end
        end
    end,
})

Tab_Main:Space()

AutoSave:Register("MainAutoClick",    T_MainAutoClick)
AutoSave:Register("AutoDigGrave",     T_AutoDigGrave)
AutoSave:Register("AutoIntermission", T_AutoIntermission)
AutoSave:Register("AutoCarrot",       T_AutoCarrot)

-- ══════════════════════════════════════════
--             BOSS TAB
-- ══════════════════════════════════════════

Tab_Boss:Space()

Tab_Boss:Dropdown({
    Title            = "Select Boss",
    Desc             = "Boss to fight in safe mode",
    Values           = BossList,
    Value            = selectedboss,
    SearchBarEnabled = true,
    Callback = function(value)
        selectedboss = value
    end,
})

Tab_Boss:Space()

local T_AutoBoss = Tab_Boss:Toggle({
    Title    = "Auto Start Boss Fight",
    Desc     = "Retries every 0.5s",
    Flag     = "AutoBoss",
    Value    = false,
    Callback = function(state)
        setTask("BossStart", state and taskBoss or nil)
    end,
})

Tab_Boss:Space()

local T_AutoClick = Tab_Boss:Toggle({
    Title    = "Auto Click",
    Desc     = "Sends 2 clicks per frame",
    Flag     = "AutoClick",
    Value    = false,
    Callback = function(state)
        setTask("BossClick", state and taskClickBoss or nil)
    end,
})

Tab_Boss:Space()

local T_AutoCrit = Tab_Boss:Toggle({
    Title    = "Auto Crit Hit",
    Desc     = "1 crit every 0.12s",
    Flag     = "AutoCrit",
    Value    = false,
    Callback = function(state)
        setTask("BossCrit", state and taskCrit or nil)
    end,
})

Tab_Boss:Space()

Tab_Boss:Button({
    Title    = "Start Boss Fight (Once)",
    Desc     = "Manual single trigger",
    Callback = function()
        pcall(function() StartFight:InvokeServer(selectedboss) end)
    end,
})

Tab_Boss:Space()

AutoSave:Register("AutoBoss",  T_AutoBoss)
AutoSave:Register("AutoClick", T_AutoClick)
AutoSave:Register("AutoCrit",  T_AutoCrit)

-- ══════════════════════════════════════════
--             FAST BOSS TAB
-- ══════════════════════════════════════════

Tab_FastBoss:Space()

Tab_FastBoss:Paragraph({
    Title = "⚠  Warning",
    Desc  = "Fast mode has no delay. You may get kicked.",
    Color = "Orange",
})

Tab_FastBoss:Space()

Tab_FastBoss:Dropdown({
    Title            = "Select Boss (FAST)",
    Desc             = "Shares selection with Boss tab",
    Values           = BossList,
    Value            = selectedboss,
    SearchBarEnabled = true,
    Callback = function(value)
        selectedboss = value
    end,
})

Tab_FastBoss:Space()

Tab_FastBoss:Toggle({
    Title    = "Auto Start Boss (FAST)",
    Desc     = "Spams RequestStartFight every frame",
    Flag     = "FastAutoBoss",
    Value    = false,
    Callback = function(state)
        setTask("FastBoss", state and taskFastBoss or nil)
    end,
})

Tab_FastBoss:Space()

Tab_FastBoss:Toggle({
    Title    = "Auto Click (FAST)",
    Desc     = "One click every frame",
    Flag     = "FastAutoClick",
    Value    = false,
    Callback = function(state)
        setTask("FastClick", state and taskFastClick or nil)
    end,
})

Tab_FastBoss:Space()

Tab_FastBoss:Toggle({
    Title    = "Auto Crit (FAST)",
    Desc     = "One crit every frame",
    Flag     = "FastAutoCrit",
    Value    = false,
    Callback = function(state)
        setTask("FastCrit", state and taskFastCrit or nil)
    end,
})

Tab_FastBoss:Space()

-- ══════════════════════════════════════════
--             EGG TAB
-- ══════════════════════════════════════════

Tab_Egg:Space()

Tab_Egg:Dropdown({
    Title            = "Select Egg",
    Desc             = "Auto-populated from ReplicatedStorage",
    Values           = EggList,
    Value            = selectedegg,
    SearchBarEnabled = true,
    Callback = function(value)
        selectedegg = value
    end,
})

Tab_Egg:Space()

local T_AutoEgg = Tab_Egg:Toggle({
    Title    = "Auto Open Egg",
    Desc     = "Purchases selected egg every frame",
    Flag     = "AutoEgg",
    Value    = false,
    Callback = function(state)
        setTask("AutoEgg", state and taskAutoEgg or nil)
    end,
})

Tab_Egg:Space()

Tab_Egg:Button({
    Title    = "Open Egg (Once)",
    Desc     = "Manual single purchase",
    Callback = function()
        pcall(function()
            PurchaseEgg:InvokeServer(selectedegg, false, false, false, false, true)
        end)
    end,
})

Tab_Egg:Space()

AutoSave:Register("AutoEgg", T_AutoEgg)

-- ══════════════════════════════════════════
--             SETTINGS TAB
-- ══════════════════════════════════════════

Tab_Settings:Space()

Tab_Settings:Paragraph({
    Title = "Configuration",
    Desc  = "Save or load your toggle states.",
    Color = "Blue",
})

Tab_Settings:Space()

Tab_Settings:Button({
    Title    = "Save Config",
    Desc     = "Writes current toggle states to disk",
    Callback = function()
        AutoSave:Save()
        WindUI:Notify({ Title = "Config Saved", Content = "Toggle states saved!", Icon = "check", Duration = 3 })
    end,
})

Tab_Settings:Space()

Tab_Settings:Button({
    Title    = "Load Config",
    Desc     = "Restores previously saved toggle states",
    Callback = function()
        AutoSave:Load()
        WindUI:Notify({ Title = "Config Loaded", Content = "Toggle states restored!", Icon = "check", Duration = 3 })
    end,
})

Tab_Settings:Space()

Tab_Settings:Keybind({
    Title    = "Toggle UI",
    Desc     = "Show / hide the window",
    Value    = "RightControl",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end,
})

Tab_Settings:Space()

Tab_Settings:Paragraph({
    Title = "Stats",
    Desc  = string.format("Loaded %d eggs and %d bosses.", #EggList, #BossList),
    Color = "Green",
})

Tab_Settings:Space()

--------------------
--    Startup
--------------------
pcall(function() AutoSave:Load() end)

WindUI:Notify({
    Title    = "Arm Wrestle Hub",
    Content  = string.format("Loaded! %d eggs, %d bosses.", #EggList, #BossList),
    Icon     = "check",
    Duration = 4,
})
