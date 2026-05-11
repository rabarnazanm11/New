--[[
         World Fighters Hub  |  Uses The game Script for  enemies

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]

-- =====================================================
--               ★ CONFIG (EDIT HERE) ★
-- =====================================================
local EggList = {
    ["Dressrosa [Zone 1]"]       = "Dressrosa",
    ["Marine Fortress [Zone 2]"] = "Marine Fortress",
    ["Capsule Corp [Zone 3]"]    = "Capsule Corp",
    ["Dragon Arena [Zone 4]"]    = "Dragon Arena",
    ["Jura Forest [Zone 5]"]     = "Jura Forest",
    ["Tempest Federation [Zone 6]"]       = "Tempest Federation",
    ["Sorcerers Academy [Zone 7]"]       = "Sorcerers Academy",
    ["Cursed Bridge [Zone 8]"]       = "Cursed Bridge",
    
}
local RollList = {
    ["Haki [Zone 1]"]                       = "Haki",
    ["Fruit [Zone 2]"]                      = "Fruit",
    ["Race [Zone 3]"]                       = "Race",
    ["Dragon Power [Zone 4]"]               = "Dragon Power",
    ["Slime Power [Zone 5]"]                = "Slime Power",
    ["Primordial Demon [Zone 6]"]           = "Primordial Demon",
    ["Cursed Technique [Zone 7]"]           = "Cursed Technique",
    ["Cursed Spirit [Zone 8]"]              = "Cursed Spirit",

    
  --  ["Dojutsu [Zone ??] Not Ingame Yet"]    = "Dojutsu",
  --  ["Ninja Clan [Zone ??] Not Ingame Yet"] = "Ninja Clan",
}
local LobbyLocations = {
    ["Lobby"]          = CFrame.new(27465.773438, 787.311218, -15845.648438, -0.191700, 0.000000, -0.981454, 0.000000, 1.000000, 0.000000, 0.981454, -0.000000, -0.191700),
    ["Trial Upgrades"] = CFrame.new(27413.400391, 787.219666, -15831.536133, -0.885915, 0.000000, -0.463849, 0.000000, 1.000000, 0.000000, 0.463849, 0.000000, -0.885915),
}
local DressrosaLocations = {
    ["Dressrosa"]           = CFrame.new(6128.340332, 788.078064, -1228.689331, 0.145394, 0.000000, 0.989374, -0.000000, 1.000000, -0.000000, -0.989374, -0.000000, 0.145394),
    ["Star Dressrosa"]      = CFrame.new(6143.721191, 787.665588, -1227.190063, -0.365614, -0.000000, 0.930767, 0.000000, 1.000000, 0.000000, -0.930767, 0.000000, -0.365614),
    ["Follow Rewards"]      = CFrame.new(6070.381836, 798.229858, -1134.708740, 0.916808, 0.000000, 0.399328, -0.000000, 1.000000, -0.000000, -0.399328, 0.000000, 0.916808),
    ["Passive Puncks"]      = CFrame.new(6244.308594, 812.776306, -632.143799, 0.380520, -0.000000, -0.924773, -0.000000, 1.000000, -0.000000, 0.924773, 0.000000, 0.380520),
    ["Haki System"]         = CFrame.new(6186.098145, 798.229858, -1135.051025, -0.831024, 0.000000, -0.556237, 0.000000, 1.000000, -0.000000, 0.556237, -0.000000, -0.831024),
    ["Leaderboards"]        = CFrame.new(6700.438477, 825.617798, -1125.140381, -0.598768, 0.000000, 0.800922, 0.000000, 1.000000, 0.000000, -0.800922, 0.000000, -0.598768),
    ["Awakening (Rank Up)"] = CFrame.new(6055.171387, 788.078064, -1249.819946, 0.730226, 0.000000, 0.683206, -0.000000, 1.000000, 0.000000, -0.683206, -0.000000, 0.730226),
    ["Wanted (Avatars)"]    = CFrame.new(6106.868652, 788.098206, -1238.841431, -0.441760, 0.000000, 0.897133, 0.000000, 1.000000, -0.000000, -0.897133, 0.000000, -0.441760),
}
local MarineFortressLocations = {
    ["Star"]                             = CFrame.new(11747.207031, -11.384936, -23350.462891, -0.252081, -0.000000, -0.967706, 0.000000, 1.000000, -0.000000, 0.967706, -0.000000, -0.252081),
    ["Fighting Style"]                   = CFrame.new(11944.705078, -11.990705, -23256.228516, -0.793967, 0.000000, 0.607961, 0.000000, 1.000000, -0.000000, -0.607961, 0.000000, -0.793967),
    ["Fruits"]                           = CFrame.new(11780.607422, -11.385138, -23359.361328, -0.788605, 0.000000, 0.614900, 0.000000, 1.000000, 0.000000, -0.614900, 0.000000, -0.788605),
    ["Pirates Evolution ( skill Tree )"] = CFrame.new(11705.627930, -16.190359, -23279.669922, -0.421055, 0.000000, -0.907035, -0.000000, 1.000000, 0.000000, 0.907035, 0.000000, -0.421055),
    ["Swords Banner"]                    = CFrame.new(11575.189453, -11.507523, -23171.662109, 0.926952, 0.000000, -0.375180, -0.000000, 1.000000, 0.000000, 0.375180, -0.000000, 0.926952),
    ["Marine Fortress"]                  = CFrame.new(11757.931641, -11.113531, -23234.021484, 0.933668, 0.000000, -0.358140, -0.000000, 1.000000, 0.000000, 0.358140, -0.000000, 0.933668),
}
local Codes = {
    -- Update 3
    "UPDATE3",
    "!!8MILLIONVISITS!!",
    "40KFAVORITES!TY!",
    "20KLIKESYOUAREINSANE?!",
    -- Codes that work again each update
    "SRRY4SHUTDOWN",
    "SRRY4SHUTDOWN2",
    "SRRY4SHUTDOWN3",
    "SORRY4SHUTDOWN3",
    --_____
    -- Update 2
    "UPDATE2QOL",
    "UPDATE2PT2",
    "UPDATE2",
    "17.5KLIKES?!",
    "6MILLIONVISITSYO!!!",
    "7MILLIONVISITSYAY!?!",
    "YEAAA30KFAVORITES!!",
    "DAMN25KFAVORITES!!",
    "13KPLAYERSISALOT",
    "13KPLAYERSISALOT!",
    "CANTBELIEVE12KCCU!",
    "WOW10KLIKES!",
    "11KLIKESLETSGO!",
    "12KLIKESINSANE!",
    "13KLIKESMILESTONE!",
    "TYFOR14KLIKES!",
    "ALREADY15KLIKESAWESOME?!",
    "OMG4MILLIONVISITS!",
    "4.5MILLIONVISITSYOOO!",
    "5MILLIONVISITSINSANE!",
    "10KFAVORITESTYSM!",
    "11KFAVORITESNOWAY!",
    "12KFAVORITESBABY!",
    "15KFAVORITES!!!",
    "20KFAVORITESYAY!!",
    --_____
    -- Update 1
    "UPDATE1QOL",
    "UPDATE1PT2",
    "UPDATE1",
    "SRRY4DELAY",
    "SRRY4UPDPROBLEMS",
    "LOVE8KLIKES!",
    "THXSOMUCHFOR9KLIKES!",
    "WOW10KCCU",
    "AWESOME11KCCU",
    "6KLIKESLOVU!",
    "GOOD7KLIKES!",
    "2.2MVISITS!!",
    "2.4MVISITSTYSM!!",
    "2.6MILLIONVISITSTY!",
    "2.8MILLIONVISITSTHX!",
    "3MILLIONVISITSWOAH!",
    "OHYEAH3.5MILLIONVISITS!",
    "AWESOME1.4MVISITS!",
    "1.6MILLIONVISITS!",
    "1.8MILLIONVISITSALREADY?!",
    "2MILLIONSSSVISITS!",
    "2MILLIONSSSVISITS",
    "4KFAVORITESYOUAREREAL!",
    "LOVEUALL5KFAVORITES",
    "6KFAVORITESWOAH!",
    "7KFAVORITESSS!",
    "8KFAVORITESINWF!",
    "YAY9KFAVORITES!",
    --_____
    -- Release / Early
    "RELEASE",
    "RELEASEPATCH",
    "RELEASEPT2",
    "RELEASEQOL",
    "TIOGADIHIT!",
    "THX1KCCU",
    "2KCCU!",
    "THANKYOU3KCCU",
    "4KONCHAMBER!",
    "ALREADY5K?",
    "6KTHXSOMUCH",
    "7KISALOT!",
    "9KPLAYERS",
    "THANKS1KLIKES",
    "TY2KLIKES!!",
    "THX3KLIKES!",
    "THXFOR4KLIKES",
    "YAY5KLIKES!",
    "6KLIKESLOVU!",
    "GOOD7KLIKES!",
    "100KVISITSONCHAMBER!",
    "THXFOR200KVISITS!",
    "300KVISITSTHANKYOU!",
    "400KVISITSINCREDIBLE",
    "WOW500KVISITS!",
    "600KVISITSYAY!",
    "700KVISITSINGAME",
    "SPLENDID800KVISITS!",
    "900KVISITSTHANKYOU!",
    "ALREADY1MVISITS!?",
    "COOL1.2MVISITS!",
    "1KFAVORITESTHX!",
    "2KFAVORITESTHANKYOU!",
    "THXFOR3KFAVORITES!",
    "EVENT2.5K!",
    "8KCCUISAWESOME!",
}
print("total codes = " .. #Codes)

-- =====================================================
--               SERVICES & SETUP
-- =====================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer       = Players.LocalPlayer

local dataRemote  = ReplicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent")
local EnemiesUtil = require(ReplicatedStorage.Omni.Utils.Enemies)

-- PlayerArea lives at workspace.Cache.PlayerArea
-- It is a 45 x 0.5 x 45 flat BasePart that marks the combat zone.
-- We call this each time so it survives server changes / respawns.
local function GetPlayerArea()
    local cache = workspace:FindFirstChild("Cache")
    return cache and cache:FindFirstChild("PlayerArea")
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
WindUI:SetNotificationLower(true)
WindUI:SetFont("rbxassetid://12187372175")  -- https://create.roblox.com/store/fonts

-- =====================================================
--               WINDOW SETUP
-- =====================================================
local Window = WindUI:CreateWindow({
    Title = "World Fighters",
    Icon = "terminal",
    Author = "by Me",
    Folder = "MySuperHub",
    Topbar = { Height = 52, ButtonsType = "Default" }, -- Default , Mac 
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    ToggleKey = Enum.KeyCode.LeftShift,
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            setclipboard(game.GameId)
            WindUI:Notify({Title = "Copied!", Content = "Game ID copied to clipboard.", Duration = 3, Icon = "info"})
        end,
    },
})
Window:Tag({Title = "V1", Icon = "award", Color = Color3.fromHex("#0d3154"), Radius = 9})
local PingTag = Window:Tag({
    Title = "Ping: 0ms",
    Color = Color3.fromRGB(100, 200, 255),
})
 
task.spawn(function()
    while true do
        local success, ping = pcall(function()
            local Stats = game:GetService("Stats")
            local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            return math.floor(pingValue)
        end)
        
        if success and ping then
            PingTag:SetTitle("Ping: " .. ping .. "ms")
            
            if ping <= 50 then
                PingTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
            elseif ping <= 100 then
                PingTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
            elseif ping <= 200 then
                PingTag:SetColor(Color3.fromRGB(255, 150, 0)) -- Orange
            else
                PingTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
            end
        end
        
        task.wait(2)
    end
end)

-- your tag
local FPSTag = Window:Tag({
    Title = "FPS: 0",
    Color = Color3.fromRGB(100, 150, 255),
})
 
local RunService = game:GetService("RunService")
local lastUpdate = tick()
local frameCount = 0
 
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FPSTag:SetTitle("FPS: " .. fps)
        
        if fps >= 50 then
            FPSTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
        elseif fps >= 30 then
            FPSTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
        else
            FPSTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
        end
        
        
        frameCount = 0
        lastUpdate = now
    end
end)


