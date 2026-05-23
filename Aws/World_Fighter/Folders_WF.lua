--[[
         World Fighters Hub  |  Using Folders 

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]

-- =====================================================
--               ★ CONFIG (EDIT HERE) ★
-- =====================================================
-- Add new enemy folder paths here
local EnemyFolderPaths = {
    {"Server", "Enemies"},
    {"Server", "Enemies", "Gamemodes"},
    {"Server", "Enemies", "Templates"},
    {"Server", "Enemies", "World"},
    {"Server", "Enemies", "Gamemodes", "Dragon Defense"},
    {"Server", "Enemies", "Gamemodes", "Test Raid"},
    {"Server", "Enemies", "Gamemodes", "Trial Easy"},
    {"Server", "Enemies", "Gamemodes", "Trial Hard"},
    {"Server", "Enemies", "Gamemodes", "Trial Medium"},
    {"Server", "Enemies", "Templates", "Test Raid"},
    {"Server", "Enemies", "World", "Fruits Verse"},
    {"Server", "Enemies", "World", "Dragon Verse"},
    {"Server", "Enemies", "World", "Slime Verse"},
    {"Server", "Enemies", "World", "Fruits Verse", "1"},
    {"Server", "Enemies", "World", "Fruits Verse", "2"},
    {"Server", "Enemies", "World", "Dragon Verse", "1"},
    {"Server", "Enemies", "World", "Dragon Verse", "2"},
    {"Server", "Enemies", "World", "Slime Verse", "1"},
    {"Server", "Enemies", "World", "Slime Verse", "2"},
    {"Server", "Enemies", "World", "Cursed Verse", "1"},
    {"Server", "Enemies", "World", "Cursed Verse", "2"},
    {"Server", "Enemies", "World", "Leveling Verse", "1"},
    {"Server", "Enemies", "World", "Leveling Verse", "2"},
    {"Server", "Enemies", "World", "Hollow Verse", "1"},
    {"Server", "Enemies", "World", "Hollow Verse", "2"},
    {"Server", "Enemies", "World", "Bizarre Verse", "1"},
}

-- Add new eggs here: ["Display Name"] = "Remote Value"
local EggList = {
    ["Dressrosa [Zone 1]"]      = "Dressrosa",
    ["Marine Fortress [Zone 2]"] = "Marine Fortress",
    ["Capsule Corp [Zone 3]"] = "Capsule Corp",
    ["Dragon Arena [Zone 4]"] = "Dragon Arena",
    ["Jura Forest [Zone 5]"] = "Jura Forest",
}

-- Add new roll types here: ["Display Name"] = "Remote Value"
local RollList = {
    ["Haki [Zone 1]"] = "Haki",
    ["Fruit [Zone 2]"] = "Fruit",
    ["Race [Zone 3]"] = "Race",
    ["Slime Power [Zone 4]"] = "Slime Power",
    ["Dojutsu [Zone ??] Not Ingame Yet"] = "Dojutsu",
    ["Ninja Clan [Zone ??] Not Ingame Yet"] = "Ninja Clan",
}

-- Add new lobby locations here: ["Name"] = CFrame.new(...)
local LobbyLocations = {
    ["Lobby"]          = CFrame.new(27465.773438, 787.311218, -15845.648438, -0.191700, 0.000000, -0.981454, 0.000000, 1.000000, 0.000000, 0.981454, -0.000000, -0.191700),
    ["Trial Upgrades"] = CFrame.new(27413.400391, 787.219666, -15831.536133, -0.885915, 0.000000, -0.463849, 0.000000, 1.000000, 0.000000, 0.463849, 0.000000, -0.885915),
}

-- Add new Dressrosa locations here: ["Name"] = CFrame.new(...)
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
  ["Star"] = CFrame.new(11747.207031, -11.384936, -23350.462891, -0.252081, -0.000000, -0.967706, 0.000000, 1.000000, -0.000000, 0.967706, -0.000000, -0.252081), -- Star ,
  ["Fighting Style"] = CFrame.new(11944.705078, -11.990705, -23256.228516, -0.793967, 0.000000, 0.607961, 0.000000, 1.000000, -0.000000, -0.607961, 0.000000, -0.793967),-- Fighting Style,
  ["Fruits"] = CFrame.new(11780.607422, -11.385138, -23359.361328, -0.788605, 0.000000, 0.614900, 0.000000, 1.000000, 0.000000, -0.614900, 0.000000, -0.788605), -- Fruits ,
  ["Pirates Evolution ( skill Tree ) "] = CFrame.new(11705.627930, -16.190359, -23279.669922, -0.421055, 0.000000, -0.907035, -0.000000, 1.000000, 0.000000, 0.907035, 0.000000, -0.421055) ,-- Pirates Evolution ( skill Tree ) ,
  ["Swords Banner"] = CFrame.new(11575.189453, -11.507523, -23171.662109, 0.926952, 0.000000, -0.375180, -0.000000, 1.000000, 0.000000, 0.375180, -0.000000, 0.926952), -- Swords Banner,
  ["Marine Fortress"] = CFrame.new(11757.931641, -11.113531, -23234.021484, 0.933668, 0.000000, -0.358140, -0.000000, 1.000000, 0.000000, 0.358140, -0.000000, 0.933668), -- Map,
  
  
}
-- Add new codes here
local Codes = {
    "RELEASE", "SRRY4SHUTDOWN", "SRRY4SHUTDOWN2", "TIOGADIHIT",
    "THX1KCCU", "2KCCU!", "THANKYOU3KCCU", "4KONCHAMBER!",
    "ALREADY5K?", "6KTHXSOMUCH", "7KISALOT!", "THANKS1KLIKES",
    "100KVISITSONCHAMBER!", "SRRY4SHUTDOWN3",
}