Window:EditOpenButton({
    Title = "World Fighters", Icon = "axe", CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("ffffff"), Color3.fromHex("ffffff")),
    OnlyMobile = false, Enabled = true, Draggable = true,
})


-- =====================================================
--               COLORS
-- =====================================================
local colorz = {

  
["DarkBlue"] = Color3.fromRGB(23,33,152),
["Cyan"] = Color3.fromRGB(68,229,246),
["Red"] = Color3.fromRGB(246,68,68),
["Purple ish"] = Color3.fromRGB(138,68,246),
["Green"] = Color3.fromRGB(31,212,25),
["Gray"] = Color3.fromRGB(112,112,112),
["Black ish"] = Color3.fromRGB(23,23,23),
}
--[[
colorz["DarkBlue"]
colorz["Cyan"]
colorz["Red"]
colorz["Purple ish"]
colorz["Green"]
colorz["Gray"]
colorz["Black ish"]
]]

-- =====================================================
--               STATE VARIABLES
-- =====================================================
local SelectedEnemies     = {}    -- multi-select: enemies to farm
local PriorityEnemies     = {}    -- multi-select: enemies farmed first (closest wins)
local AutoFarm            = false
local AutoAttack          = false
local AutoClickOnly       = false
local AutoTeleportNearest = false
local AutoTeleportGamemodes = false
local SmartFarmMode       = false -- cluster-centroid teleport inside PlayerArea
local AutoHatch           = false
local AutoRoll            = false

local EggDelay  = 0.1
local RollDelay = 0.1
local CodeDelay = 1

local SelectedEgg      = nil
local SelectedRollType = nil

-- =====================================================
--               HELPER FUNCTIONS
-- =====================================================
local function GetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

local function GetEnemyNames()
    local names, seen = {}, {}
    local hrp = GetHRP()
    local pos = hrp and hrp.Position or Vector3.new(0, 0, 0)
    for _, e in ipairs(EnemiesUtil.GetEnemiesInRange(pos, 99999)) do
        if not seen[e.Instance.Name] then
            seen[e.Instance.Name] = true
            table.insert(names, e.Instance.Name)
        end
    end
    return names
end

local function GetNearestEnemy()
    local hrp = GetHRP()
    if not hrp then return nil end
    local result = EnemiesUtil.GetClosestEnemy(hrp.Position, 99999)
    return result and result.Instance or nil
end

-- ── Gamemode enemy helper ────────────────────────────────────────────────────
-- Scans workspace.Server.Enemies.Gamemodes for BasePart enemies and returns nearest.
local function GetNearestGamemodeEnemy()
    local hrp = GetHRP()
    if not hrp then return nil end
    local folder = workspace:FindFirstChild("Server")
        and workspace.Server:FindFirstChild("Enemies")
        and workspace.Server.Enemies:FindFirstChild("Gamemodes")
    if not folder then return nil end

    local nearest, bestDist = nil, math.huge
    for _, part in ipairs(folder:GetDescendants()) do
        if part:IsA("BasePart") then
            local health     = part:GetAttribute("Health")
            local died       = part:GetAttribute("Died")
            local respawning = part:GetAttribute("Respawning")

            -- health can be a huge number like 1.4e+30, just check > 0
            local isAlive = (not died)
                        and (not respawning)
                        and (health ~= nil and health > 0)

            if isAlive then
                local d = (hrp.Position - part.Position).Magnitude
                if d < bestDist then bestDist = d; nearest = part end
            end
        end
    end
    return nearest
end
local function IsSelectedEnemy(name)
    for _, v in ipairs(SelectedEnemies) do if v == name then return true end end
    return false
end

local function IsPriorityEnemy(name)
    for _, v in ipairs(PriorityEnemies) do if v == name then return true end end
    return false
end