-- =====================================================
--               SERVICES & SETUP
-- =====================================================
local Players          = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer      = Players.LocalPlayer

local dataRemote = ReplicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- =====================================================
--               WINDOW SETUP
-- =====================================================
local Window = WindUI:CreateWindow({
    Title = "World Fighters",
    Icon = "house",
    Author = "by Me",
    Folder = "MySuperHub",
    Topbar = { Height = 52, ButtonsType = "Mac" },
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
Window:Tag({Title = "V1",Icon = "award",Color = Color3.fromHex("#0d3154"),Radius = 9,})
Window:EditOpenButton({Title = "World Fighters",Icon = "axe",CornerRadius = UDim.new(0, 16),StrokeThickness = 2,Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),OnlyMobile = false,Enabled = true,Draggable = true,})
-- =====================================================
--               STATE VARIABLES (Updated)
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
--               HELPER FUNCTIONS (Updated)
-- =====================================================

-- Returns the player's HumanoidRootPart or nil
local function GetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

-- Returns all enemy folders that actually exist in workspace
local function GetAllEnemyFolders()
    local folders = {}
    for _, path in ipairs(EnemyFolderPaths) do
        local current = workspace
        local valid = true
        for _, part in ipairs(path) do
            current = current:FindFirstChild(part)
            if not current then
                valid = false
                break
            end
        end
        if valid then
            table.insert(folders, current)
        end
    end
    return foldersend
end
local function IsSelectedEnemy(name)
    for _, v in ipairs(SelectedEnemies) do
        if v == name then return true end
    end
    return false
end

local function IsPriorityEnemy(name)
    for _, v in ipairs(PriorityEnemies) do
        if v == name then return true end
    end
    return false
end

-- Returns all BasePart enemies (with ID attribute) across all folders
local function GetAllEnemies()
    local enemies = {}
    local folders = GetAllEnemyFolders()
    for _, folder in ipairs(folders) do
        if folder:IsA("BasePart") and folder:GetAttribute("ID") then
            table.insert(enemies, folder)
        end
        for _, child in ipairs(folder:GetChildren()) do
            if child:IsA("BasePart") and child:GetAttribute("ID") then
                table.insert(enemies, child)
            end
        end
    end
    return enemies
end

-- Returns unique enemy names for the dropdown
local function GetEnemyNames()
    local names = {}
    local seen = {}
    for _, enemy in ipairs(GetAllEnemies()) do
        if not seen[enemy.Name] then
            seen[enemy.Name] = true
            table.insert(names, enemy.Name)
        end
    end
    return names
end

-- Returns the nearest enemy to the player (folder-based)
local function GetNearestEnemy()
    local hrp = GetHRP()
    if not hrp then return nil end    local enemies = GetAllEnemies()
    if #enemies == 0 then return nil end
    local nearest = nil
    local nearestDist = math.huge
    local hrpPos = hrp.Position
    for _, enemy in ipairs(enemies) do
        if enemy:IsA("BasePart") and enemy:GetAttribute("ID") then
            local dist = (hrpPos - enemy.Position).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearest = enemy
            end
        end
    end
    return nearest
end

-- ── Gamemode enemy helper (folder-based) ─────────────────────────────────────
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

-- Builds a flat list of keys from a table (for dropdowns)
local function TableKeys(t)
    local keys = {}    for k in pairs(t) do
        table.insert(keys, k)
    end
    return keys
end

-- Fires the dataRemote with the given args table
local function FireRemote(args)
    pcall(function()
        dataRemote:FireServer(unpack(args))
    end)
end

-- ── Ping-adaptive throttle ───────────────────────────────────────────────────
-- Returns a small wait when ping is high so the server doesn't reject CFrame sets.
local function AdaptiveWait()
    local ping = 0
    pcall(function()
        ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    if ping > 250 then
        task.wait(0.15)
    elseif ping > 150 then
        task.wait(0.05)
    else
        RunService.Heartbeat:Wait()
    end
end

-- ── PlayerArea range helpers ─────────────────────────────────────────────────
-- PlayerArea lives at workspace.Cache.PlayerArea
local function GetPlayerArea()
    local cache = workspace:FindFirstChild("Cache")
    return cache and cache:FindFirstChild("PlayerArea")
end

-- IsInPlayerArea: checks if worldPos is inside the 45×45 PlayerArea part.
local function IsInPlayerArea(worldPos)
    local pa = GetPlayerArea()
    if not pa then return true end
    local half = pa.Size / 2
    local local_p = pa.CFrame:PointToObjectSpace(worldPos)
    return math.abs(local_p.X) <= half.X
       and math.abs(local_p.Z) <= half.Z
end

-- GetClusterCenter: average position of a list of Vector3s. Returns nil if empty.
local function GetClusterCenter(positions)
    if #positions == 0 then return nil end
    local sum = Vector3.new(0, 0, 0)    for _, p in ipairs(positions) do sum = sum + p end
    return sum / #positions
end

-- GetClusterPositionsInArea: returns positions of alive enemies inside PlayerArea
-- that match the optional filter function.
local function GetClusterPositionsInArea(filter)
    local hrp = GetHRP()
    if not hrp then return {} end
    local positions = {}
    for _, enemy in ipairs(GetAllEnemies()) do
        local passes = (filter == nil) or filter(enemy.Name)
        if passes and IsInPlayerArea(enemy.Position) then
            local health = enemy:GetAttribute("Health")
            local died = enemy:GetAttribute("Died")
            local respawning = enemy:GetAttribute("Respawning")
            local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
            if isAlive then
                table.insert(positions, enemy.Position)
            end
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
local PrioritySection = Main_Tab:Section({    Title = "Priority System",
    Icon = "list-ordered",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

local PriorityLabel

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
    Multi = true,
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
    Title = "Clear Priority List",    Icon = "trash-2",
    Color = Color3.fromHex("#ef4444"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        PriorityEnemies = {}
        PriorityDropdown:Refresh(GetEnemyNames())
        RefreshPriorityLabel()
        WindUI:Notify({Title = "Priority", Content = "Priority list cleared", Duration = 2, Icon = "check"})
    end
})

-- ── Refresh enemies ──────────────────────────────────────────────────────────
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all folders for new enemies",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center",
    IconAlign = "Left",
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

-- ── Auto Farm (with Priority + Smart Farm support) ───────────────────────────
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
                                hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
                            else
                                -- Fallback: closest priority enemy anywhere, then selected
                                local allEnemies = GetAllEnemies()
                                local found, bestDist = nil, math.huge

                                for _, enemy in ipairs(allEnemies) do
                                    if IsPriorityEnemy(enemy.Name) then
                                        local health = enemy:GetAttribute("Health")
                                        local died = enemy:GetAttribute("Died")
                                        local respawning = enemy:GetAttribute("Respawning")
                                        local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
                                        if isAlive then
                                            local d = (hrp.Position - enemy.Position).Magnitude
                                            if d < bestDist then bestDist = d; found = enemy end
                                        end
                                    end
                                end
                                if not found then
                                    bestDist = math.huge
                                    for _, enemy in ipairs(allEnemies) do
                                        if IsSelectedEnemy(enemy.Name) and not IsPriorityEnemy(enemy.Name) then
                                            local health = enemy:GetAttribute("Health")
                                            local died = enemy:GetAttribute("Died")
                                            local respawning = enemy:GetAttribute("Respawning")
                                            local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
                                            if isAlive then
                                                local d = (hrp.Position - enemy.Position).Magnitude
                                                if d < bestDist then bestDist = d; found = enemy end
                                            end
                                        end
                                    end
                                end

                                if found then
                                    hrp.CFrame = found.CFrame * CFrame.new(0, 5, 0)
                                else
                                    task.wait(2)
                                end
                            end
                            lastEnemy = nil
                        -- ── NORMAL MODE ──────────────────────────────
                        else
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

                            if not lastEnemy then
                                if #SelectedEnemies == 0 and #PriorityEnemies == 0 then
                                    task.wait(0.1)
                                else
                                    local allEnemies = GetAllEnemies()
                                    local found, bestDist = nil, math.huge

                                    -- Priority enemies first (closest)
                                    for _, enemy in ipairs(allEnemies) do
                                        if IsPriorityEnemy(enemy.Name) then
                                            local health = enemy:GetAttribute("Health")
                                            local died = enemy:GetAttribute("Died")
                                            local respawning = enemy:GetAttribute("Respawning")
                                            local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
                                            if isAlive then
                                                local d = (hrp.Position - enemy.Position).Magnitude
                                                if d < bestDist then bestDist = d; found = enemy end
                                            end
                                        end
                                    end
                                    -- Then selected enemies (closest)
                                    if not found then
                                        bestDist = math.huge
                                        for _, enemy in ipairs(allEnemies) do
                                            if IsSelectedEnemy(enemy.Name) and not IsPriorityEnemy(enemy.Name) then
                                                local health = enemy:GetAttribute("Health")
                                                local died = enemy:GetAttribute("Died")
                                                local respawning = enemy:GetAttribute("Respawning")
                                                local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
                                                if isAlive then
                                                    local d = (hrp.Position - enemy.Position).Magnitude
                                                    if d < bestDist then bestDist = d; found = enemy end
                                                end
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
Main_Tab:Toggle({    Title = "Auto Teleport Nearest Enemy",
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
                            local positions = GetClusterPositionsInArea(nil)
                            local center = GetClusterCenter(positions)
                            if center then
                                hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
                            else
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
    Desc = "Snaps to closest part in workspace.Server.Enemies.Gamemodes",
    Value = false,
    Type = "Checkbox",
    Icon = "swords",
    IconSize = 20,
    Callback = function(state)
        AutoTeleportGamemodes = state
        if AutoTeleportGamemodes then
            task.spawn(function()
                while AutoTeleportGamemodes do
                    pcall(function()                        local hrp = GetHRP()
                        if not hrp then return end
                        local target = GetNearestGamemodeEnemy()
                        if target then
                            hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 5, 0))
                        end
                    end)
                    AdaptiveWait()
                end
            end)
        end
    end
})

-- ── Auto Farm Ores ───────────────────────────────────────────────────────────
local selectedOres = {}
local oreRunning = false

local OreDropdown = Main_Tab:Dropdown({
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

Main_Tab:Toggle({
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
                            local char = LocalPlayer.Character
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
        if AutoAttack then            task.spawn(function()
                local lastTargetName = nil
                while AutoAttack do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local allEnemies = GetAllEnemies()
                        if #allEnemies == 0 then lastTargetName = nil; return end

                        local closest, minDist = nil, math.huge
                        for _, e in ipairs(allEnemies) do
                            if e:IsA("BasePart") and e:GetAttribute("ID") then
                                local d = (hrp.Position - e.Position).Magnitude
                                if d < minDist then minDist = d; closest = e end
                            end
                        end
                        if not closest then return end

                        local targetName = closest.Name
                        local targetIds, count = {}, 0
                        for _, e in ipairs(allEnemies) do
                            if e.Name == targetName and e:GetAttribute("ID") then
                                targetIds[tostring(e:GetAttribute("ID"))] = true
                                count = count + 1
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
    IconSize = 20,    Callback = function(state)
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
local Eggs_Tab = Window:Tab({Title = "Egg", Icon = "egg"})

local EggOptions = TableKeys(EggList)

Eggs_Tab:Dropdown({
    Title = "Select Egg",
    Desc = "Must be near the star to open",
    Values = EggOptions,
    Value = EggOptions[1],
    Multi = false,
    MenuWidth = 180,
    AllowNone = false,
    SearchBarEnabled = true,
    Callback = function(option)
        SelectedEgg = option
    end
})

Eggs_Tab:Toggle({
    Title = "Auto Star (Open Egg)",
    Desc = "Must be near the star",
    Value = false,
    Type = "Toggle",
    Icon = "egg-fried",
    IconSize = 20,
    Callback = function(state)
        AutoHatch = state
        if AutoHatch then
            task.spawn(function()
                while AutoHatch do
                    if SelectedEgg then
                        FireRemote({{{"General","Stars","Open", tostring(EggList[SelectedEgg]), 3, n = 5}, "\002"}})
                    end
                    task.wait(EggDelay)
                end
            end)
        end
    end
})

Eggs_Tab:Slider({
    Title = "Open Speed",
    Desc = "Delay between each open",
    IsTooltip = true,
    IsTextbox = true,
    Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 0.1},
    Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value)
        EggDelay = value
    end
})

-- =====================================================
--               TAB: ROLLS
-- =====================================================
local Rolls_Tab = Window:Tab({Title = "Roll", Icon = "rotate-ccw"})

local RollOptions = TableKeys(RollList)

Rolls_Tab:Dropdown({
    Title = "Select Roll Type",
    Desc = "",
    Values = RollOptions,
    Value = RollOptions[1],
    Multi = false,
    MenuWidth = 180,
    AllowNone = false,
    SearchBarEnabled = true,
    Callback = function(option)
        SelectedRollType = option
    end
})

Rolls_Tab:Toggle({
    Title = "Auto Roll",
    Desc = "",
    Value = false,
    Type = "Checkbox",
    Icon = "rotate-ccw",
    IconSize = 20,
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

Rolls_Tab:Slider({
    Title = "Roll Delay",
    Desc = "",
    IsTooltip = true,
    IsTextbox = true,
    Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 0.1},
    Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value)
        RollDelay = value
    end
})

-- =====================================================
--               TAB: TELEPORT
-- =====================================================
local Teleports_Tab = Window:Tab({Title = "Teleport", Icon = "map-pin"})

-- Reusable function to build a teleport section
local function MakeTeleportSection(parent, title, locations)
    local section = parent:Section({
        Title = title,
        Icon = "map-pin-house",
        IconThemed = false,
        TextXAlignment = "Left",
        FontWeight = Enum.FontWeight.ExtraBold,
        DescFontWeight = Enum.FontWeight.Light,
        TextSize = 18,
        DescTextSize = 14,
        TextTransparency = 0.05,
        DescTextTransparency = 0.35,
        Box = true,
        BoxBorder = true,
        Opened = false,
    })

    local options = TableKeys(locations)
    local selected = nil

    section:Dropdown({
        Title = "Select Location",
        Desc = title .. " locations",
        Values = options,
        Value = options[1],
        Multi = false,
        MenuWidth = 180,
        AllowNone = false,
        SearchBarEnabled = true,
        Callback = function(option)
            selected = option
        end
    })

    section:Button({
        Title = "Teleport",
        Icon = "map-pinned",
        IconThemed = false,
        Color = Color3.fromHex("#a2ff30"),
        Justify = "Center",
        IconAlign = "Left",
        Callback = function()
            if not selected then
                WindUI:Notify({Title = "Warning", Content = "Select a location first!", Duration = 2, Icon = "alert-circle"})
                return
            end
            local hrp = GetHRP()
            if hrp then
                hrp.CFrame = locations[selected]
            end
        end
    })
end

-- Add new zones by just adding a line here
MakeTeleportSection(Teleports_Tab, "Lobby",     LobbyLocations)
MakeTeleportSection(Teleports_Tab, "Dressrosa", DressrosaLocations)
MakeTeleportSection(Teleports_Tab, "Marine Fortress", MarineFortressLocations)

-- =====================================================
--               TAB: MISC
-- =====================================================
local Misc_Tab = Window:Tab({Title = "Misc", Icon = "box"})

Misc_Tab:Button({
    Title = "Redeem All Codes",
    Icon = "ticket-plus",
    Color = Color3.fromHex("#1d2731"),
    Justify = "Center",
    IconAlign = "Left",
    Callback = function()
        for _, code in ipairs(Codes) do
            FireRemote({{{"General","Codes","Redeem", tostring(code), n = 4}, "\002"}})
            task.wait(CodeDelay)
        end
        WindUI:Notify({Title = "Done", Content = "All codes redeemed!", Duration = 3, Icon = "check"})
    end
})

Misc_Tab:Slider({
    Title = "Code Redeem Speed",
    Desc = "Higher = slower (prevents rate limiting)",
    IsTooltip = true,
    IsTextbox = true,
    Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 1},
    Width = 140,
    Icons = {From = "minus", To = "plus"},
    Callback = function(value)
        CodeDelay = value
    end
})

Misc_Tab:Button({
    Title = "Claim Daily Chest",
    Icon = "cuboid",
    Color = Color3.fromHex("#a2ff30"),
    Justify = "Center",
    IconAlign = "Left",
    Callback = function()
        FireRemote({{{"General","Chests","Claim","Daily Chest", n = 4}, "\002"}})
        WindUI:Notify({Title = "Claimed", Content = "Daily chest claimed!", Duration = 3, Icon = "check"})
    end
})
local BackSection = Misc_Tab:Section({
    Title = "Back Accessories",
    Icon = "backpack",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

BackSection:Paragraph({
    Title = "Admiral Cape (Back)",
    Desc = "Common: Crystals +0.5 | Power ×1.05\nUncommon: Crystals +0.55 | Power ×1.155\nRare: Crystals +0.625 | Power ×1.3125\nEpic: Crystals +0.7 | Power ×1.47\nLegendary: Crystals +0.8 | Power ×1.68\nMythical: Crystals +0.925 | Power ×1.9425\nSecret: Crystals +1.25 | Power ×2.625",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

local HeadSection = Misc_Tab:Section({
    Title = "Head Accessories",
    Icon = "user",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

HeadSection:Paragraph({
    Title = "Fire Hat (Head)",
    Desc = "Common: Damage +0.5 | Power ×1.05\nUncommon: Damage +0.55 | Power ×1.155\nRare: Damage +0.625 | Power ×1.3125\nEpic: Damage +0.7 | Power ×1.47\nLegendary: Damage +0.8 | Power ×1.68\nMythical: Damage +0.925 | Power ×1.9425\nSecret: Damage +1.25 | Power ×2.625",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

local WaistSection = Misc_Tab:Section({
    Title = "Waist Accessories",
    Icon = "anchor",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

WaistSection:Paragraph({
    Title = "Saiyan Tail (Waist)",
    Desc = "Common: Damage +0.5 | Power ×1.05\nUncommon: Damage +0.55 | Power ×1.155\nRare: Damage +0.625 | Power ×1.3125\nEpic: Damage +0.7 | Power ×1.47\nLegendary: Damage +0.8 | Power ×1.68\nMythical: Damage +0.925 | Power ×1.9425\nSecret: Damage +1.25 | Power ×2.625",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

local BodySection = Misc_Tab:Section({
    Title = "Body Accessories",
    Icon = "shield",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

BodySection:Paragraph({
    Title = "Saiyan Armor (Body)",
    Desc = "Common: Crystals +0.5 | Power ×1.05\nUncommon: Crystals +0.55 | Power ×1.155\nRare: Crystals +0.625 | Power ×1.3125\nEpic: Crystals +0.7 | Power ×1.47\nLegendary: Crystals +0.8 | Power ×1.68\nMythical: Crystals +0.925 | Power ×1.9425\nSecret: Crystals +1.25 | Power ×2.625",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

local MaskSection = Misc_Tab:Section({
    Title = "Mask Accessories",
    Icon = "eye",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

MaskSection:Paragraph({
    Title = "Rimuro Mask (Mask)",
    Desc = "Common: Damage +0.5 | Power ×1.1\nUncommon: Damage +0.55 | Power ×1.21\nRare: Damage +0.625 | Power ×1.375\nEpic: Damage +0.7 | Power ×1.54\nLegendary: Damage +0.8 | Power ×1.76\nMythical: Damage +0.925 | Power ×2.035\nSecret: Damage +1.25 | Power ×2.75",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

MaskSection:Paragraph({
    Title = "Oatmeel (Mask)",
    Desc = "Common: Crystals +0.5 | Power ×1.05\nUncommon: Crystals +0.55 | Power ×1.155\nRare: Crystals +0.625 | Power ×1.3125\nEpic: Crystals +0.7 | Power ×1.47\nLegendary: Crystals +0.8 | Power ×1.68\nMythical: Crystals +0.925 | Power ×1.9425\nSecret: Crystals +1.25 | Power ×2.625",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

MaskSection:Paragraph({
    Title = "Zama Mask (Mask)",
    Desc = "Common: Damage +0.75 | Power ×1.075\nUncommon: Damage +0.825 | Power ×1.1825\nRare: Damage +0.9375 | Power ×1.34375\nEpic: Damage +1.05 | Power ×1.505\nLegendary: Damage +1.2 | Power ×1.72\nMythical: Damage +1.3875 | Power ×1.98875\nSecret: Damage +1.875 | Power ×2.6875",
    Color = "Red", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

-- =====================================================
WindUI:Notify({Title = "World Fighters", Content = "Script loaded!", Duration = 3, Icon = "info"})