local function TableKeys(t)
    local keys = {}
    for k in pairs(t) do table.insert(keys, k) end
    return keys
end

local function FireRemote(args)
    pcall(function() dataRemote:FireServer(unpack(args)) end)
end

-- ── Ping-adaptive throttle ───────────────────────────────────────────────────
-- Returns a small wait when ping is high so the server doesn't reject CFrame sets.
local function AdaptiveWait()
    local ping = 0
    pcall(function()
        ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if ping > 250 then
        task.wait(0.15)   -- high ping: back off slightly
    elseif ping > 150 then
        task.wait(0.05)   -- medium ping: small pause
    else
        RunService.Heartbeat:Wait()  -- low ping: full speed
    end
end

-- ── PlayerArea range helpers ─────────────────────────────────────────────────
--
-- IsInPlayerArea: checks if worldPos is inside the 45×45 PlayerArea part.
-- Uses CFrame:PointToObjectSpace so the check works even if the part is rotated.
--
local function IsInPlayerArea(worldPos)
    local pa = GetPlayerArea()
    if not pa then return true end          -- no part found → don't filter
    local half   = pa.Size / 2
    local local_p = pa.CFrame:PointToObjectSpace(worldPos)
    return math.abs(local_p.X) <= half.X
       and math.abs(local_p.Z) <= half.Z
end

-- GetClusterCenter: average position of a list of Vector3s. Returns nil if empty.
local function GetClusterCenter(positions)
    if #positions == 0 then return nil end
    local sum = Vector3.new(0, 0, 0)
    for _, p in ipairs(positions) do sum = sum + p end
    return sum / #positions
end

-- GetClusterPositionsInArea: returns a list of pivot positions of alive enemies
-- that are inside PlayerArea AND satisfy the optional filter function.
-- filter(name: string) → bool     pass nil to accept every enemy.
local function GetClusterPositionsInArea(filter)
    local hrp = GetHRP()
    if not hrp then return {} end
    local positions = {}
    for _, e in ipairs(EnemiesUtil.GetEnemiesInRange(hrp.Position, 99999)) do
        local inst = e.Instance
        local passes = (filter == nil) or filter(inst.Name)
        if passes and IsInPlayerArea(inst:GetPivot().Position) then
            table.insert(positions, inst:GetPivot().Position)
        end
    end
    return positions
end

-- =====================================================
--               TAB: MAIN
-- =====================================================
local Main_Tab = Window:Tab({Title = "Main", Icon = "gamepad-directional"})

local EnemyNames = GetEnemyNames()

-- ── Multi-select enemy dropdown ──────────────────────────────────────────────
local EnemyDropdown = Main_Tab:Dropdown({
    Title = "Select Enemy",
    Desc = "Choose enemies to target (multi-select)",
    Values = EnemyNames,
    Value = EnemyNames[1],
    Multi = true,
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(option)
        SelectedEnemies = option
    end
})

-- ── Priority System (multi-select) ──────────────────────────────────────────
--
--  Tick any number of enemies here.  Auto Farm will search for an alive
--  priority enemy first (closest one wins), then fall back to SelectedEnemies.
--  Smart Farm mode also checks priority enemies when computing the cluster.
--
local PrioritySection = Main_Tab:Section({
    Title = "Priority System",
    Icon = "list-ordered",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

local PriorityLabel  -- updated on every priority change

local function RefreshPriorityLabel()
    local txt = #PriorityEnemies > 0
        and ("Prioritised: " .. table.concat(PriorityEnemies, ", "))
        or  "Prioritised: None"
    if PriorityLabel then
        pcall(function() PriorityLabel:SetDesc(txt) end)
    end
end

local PriorityDropdown = PrioritySection:Dropdown({
    Title = "Priority Enemies",
    Desc = "Farmed before all other enemies (multi-select)",
    Values = EnemyNames,
    Value = nil,
    Multi = true,           -- ← multi-select
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(options)
        PriorityEnemies = type(options) == "table" and options or {}
        RefreshPriorityLabel()
        if #PriorityEnemies > 0 then
            WindUI:Notify({
                Title = "Priority Updated",
                Content = #PriorityEnemies .. " enemy/enemies set as priority",
                Duration = 2, Icon = "arrow-up"
            })
        end
    end
})

PriorityLabel = PrioritySection:Paragraph({
    Title = "Active Priority Queue",
    Desc = "Prioritised: None",
    Color = "Blue",
    Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

PrioritySection:Button({
    Title = "Clear Priority List",
    Icon = "trash-2",
    Color = Color3.fromHex("#ef4444"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        PriorityEnemies = {}
        PriorityDropdown:Refresh(GetEnemyNames())  -- resets tick-marks visually
        RefreshPriorityLabel()
        WindUI:Notify({Title = "Priority", Content = "Priority list cleared", Duration = 2, Icon = "check"})
    end
})

-- ── Refresh enemies ──────────────────────────────────────────────────────────
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all enemies currently in world",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        local names = GetEnemyNames()
        SelectedEnemies = {}
        PriorityEnemies = {}
        EnemyDropdown:Refresh(names)
        PriorityDropdown:Refresh(names)
        RefreshPriorityLabel()
        if #names == 0 then
            WindUI:Notify({Title = "Warning", Content = "No enemies found!", Duration = 3, Icon = "alert-circle"})
            return
        end
        WindUI:Notify({Title = "Refreshed", Content = "Found " .. #names .. " enemies", Duration = 2, Icon = "check"})
    end
})

-- ── Auto Farm ────────────────────────────────────────────────────────────────
--
--  Normal mode
--    Lock onto one enemy (priority > selected, nearest wins).
--    Stay until it dies, then find a new target.
--
--  Smart Farm mode
--    Every tick: collect all priority + selected enemies inside PlayerArea,
--    teleport to their centroid (geometric middle of the cluster).
--    Falls back to nearest matching enemy anywhere if none found in area.
--
Main_Tab:Toggle({
    Title = "Auto Farm",
    Desc = "Teleport to alive enemy (priority + Smart Farm aware)",
    Value = false,
    Type = "Checkbox",
    Icon = "zap",
    IconSize = 20,
    Callback = function(state)
        AutoFarm = state
        if AutoFarm then
            task.spawn(function()
                local lastEnemy = nil
                while AutoFarm do
                    local hrp = GetHRP()
                    if hrp then

                        -- ── SMART FARM MODE ──────────────────────────
                        if SmartFarmMode then
                            local positions = GetClusterPositionsInArea(function(name)
                                return IsPriorityEnemy(name) or IsSelectedEnemy(name)
                            end)
                            local center = GetClusterCenter(positions)

                            if center then
                                -- Teleport to middle of cluster, 5 studs above ground
                                hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
                            else
                                -- Fallback: closest priority enemy anywhere, then selected
                                local allInRange = EnemiesUtil.GetEnemiesInRange(hrp.Position, 99999)
                                local found, bestDist = nil, math.huge

                                for _, e in ipairs(allInRange) do
                                    if IsPriorityEnemy(e.Instance.Name) then
                                        local d = (hrp.Position - e.Instance:GetPivot().Position).Magnitude
                                        if d < bestDist then bestDist = d; found = e.Instance end
                                    end
                                end
                                if not found then
                                    bestDist = math.huge
                                    for _, e in ipairs(allInRange) do
                                        if IsSelectedEnemy(e.Instance.Name) then
                                            local d = (hrp.Position - e.Instance:GetPivot().Position).Magnitude
                                            if d < bestDist then bestDist = d; found = e.Instance end
                                        end
                                    end
                                end

                                if found then
                                    hrp.CFrame = found.CFrame * CFrame.new(0, 5, 0)
                                else
                                    task.wait(2)
                                end
                            end
                            lastEnemy = nil  -- don't track single target in smart mode

                        -- ── NORMAL MODE ──────────────────────────────
                        else
                            -- Stay locked on current target while alive
                            if lastEnemy and lastEnemy.Parent then
                                local died       = lastEnemy:GetAttribute("Died")
                                local respawning = lastEnemy:GetAttribute("Respawning")
                                local health     = lastEnemy:GetAttribute("Health")
                                if not died and not respawning and health and health > 0 then
                                    hrp.CFrame = lastEnemy.CFrame * CFrame.new(0, 5, 0)
                                else
                                    lastEnemy = nil
                                end
                            end

                            -- Find new target when needed
                            if not lastEnemy then
                                if #SelectedEnemies == 0 and #PriorityEnemies == 0 then
                                    task.wait(0.1)
                                else
                                    local allInRange = EnemiesUtil.GetEnemiesInRange(hrp.Position, 99999)
                                    local found, bestDist = nil, math.huge

                                    -- Priority enemies first (closest)
                                    for _, e in ipairs(allInRange) do
                                        if IsPriorityEnemy(e.Instance.Name) then
                                            local d = (hrp.Position - e.Instance:GetPivot().Position).Magnitude
                                            if d < bestDist then bestDist = d; found = e.Instance end
                                        end
                                    end
                                    -- Then selected enemies (closest)
                                    if not found then
                                        bestDist = math.huge
                                        for _, e in ipairs(allInRange) do
                                            if IsSelectedEnemy(e.Instance.Name) and not IsPriorityEnemy(e.Instance.Name) then
                                                local d = (hrp.Position - e.Instance:GetPivot().Position).Magnitude
                                                if d < bestDist then bestDist = d; found = e.Instance end
                                            end
                                        end
                                    end

                                    if found then
                                        lastEnemy = found
                                        hrp.CFrame = found.CFrame * CFrame.new(0, 5, 0)
                                        WindUI:Notify({Title = "Auto Farm", Content = "Locked onto " .. found.Name, Duration = 1, Icon = "check"})
                                    else
                                        task.wait(0.1)
                                    end
                                end
                            end
                        end

                    else
                        task.wait(0.1)
                    end
                    AdaptiveWait()
                end
            end)
        end
    end
})

-- ── Switch to Smart Farm Mode ────────────────────────────────────────────────
--
--  Applies to BOTH Auto Farm and Auto Teleport Nearest.
--
--  Logic:
--    1.  Collect every qualifying enemy whose position is inside
--        workspace.Cache.PlayerArea (the 45×45 combat platform).
--    2.  Calculate the centroid (average position) of that group.
--    3.  Teleport 5 studs above the centroid.
--    4.  If no enemies found inside the area → fall back to normal behaviour.
--
--  "Qualifying" means:
--    • Auto Farm → priority OR selected enemies
--    • Auto Teleport Nearest → any enemy
--
Main_Tab:Toggle({
    Title = "Switch to Smart Farm Mode",
    Desc = "TP to centre of enemy cluster inside your PlayerArea",
    Value = false,
    Type = "Checkbox",
    Icon = "brain-circuit",
    IconSize = 20,
    Callback = function(state)
        SmartFarmMode = state
        if state then
            WindUI:Notify({
                Title = "Smart Farm ON",
                Content = "Teleports to middle of enemy cluster in your area",
                Duration = 3, Icon = "brain-circuit"
            })
        else
            WindUI:Notify({
                Title = "Smart Farm OFF",
                Content = "Back to single-target mode",
                Duration = 2, Icon = "zap"
            })
        end
    end
})

-- ── Auto Teleport Nearest Enemy ──────────────────────────────────────────────
--
--  Normal mode : snap to the single closest enemy anywhere.
--  Smart Farm  : snap to centroid of ALL enemies inside PlayerArea.
--                Falls back to nearest if none found in area.
--
Main_Tab:Toggle({
    Title = "Auto Teleport Nearest Enemy",
    Desc = "Snap to closest enemy every 0.5 s (Smart Farm aware)",
    Value = false,
    Type = "Checkbox",
    Icon = "locate",
    IconSize = 20,
    Callback = function(state)
        AutoTeleportNearest = state
        if AutoTeleportNearest then
            task.spawn(function()
                while AutoTeleportNearest do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end

                        if SmartFarmMode then
                            -- Centroid of every enemy inside PlayerArea (no filter)
                            local positions = GetClusterPositionsInArea(nil)
                            local center = GetClusterCenter(positions)
                            if center then
                                hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
                            else
                                -- Fallback: nearest enemy anywhere
                                local nearest = GetNearestEnemy()
                                if nearest then hrp.CFrame = nearest.CFrame * CFrame.new(0, 5, 0) end
                            end
                        else
                            local nearest = GetNearestEnemy()
                            if nearest then hrp.CFrame = nearest.CFrame * CFrame.new(0, 5, 0) end
                        end
                    end)
                    AdaptiveWait()
                end
            end)
        end
    end
})
-- ── Auto Teleport Nearest Gamemode Enemy ─────────────────────────────────────
Main_Tab:Toggle({
    Title = "Auto TP Nearest Gamemode Enemy",
    Desc = "Snaps to closest part in workspace.Server.Enemies.Gamemodes (Smart Farm aware)",
    Value = false,
    Type = "Checkbox",
    Icon = "swords",
    IconSize = 20,
    Callback = function(state)
        AutoTeleportGamemodes = state
        if AutoTeleportGamemodes then
            task.spawn(function()
                while AutoTeleportGamemodes do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end

                        local folder = workspace:FindFirstChild("Server")
                            and workspace.Server:FindFirstChild("Enemies")
                            and workspace.Server.Enemies:FindFirstChild("Gamemodes")
                        if not folder then return end

                        if SmartFarmMode then
    local target = GetNearestGamemodeEnemy()
    if target then
        local gamemodeFolder = target.Parent
        local positions = {}
        for _, part in ipairs(gamemodeFolder:GetChildren()) do
            if part:IsA("BasePart") then
                local health     = part:GetAttribute("Health")
                local died       = part:GetAttribute("Died")
                local respawning = part:GetAttribute("Respawning")
                if (not died) and (not respawning) and (health ~= nil and health > 0) then
                    table.insert(positions, part.Position)
                end
            end
        end
        local center = GetClusterCenter(positions)
        if center then
            hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
        end
    end
    -- empty or all dead → stay in place
else
    -- Normal mode → snap to nearest alive part
    local target = GetNearestGamemodeEnemy()
    if target then
        hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 5, 0))
    end
    -- empty or all dead → stay in place
end
                        
                    end)
                    AdaptiveWait()
                end
            end)
        end
    end
})

local selectedOres = {}
local oreRunning = false

local Dropdown = Main_Tab:Dropdown({
    Title = "Select Ore",
    Values = {"All", "Blue Ore", "Orange Ore", "Purple Ore", "Pink Ore", "Green Ore", "Yellow Ore"},
    Value = {"All"},
    Multi = true,
    AllowNone = true,
    Callback = function(option)
        selectedOres = option
    end
})

local function isOreSelected(name)
    for _, v in ipairs(selectedOres) do
        if v == "All" or v == name then return true end
    end
    return false
end

local MyToggle = Main_Tab:Toggle({
    Title = "Auto Farm Ores",
    Value = false,
    Type = "Toggle",
    Icon = "zap",
    Callback = function(state)
        oreRunning = state
        if not oreRunning then return end

        task.spawn(function()
            local oresFolder = workspace:FindFirstChild("Server")
                and workspace.Server:FindFirstChild("Enemies")
                and workspace.Server.Enemies:FindFirstChild("Ores")
            if not oresFolder then return end

            local function getAliveOres()
                local alive = {}
                for _, v in ipairs(oresFolder:GetChildren()) do
                    if v:IsA("Part") and isOreSelected(v.Name) then
                        local health = v:GetAttribute("Health")
                        if health and health > 0 then
                            table.insert(alive, v)
                        end
                    end
                end
                return alive
            end

            while oreRunning do
                local ores = getAliveOres()
                if #ores == 0 then
                    task.wait(0.5)
                else
                    for _, ore in ipairs(ores) do
                        while oreRunning do
                            local health = ore:GetAttribute("Health")
                            if not health or health <= 0 or not ore.Parent then
                                break
                            end
                            local char = game.Players.LocalPlayer.Character
                            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = ore:GetPivot() + Vector3.new(0, 4, 0)
                            end
                            RunService.Heartbeat:Wait()
                        end
                    end
                end
            end
        end)
    end
})
-- ── Auto Attack + Click ──────────────────────────────────────────────────────
Main_Tab:Toggle({
    Title = "Auto Attack + Click",
    Desc = "Attack all enemies with same name as nearest (all worlds)",
    Value = false,
    Type = "Checkbox",
    Icon = "sword",
    IconSize = 20,
    Callback = function(state)
        AutoAttack = state
        if AutoAttack then
            task.spawn(function()
                local lastTargetName = nil
                while AutoAttack do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local allEnemies = EnemiesUtil.GetEnemiesInRange(hrp.Position, 99999)
                        if #allEnemies == 0 then lastTargetName = nil; return end

                        local closest, minDist = nil, math.huge
                        for _, e in ipairs(allEnemies) do
                            local pos = e.Instance:IsA("BasePart") and e.Instance.Position
                                or (e.Instance:FindFirstChild("HumanoidRootPart") and e.Instance.HumanoidRootPart.Position)
                                or e.Instance:GetPivot().Position
                            local d = (hrp.Position - pos).Magnitude
                            if d < minDist then minDist = d; closest = e.Instance end
                        end
                        if not closest then return end

                        local targetName = closest.Name
                        local targetIds, count = {}, 0
                        for _, e in ipairs(allEnemies) do
                            if e.Instance.Name == targetName then
                                local id = e.Instance:GetAttribute("ID")
                                if id then targetIds[tostring(id)] = true; count = count + 1 end
                            end
                        end

                        if count > 0 then
                            if lastTargetName ~= targetName then
                                print("Attacking " .. targetName .. " | " .. count .. " | " .. math.floor(minDist) .. " studs")
                                lastTargetName = targetName
                            end
                            FireRemote({{{"General","Attack","Click", targetIds, n = 4}, "\002"}})
                        end
                    end)
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- ── Auto Click Only ──────────────────────────────────────────────────────────
Main_Tab:Toggle({
    Title = "Auto Click Only",
    Desc = "Click without targeting an enemy",
    Value = false,
    Type = "Toggle",
    Icon = "mouse-pointer-click",
    IconSize = 20,
    Callback = function(state)
        AutoClickOnly = state
        if AutoClickOnly then
            task.spawn(function()
                while AutoClickOnly do
                    FireRemote({{{"General","Attack","Click",{}, n = 4}, "\002"}})
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- =====================================================
--               TAB: EGGS
-- =====================================================
local Eggs_Tab   = Window:Tab({Title = "Egg", Icon = "egg"})
local EggOptions = TableKeys(EggList)

Eggs_Tab:Dropdown({
    Title = "Select Egg", Desc = "Must be near the star to open",
    Values = EggOptions, Value = EggOptions[1],
    Multi = false, MenuWidth = 180, AllowNone = false, SearchBarEnabled = true,
    Callback = function(option) SelectedEgg = option end
})
local InputFromInput = 10 
Eggs_Tab:Input({
    Title = "Amount To Open ",
    Desc = "Default : 10 ",
    Type = "Input",              -- "Input" (single-line) or "Textarea" (multi-line)
    Placeholder = "10", -- Hint text when empty
    Value = "",                   -- pre-filled text (always a string)
    InputIcon = "user",          -- Lucide icon name inside field (false/nil for none)
    ClearTextOnFocus = true,    -- Auto-clear text when user clicks in
    Width = 150,                 -- Field width in px (only applies to Type = "Input")
    Locked = false,          
    LockedTitle = "Locked",      
    Callback = function(text)    -- Fires on FocusLost (press Enter or click outside)
      InputFromInput = text
    end,
})

Eggs_Tab:Toggle({
    Title = "Auto Star (Open Egg)", Desc = "Must be near the star",
    Value = false, Type = "Toggle", Icon = "egg-fried", IconSize = 20,
    Callback = function(state)
        AutoHatch = state
        if AutoHatch then
            task.spawn(function()
                while AutoHatch do
                    if SelectedEgg then
                        FireRemote({{{"General","Stars","Open", tostring(EggList[SelectedEgg]),tonumber(InputFromInput), n = 5}, "\002"}})
                    end
                    task.wait(EggDelay)
                end
            end)
        end
    end
})
Eggs_Tab:Slider({
    Title = "Open Speed", Desc = "Delay between each open",
    IsTooltip = true, IsTextbox = true, Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 0.1}, Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value) EggDelay = value end
})

-- =====================================================
--               TAB: ROLLS
-- =====================================================
local Rolls_Tab   = Window:Tab({Title = "Roll", Icon = "rotate-ccw"})
local RollOptions = TableKeys(RollList)

Rolls_Tab:Dropdown({
    Title = "Select Roll Type",
    Values = RollOptions, Value = RollOptions[1],
    Multi = false, MenuWidth = 180, AllowNone = false, SearchBarEnabled = true,
    Callback = function(option) SelectedRollType = option end
})
Rolls_Tab:Toggle({
    Title = "Auto Roll", Value = false, Type = "Checkbox", Icon = "rotate-ccw", IconSize = 20,
    Callback = function(state)
        AutoRoll = state
        if AutoRoll then
            task.spawn(function()
                while AutoRoll do
                    if SelectedRollType then
                        FireRemote({{{"General","Gacha","Roll", tostring(RollList[SelectedRollType]), {}, n = 5}, "\002"}})
                    end
                    task.wait(RollDelay)
                end
            end)
        end
    end
})

local Section = Rolls_Tab:Section({
    Title = "Banner",
    TextXAlignment = "Center"
})
 local BannerSelected = "Swords Banner"
local Dropdown = Rolls_Tab:Dropdown({
    Title = "Select Banner",
    Desc = "",
    Values = { "Swords Banner", "Fighters Banner" },
    Value = "Swords Banner",
    Multi = false,
    Locked = false,
    Flag = "my_dropdown",
    Callback = function(selected)
        BannerSelected = selected
    end
})

local BannerRoll = false
local BannerRunning = false -- guard against double loops

local Toggle = Rolls_Tab:Toggle({
    Title = "Auto Roll Banner",
    Desc = "Rolls Selected Banner",
    Icon = "power",
    Value = false,
    Type = "Toggle",
    Color = Color3.fromRGB(100, 200, 100),
    Locked = false,
    Flag = "my_toggle",
    Callback = function(state)
        BannerRoll = state
        if BannerRoll and not BannerRunning then
            BannerRunning = true
            task.spawn(function()
                while BannerRoll do
                    pcall(function()
                        local args = {
                            {
                                {
                                    "General",
                                    "Banner",
                                    "Roll",
                                    BannerSelected,
                                    n = 4
                                },
                                "\002"
                            }
                        }
                        dataRemote:FireServer(unpack(args))
                    end)
                    task.wait(RollDelay)
                end
                BannerRunning = false
            end)
        end
    end
})
Rolls_Tab:Slider({
    Title = "Roll Delay", IsTooltip = true, IsTextbox = true, Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 0.1}, Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value) RollDelay = value end
})

-- =====================================================
--               TAB: TELEPORT
-- =====================================================
local Teleports_Tab = Window:Tab({Title = "Teleport", Icon = "map-pin"})

local function MakeTeleportSection(parent, title, locations)
    local section = parent:Section({
        Title = title, Icon = "map-pin-house", IconThemed = false,
        TextXAlignment = "Left",
        FontWeight = Enum.FontWeight.ExtraBold, DescFontWeight = Enum.FontWeight.Light,
        TextSize = 18, DescTextSize = 14, TextTransparency = 0.05, DescTransparency = 0.35,
        Box = true, BoxBorder = true, Opened = false,
    })
    local options  = TableKeys(locations)
    local selected = nil
    section:Dropdown({
        Title = "Select Location", Desc = title .. " locations",
        Values = options, Value = options[1],
        Multi = false, MenuWidth = 180, AllowNone = false, SearchBarEnabled = true,
        Callback = function(option) selected = option end
    })
    section:Button({
        Title = "Teleport", Icon = "map-pinned", IconThemed = false,
        Color = Color3.fromHex("#a2ff30"), Justify = "Center", IconAlign = "Left",
        Callback = function()
            if not selected then
                WindUI:Notify({Title = "Warning", Content = "Select a location first!", Duration = 2, Icon = "alert-circle"})
                return
            end
            local hrp = GetHRP()
            if hrp then hrp.CFrame = locations[selected] end
        end
    })
end

MakeTeleportSection(Teleports_Tab, "Lobby",           LobbyLocations)
MakeTeleportSection(Teleports_Tab, "Dressrosa",       DressrosaLocations)
MakeTeleportSection(Teleports_Tab, "Marine Fortress", MarineFortressLocations)

-- =====================================================
--               TAB: MISC
-- =====================================================
local Misc_Tab = Window:Tab({Title = "Misc", Icon = "box"})

Misc_Tab:Button({
    Title = "Redeem All Codes", Icon = "ticket-plus", Color = Color3.fromHex("#1d2731"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        for _, code in ipairs(Codes) do
            FireRemote({{{"General","Codes","Redeem", tostring(code), n = 4}, "\002"}})
            task.wait(CodeDelay)
        end
        WindUI:Notify({Title = "Done", Content = "All codes redeemed!", Duration = 3, Icon = "check"})
    end
})
Misc_Tab:Slider({
    Title = "Code Redeem Speed", Desc = "Higher = slower (prevents rate limiting)",
    IsTooltip = true, IsTextbox = true, Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 1}, Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value) CodeDelay = value end
})
Misc_Tab:Button({
    Title = "Claim Daily Chest", Icon = "cuboid", Color = Color3.fromHex("#a2ff30"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        FireRemote({{{"General","Chests","Claim","Daily Chest", n = 4}, "\002"}})
        WindUI:Notify({Title = "Claimed", Content = "Daily chest claimed!", Duration = 3, Icon = "check"})
    end
})

-- ── Accessory info sections ──────────────────────────────────────────────────
local function AccessoryDesc(stat)
    return ("Common: %s +0.5 | Power ×1.05\n"
         .. "Uncommon: %s +0.55 | Power ×1.155\n"
         .. "Rare: %s +0.625 | Power ×1.3125\n"
         .. "Epic: %s +0.7 | Power ×1.47\n"
         .. "Legendary: %s +0.8 | Power ×1.68\n"
         .. "Mythical: %s +0.925 | Power ×1.9425\n"
         .. "Secret: %s +1.25 | Power ×2.625"):format(stat,stat,stat,stat,stat,stat,stat)
end

local function MakeAccessorySection(parent, title, icon, items)
    local sec = parent:Section({
        Title = title, Icon = icon, Box = true, BoxBorder = true, Opened = true,
        FontWeight = Enum.FontWeight.ExtraBold, DescFontWeight = Enum.FontWeight.Light,
        TextSize = 18, DescTextSize = 14,
    })
    for _, item in ipairs(items) do
        sec:Paragraph({
            Title = item[1], Desc = item[2],
            Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
        })
    end
end

MakeAccessorySection(Misc_Tab, "Back Accessories",  "backpack", {
    {"Admiral Cape (Back)", AccessoryDesc("Crystals")},
})
MakeAccessorySection(Misc_Tab, "Head Accessories",  "user",     {
    {"Fire Hat (Head)", AccessoryDesc("Damage")},
})
MakeAccessorySection(Misc_Tab, "Waist Accessories", "anchor",   {
    {"Saiyan Tail (Waist)", AccessoryDesc("Damage")},
})
MakeAccessorySection(Misc_Tab, "Body Accessories",  "shield",   {
    {"Saiyan Armor (Body)", AccessoryDesc("Crystals")},
})
MakeAccessorySection(Misc_Tab, "Mask Accessories",  "eye",      {
    {"Rimuro Mask (Mask)",
        "Common: Damage +0.5 | Power ×1.1\nUncommon: Damage +0.55 | Power ×1.21\n"
      .."Rare: Damage +0.625 | Power ×1.375\nEpic: Damage +0.7 | Power ×1.54\n"
      .."Legendary: Damage +0.8 | Power ×1.76\nMythical: Damage +0.925 | Power ×2.035\n"
      .."Secret: Damage +1.25 | Power ×2.75"},
    {"Oatmeel (Mask)", AccessoryDesc("Crystals")},
    {"Zama Mask (Mask)",
        "Common: Damage +0.75 | Power ×1.075\nUncommon: Damage +0.825 | Power ×1.1825\n"
      .."Rare: Damage +0.9375 | Power ×1.34375\nEpic: Damage +1.05 | Power ×1.505\n"
      .."Legendary: Damage +1.2 | Power ×1.72\nMythical: Damage +1.3875 | Power ×1.98875\n"
      .."Secret: Damage +1.875 | Power ×2.6875"},
})
-- =====================================================
--               TAB: RENAMING
-- =====================================================
local Renaming_Tab = Window:Tab({Title = "Renaming", Icon = "pen-line"})

local Omni = require(game:GetService("ReplicatedStorage"):WaitForChild("Omni"))
local RenamingModule = require(game:GetService("ReplicatedStorage").Omni.Shared.Renaming)

-- ── State ────────────────────────────────────────────────────────────────────
local unitIdMap         = {}
local selectedUnitDisp  = nil
local selectedBuffs     = {}
local selectedMatchMode = "Multi"
local isRenaming        = false

local RenameToggle      = nil

-- ── Helpers ──────────────────────────────────────────────────────────────────
local lastSentName = ""

local function getUniqueName()
    local letters = "abcdefghijklmnopqrstuvwxyz"
    local digits = "0123456789"

    local function randChar(set)
    local i = math.random(1, #set)
    return string.sub(set, i, i)
end

    local name
    local attempts = 0
    repeat
        attempts = attempts + 1
        local len = math.random(5, 8)
        local chars = {}
        -- always start with a letter
        table.insert(chars, randChar(letters))
        -- fill middle with mix of letters and digits
        for i = 2, len - 1 do
            if math.random(1, 2) == 1 then
                table.insert(chars, randChar(letters))
            else
                table.insert(chars, randChar(digits))
            end
        end
        -- always end with a digit (makes it unique-looking)
        table.insert(chars, randChar(digits))
        name = table.concat(chars)
    until name ~= lastSentName or attempts > 50

    lastSentName = name
    return name
end
local function buildUnitValues()
    unitIdMap = {}
    local values = {}
    for unitId, unitData in Omni.Data.Inventory.Units do
        local display = (unitData.CustomName or unitData.Name) .. " [" .. string.sub(unitId, 1, 6) .. "]"
        unitIdMap[display] = unitId
        table.insert(values, display)
    end
    table.sort(values)
    return values
end

local function parseSelectedBuffs()
    local entries = {}
    -- handles both dict {["Power: 1.7+"] = true} and array {"Power: 1.7+"}
    for key, val in pairs(selectedBuffs) do
        local entry = type(key) == "string" and key or (type(val) == "string" and val)
        if entry then table.insert(entries, entry) end
    end
    return entries
end


local function checkCondition(unitData)
    local renameBuffs = unitData.RenameBuffs or {}
    local entries = parseSelectedBuffs()
    if #entries == 0 then return false end

    if selectedMatchMode == "Multi" then
        -- Collapse same stat → take HIGHEST threshold (strictest)
        local needed = {}
        for _, entry in ipairs(entries) do
            local stat, num_str = string.match(entry, "(.+): (.+)%+")
            if stat and num_str then
                local num = tonumber(num_str)
                if num and (not needed[stat] or num > needed[stat]) then
                    needed[stat] = num
                end
            end
        end
        if next(needed) == nil then return false end
        -- ALL stats must meet their threshold
        for stat, threshold in pairs(needed) do
            if not renameBuffs[stat] or renameBuffs[stat] < threshold then
                return false
            end
        end
        return true

    else -- Unique
        -- Stop if ANY single entry threshold is met
        for _, entry in ipairs(entries) do
            local stat, num_str = string.match(entry, "(.+): (.+)%+")
            if stat and num_str then
                local num = tonumber(num_str)
                if num and renameBuffs[stat] and renameBuffs[stat] >= num then
                    return true
                end
            end
        end
        return false
    end
end

local function fireRename(unitId)
    local args = {
        {
            {
                "General", "Units", "Rename",
                unitId,
                getUniqueName(),
                n = 5
            },
            "\002"
        }
    }
    pcall(function()
        ReplicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
    end)
end

local function stopRenaming(reason)
    isRenaming = false
    if RenameToggle then
        pcall(function() RenameToggle:Set(false) end)
    end
    WindUI:Notify({
        Title = "Rename Sniper",
        Content = reason,
        Duration = 6,
        Icon = "pen-line"
    })
end

local function startRenaming()
    isRenaming = true
    task.spawn(function()
        while isRenaming do
            local unitId = selectedUnitDisp and unitIdMap[selectedUnitDisp]
            if not unitId then
                task.wait(0.5)
            else
                local unitData = Omni.Data.Inventory.Units[unitId]
                if not unitData then
                    stopRenaming("Unit no longer in inventory. Stopped.")
                    break
                end
                if checkCondition(unitData) then
                    stopRenaming("✓ Target buff found on " .. (unitData.CustomName or unitData.Name) .. "!")
                    break
                end
                fireRename(unitId)
                task.wait(0.5)
            end
        end
    end)
end

-- ── UI ───────────────────────────────────────────────────────────────────────
local unitValues = buildUnitValues()
selectedUnitDisp = unitValues[1]

local UnitDropdown = Renaming_Tab:Dropdown({
    Title = "Select Unit",
    Desc = "All units in your inventory",
    Values = unitValues,
    Value = unitValues[1],
    Multi = false,
    AllowNone = false,
    SearchBarEnabled = true,
    Flag = "rename_unit",
    Callback = function(selected)
        selectedUnitDisp = selected
    end
})

Renaming_Tab:Button({
    Title = "Refresh Unit List",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        local newValues = buildUnitValues()
        selectedUnitDisp = newValues[1]
        UnitDropdown:Refresh(newValues)
        WindUI:Notify({Title = "Renaming", Content = "Unit list refreshed ("..#newValues.." units)", Duration = 2, Icon = "check"})
    end
})

Renaming_Tab:Dropdown({
    Title = "Target Buffs",
    Desc = "Pick buffs to hunt. Highest value wins if same stat selected twice",
    Values = {
        "Power: 1.1+", "Power: 1.2+", "Power: 1.3+",
        "Power: 1.4+", "Power: 1.5+", "Power: 1.6+", "Power: 1.7+",
        "Damage: 0.1+", "Damage: 0.2+", "Damage: 0.3+",
        "Damage: 0.4+", "Damage: 0.5+", "Damage: 0.6+", "Damage: 0.7+",
        "Crystals: 0.1+", "Crystals: 0.2+", "Crystals: 0.3+",
        "Crystals: 0.4+", "Crystals: 0.5+", "Crystals: 0.6+", "Crystals: 0.7+",
    },
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    Flag = "rename_buffs",
    Callback = function(selected)
        selectedBuffs = selected
    end
})

Renaming_Tab:Dropdown({
    Title = "Match Mode",
    Desc = "Multi = stop when ALL chosen buffs found | Unique = stop when ANY one buff found",
    Values = {"Multi", "Unique"},
    Value = "Multi",
    Multi = false,
    AllowNone = false,
    Flag = "rename_mode",
    Callback = function(selected)
        selectedMatchMode = selected
    end
})

RenameToggle = Renaming_Tab:Toggle({
    Title = "Rename Sniper",
    Desc = "Auto-renames unit until target buff(s) appear then stops",
    Icon = "pen-line",
    Value = false,
    Flag = "rename_toggle",
    Callback = function(state)
        if state then
            if not selectedUnitDisp then
                WindUI:Notify({Title = "Rename Sniper", Content = "Select a unit first!", Duration = 3, Icon = "alert-circle"})
                pcall(function() RenameToggle:Set(false) end)
                return
            end
            if #selectedBuffs == 0 then
                WindUI:Notify({Title = "Rename Sniper", Content = "Select at least one target buff!", Duration = 3, Icon = "alert-circle"})
                pcall(function() RenameToggle:Set(false) end)
                return
            end
            WindUI:Notify({Title = "Rename Sniper", Content = "Started hunting on " .. selectedUnitDisp, Duration = 3, Icon = "pen-line"})
            startRenaming()
        else
            isRenaming = false
        end
    end
})
-- =====================================================
--               TAB: GAMEMODE
-- =====================================================
local Gamemode_Tab = Window:Tab({Title = "Gamemode", Icon = "swords"})

-- Safe wave getter
local function getWave()
    local ok, result = pcall(function()
        return game:GetService("Players").LocalPlayer
            .PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Main.Wave.Value
    end)
    return ok and result or nil
end

local function joinArgs()
    return {{{ "General", "Gamemodes", "Join", "Tempest Invasion", n = 4 }, "\002"}}
end
local function leaveArgs()
    return {{{ "General", "Gamemodes", "Leave", "Tempest Invasion", n = 4 }, "\002"}}
end

local wave_to_leave_at = 27
Gamemode_Tab:Input({
    Title = "Leave At Wave :",
    Desc = "Once reached, auto-leave triggers",
    Type = "Input",
    Placeholder = "27",
    Value = "",
    InputIcon = "hash",
    ClearTextOnFocus = false,
    Width = 150,
    Callback = function(text)
        wave_to_leave_at = tonumber(text) or wave_to_leave_at
    end,
})

local Autojoin = false
Gamemode_Tab:Toggle({
    Title = "Tempest Invasion / Auto Join",
    Value = false,
    Type = "Toggle",
    Icon = "zap",
    IconSize = 20,
    Callback = function(state)
        Autojoin = state
        if Autojoin then
            task.spawn(function()
                FireRemote(joinArgs())
                while Autojoin do
                    task.wait(1)
                    local w = getWave()
                    local targetText = tostring(wave_to_leave_at) .. " / 100"
                    if w and w.Text == targetText then
                        task.wait(15)
                        while Autojoin do
                            local w2 = getWave()
                            if not w2 or w2.Text ~= targetText then
                                if w2 and w2.Text == "1 / 100" then
                                    task.wait(5)
                                    local w3 = getWave()
                                    if w3 and w3.Text == "1 / 100" then
                                        FireRemote(joinArgs())
                                    end
                                end
                                break
                            end
                            FireRemote(joinArgs())
                            task.wait(2)
                        end
                    end
                end
            end)
        end
    end
})

local leave_at_wave = false
Gamemode_Tab:Toggle({
    Title = "Tempest Invasion\nLeave At Wave :",
    Value = false,
    Type = "Toggle",
    Icon = "log-out",
    IconSize = 20,
    Callback = function(state)
        leave_at_wave = state
        if leave_at_wave then
            task.spawn(function()
                while leave_at_wave do
                    task.wait(1)
                    local w = getWave()
                    if w and w.Text == tostring(wave_to_leave_at) .. " / 100" then
                        FireRemote(leaveArgs())
                        task.wait(5)
                    end
                end
            end)
        end
    end
})

-- =====================================================
-- =====================================================
--               SETTINGS TAB
-- =====================================================
Window:Divider()
local SettingsTab = Window:Tab({Title = "Settings",Desc = "Change Themes",Icon = "bolt",IconThemed = false,Locked = false,ShowTabTitle = true,Border = true,TabTitleAlign = "Left",CustomEmptyPage = {Title = "This is a cool empty tab",Desc = "I like it. its so great tab with cool 'custom empty page'",Icon = "lucide:smile",},})

local Themes_Dropdown = SettingsTab:Dropdown({
    Title = "Select Theme ",
    Desc = "Default : Midnight",
    Values = {
        "Dark",
        "Light",
        "Rose",
        "Plant",
        "Red",
        "Indigo",
        "Sky",
        "Violet",
        "Amber",
        "Emerald",
        "Midnight",
        "Crimson",
        "MonokaiPro",
        "CottonCandy",
        "Mellowsi",
    },
    Value = "Midnight",
    AllowNone = false, 
    SearchBarEnabled = true, 
    Multi = false,
    Locked = false,
    Flag = "Themes_dropdown",
    Callback = function(selected)
      WindUI:SetTheme(selected)
        Notify("Notify","Theme Changed To"..selected,2,"bell-check")
    end
})

local Section_All_Themes = SettingsTab:Section({
    Title = "Available Themes",
    Desc = "You Could Search it Up in the Dropdown ", -- optional
    Icon = "", -- lucide icon or "rbxassetid://". optional
    IconColor = colorz["DarkBlue"], -- custom icon color. optional
    TextSize = 19, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4, -- description transparency. optional
})


Section_All_Themes:Paragraph({
    Title = "All The Themes ",
    Desc ="Dark\nLight\nRose\nPlant\nRed\nIndigo\nSky\nViolet\nAmber\nEmerald\nMidnight\nCrimson\nMonokaiPro\nCottonCandy\nMellowsi",
    Image = "",
    ImageSize = 2,
    Thumbnail = "rbxassetid://16360998387",
    ThumbnailSize = 250,
    Color = colorz["Black ish"],
    
})

 SettingsTab:Slider({
    Title = "Background Transparency ",
    Desc = "0 - Clear\n 1 - Transparent ", -- optional
    Value = {
        Min = 0, -- minimum value
        Max = 1, -- maximum value
        Default = 0-- initial value
    },
    Step = 0.1, -- increment step (use 0.1 for floats). optional
    Width = 100, 
    Locked = false, -- disable slider. optional
    Flag = "Background_Transpercay", -- for config saving. optional
    Callback = function(value)
      Window:SetBackgroundTransparency(value)
    end
})

SettingsTab:Button({
    Title = "Destroy Window",
    Callback = function()
        Window:Destroy()
    end
})
SettingsTab:Button({
    Title = "Move Window To Center ",
    Callback = function()
        Window:SetToTheCenter()
    end
})
-- =====================================================
-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")

-- Helpers
local function PlayerHrp()
    local char = Players.LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

local function FindBoss(name)
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == name then
            local part = (v.PrimaryPart or v:FindFirstChild("HumanoidRootPart"))
            if part then return part end
        end
    end
    return nil
end

local function ServerHop()
    TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
end

-- State
local Selected_Global_Boss = "Satoro"
local Toggle_On = false
local HeartbeatConn = nil
local HopDelay = 5  -- default, controlled by slider

-- Slider
local Slider = SettingsTab:Slider({
    Title = "Hop Delay (seconds)",
    Desc = "How long to wait before server hopping if boss isn't found",
    Locked = false,
    IsTooltip = true,
    IsTextbox = true,
    Step = 1,
    Value = {
        Min = 1,
        Max = 30,
        Default = 5,
    },
    Width = 140,
    Icons = {
        From = "sfsymbols:minusCircleFill",
        To = "sfsymbols:plusCircleFill",
    },
    Callback = function(value)
        HopDelay = value
    end
})

-- Dropdown
local Global_Boss_Dropdown = SettingsTab:Dropdown({
    Title = "Select Boss",
    Desc = "",
    Values = {"Sakana", "Yuje", "Satoro"},
    Value = "Satoro",
    AllowNone = false,
    SearchBarEnabled = true,
    Multi = false,
    Locked = false,
    Flag = "Themes_dropdown",
    Callback = function(selected)
        Selected_Global_Boss = selected
    end
})

-- Toggle
local Toggle = SettingsTab:Toggle({
    Title = "Auto Teleport Boss",
    Callback = function(state)
        Toggle_On = state

        if HeartbeatConn then
            HeartbeatConn:Disconnect()
            HeartbeatConn = nil
        end

        if not Toggle_On then return end

        local hopCooldown = false
        local notFoundTimer = 0

        HeartbeatConn = RunService.Heartbeat:Connect(function(dt)
            if not Toggle_On then return end

            local hrp = PlayerHrp()
            if not hrp then return end

            local bossPart = FindBoss(Selected_Global_Boss)

            if bossPart then
                hrp.CFrame = bossPart.CFrame + Vector3.new(0, 3, 0)
                notFoundTimer = 0
            else
                notFoundTimer = notFoundTimer + dt
                if notFoundTimer >= HopDelay and not hopCooldown then
                    hopCooldown = true
                    warn("Boss not found after " .. HopDelay .. "s. Server hopping...")
                    task.delay(1, function()
                        ServerHop()
                    end)
                end
            end
        end)
    end
})
-- =====================================================
-- =====================================================
--  SWORD FORGE (with live ore counts + refresh)
-- =====================================================
local SwordRecipes = {
    ["Sand Dagger"] = {
        { item = "Blue Ore",        need = 125 },
        { item = "Yellow Ore",      need = 75  },
        { item = "Green Ore",       need = 100 },
        { item = "Architect Token", need = 100 },
    },
    ["Fire Dagger"] = {
        { item = "Red Ore",         need = 200 },
        { item = "Yellow Ore",      need = 125 },
        { item = "Orange Ore",      need = 100 },
        { item = "Architect Token", need = 250 },
    },
    ["Commander Sword"] = {
        { item = "Red Ore",         need = 100 },
        { item = "Yellow Ore",      need = 200 },
        { item = "Orange Ore",      need = 250 },
        { item = "Architect Token", need = 750 },
    },
    ["Shadow Sword"] = {
        { item = "Red Ore",         need = 175 },
        { item = "Blue Ore",        need = 350 },
        { item = "Purple Ore",      need = 250 },
        { item = "Architect Token", need = 2000 },
    },
}

local function GetItemCount(itemName)
    local ok, count = pcall(function()
        return Omni.Data.Inventory.Items[itemName] or 0
    end)
    return ok and (count or 0) or 0
end

local function BuildForgeDesc(swordName)
    local recipe = SwordRecipes[swordName]
    if not recipe then return "No recipe found." end

    local lines = {}
    local canCraft = true
    for _, entry in ipairs(recipe) do
        local have = GetItemCount(entry.item)
        local need = entry.need
        local status = have >= need and "✓" or "✗"
        if have < need then canCraft = false end
        table.insert(lines, string.format("%s %s: %d / %d", status, entry.item, have, need))
    end

    local header = canCraft and "[ CAN CRAFT ✓ ]" or "[ MISSING MATERIALS ✗ ]"
    return header .. "\n" .. table.concat(lines, "\n")
end

local Forge_Swords_Paragraph = SettingsTab:Paragraph({
    Title = "Sword Forge",
    Desc = "Select a sword from the dropdown",
    Color = Color3.fromRGB(102, 102, 102),
})

local currentSword = nil

local function RefreshForge()
    if not currentSword then return end
    Forge_Swords_Paragraph:SetTitle(currentSword)
    Forge_Swords_Paragraph:SetDesc(BuildForgeDesc(currentSword))
end

local Forge_Dropdown = SettingsTab:Dropdown({
    Title = "Select Sword",
    Values = { "Sand Dagger", "Fire Dagger", "Commander Sword", "Shadow Sword" },
    Value = "Sand Dagger",
    Multi = false,
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(option)
        currentSword = option
        RefreshForge()
    end
})

SettingsTab:Button({
    Title = "Refresh Ore Counts",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        RefreshForge()
        WindUI:Notify({ Title = "Forge", Content = "Ore counts refreshed!", Duration = 2, Icon = "check" })
    end
})

-- =====================================================
WindUI:Notify({Title = "World Fighters", Content = "Script loaded!", Duration = 3, Icon = "info"})




