--[[
         World Fighters Hub  |  Using Folders - Main Tab Only

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
    {"Server", "Enemies", "Gamemodes", "Magic Tower"},
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
     {"Server", "Enemies", "World", "Ghoul Verse", "1"},  
         {"Server", "Enemies", "World", "Ghoul Arena", "1"},
     {"Server", "Enemies", "World", "Grimoires Verse", "1"},  
}

-- =====================================================
--               SERVICES & SETUP
-- =====================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer       = Players.LocalPlayer
local RunService        = game:GetService("RunService")

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
Window:Tag({Title = "V1", Icon = "award", Color = Color3.fromHex("#0d3154"), Radius = 9})
Window:EditOpenButton({
    Title = "World Fighters", Icon = "axe", CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    OnlyMobile = false, Enabled = true, Draggable = true,
})

-- =====================================================
--               STATE VARIABLES
-- =====================================================
local SelectedEnemies     = {}
local PriorityEnemies     = {}
local AutoFarm            = false
local AutoAttack          = false
local AutoClickOnly       = false
local AutoTeleportNearest = false
local AutoTeleportGamemodes = false
local SmartFarmMode       = false

-- =====================================================--               HELPER FUNCTIONS
-- =====================================================
local function GetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

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
    return folders
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

local function GetAllEnemies()
    local enemies = {}
    local folders = GetAllEnemyFolders()
    for _, folder in ipairs(folders) do
        if folder:IsA("BasePart") and folder:GetAttribute("ID") then
            table.insert(enemies, folder)
        end
        for _, child in ipairs(folder:GetChildren()) do
            if child:IsA("BasePart") and child:GetAttribute("ID") then                table.insert(enemies, child)
            end
        end
    end
    return enemies
end

local function GetEnemyNames()
    local names, seen = {}, {}
    for _, enemy in ipairs(GetAllEnemies()) do
        if not seen[enemy.Name] then
            seen[enemy.Name] = true
            table.insert(names, enemy.Name)
        end
    end
    return names
end

local function GetNearestEnemy()
    local hrp = GetHRP()
    if not hrp then return nil end
    local enemies = GetAllEnemies()
    if #enemies == 0 then return nil end
    local nearest, nearestDist = nil, math.huge
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
            local health = part:GetAttribute("Health")
            local died = part:GetAttribute("Died")            local respawning = part:GetAttribute("Respawning")
            local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
            if isAlive then
                local d = (hrp.Position - part.Position).Magnitude
                if d < bestDist then bestDist = d; nearest = part end
            end
        end
    end
    return nearest
end

local function TableKeys(t)
    local keys = {}
    for k in pairs(t) do table.insert(keys, k) end
    return keys
end

local function FireRemote(args)
    pcall(function() dataRemote:FireServer(unpack(args)) end)
end

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

local function GetPlayerArea()
    local cache = workspace:FindFirstChild("Cache")
    return cache and cache:FindFirstChild("PlayerArea")
end

local function IsInPlayerArea(worldPos)
    local pa = GetPlayerArea()
    if not pa then return true end
    local half = pa.Size / 2
    local local_p = pa.CFrame:PointToObjectSpace(worldPos)
    return math.abs(local_p.X) <= half.X and math.abs(local_p.Z) <= half.Z
end

local function GetClusterCenter(positions)
    if #positions == 0 then return nil end    local sum = Vector3.new(0, 0, 0)
    for _, p in ipairs(positions) do sum = sum + p end
    return sum / #positions
end

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

-- ── Multi-select enemy dropdown ──────────────────────
local EnemyDropdown = Main_Tab:Dropdown({
    Title = "Select Enemy",
    Desc = "Choose enemies to target (multi-select)",
    Values = EnemyNames,
    Value = EnemyNames[1],
    Multi = true,
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(option) SelectedEnemies = option end
})

-- ── Priority System ──────────────────────────────────
local PrioritySection = Main_Tab:Section({
    Title = "Priority System",
    Icon = "list-ordered",
    Box = true, BoxBorder = true, Opened = true,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,    TextSize = 18, DescTextSize = 14,
})

local PriorityLabel
local function RefreshPriorityLabel()
    local txt = #PriorityEnemies > 0 and ("Prioritised: " .. table.concat(PriorityEnemies, ", ")) or "Prioritised: None"
    if PriorityLabel then pcall(function() PriorityLabel:SetDesc(txt) end) end
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
            WindUI:Notify({Title = "Priority Updated", Content = #PriorityEnemies .. " enemy/enemies set as priority", Duration = 2, Icon = "arrow-up"})
        end
    end
})

PriorityLabel = PrioritySection:Paragraph({
    Title = "Active Priority Queue",
    Desc = "Prioritised: None",
    Color = "Blue", Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})

PrioritySection:Button({
    Title = "Clear Priority List",
    Icon = "trash-2",
    Color = Color3.fromHex("#ef4444"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        PriorityEnemies = {}
        PriorityDropdown:Refresh(GetEnemyNames())
        RefreshPriorityLabel()
        WindUI:Notify({Title = "Priority", Content = "Priority list cleared", Duration = 2, Icon = "check"})
    end
})

-- ── Refresh enemies ──────────────────────────────────
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all folders for new enemies",    Icon = "refresh-cw",
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

-- ── Auto Farm ────────────────────────────────────────
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
                        if SmartFarmMode then
                            local positions = GetClusterPositionsInArea(function(name)
                                return IsPriorityEnemy(name) or IsSelectedEnemy(name)
                            end)
                            local center = GetClusterCenter(positions)
                            if center then
                                hrp.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
                            else
                                local allEnemies = GetAllEnemies()
                                local found, bestDist = nil, math.huge
                                for _, enemy in ipairs(allEnemies) do
                                    if IsPriorityEnemy(enemy.Name) then
                                        local health = enemy:GetAttribute("Health")
                                        local died = enemy:GetAttribute("Died")
                                        local respawning = enemy:GetAttribute("Respawning")
                                        local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)                                        if isAlive then
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
                        else
                            if lastEnemy and lastEnemy.Parent then
                                local died = lastEnemy:GetAttribute("Died")
                                local respawning = lastEnemy:GetAttribute("Respawning")
                                local health = lastEnemy:GetAttribute("Health")
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
                                    for _, enemy in ipairs(allEnemies) do
                                        if IsPriorityEnemy(enemy.Name) then
                                            local health = enemy:GetAttribute("Health")
                                            local died = enemy:GetAttribute("Died")
                                            local respawning = enemy:GetAttribute("Respawning")                                            local isAlive = (not died) and (not respawning) and (health ~= nil and health > 0)
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

-- ── Smart Farm Mode Toggle ───────────────────────────
Main_Tab:Toggle({
    Title = "Switch to Smart Farm Mode",
    Desc = "TP to centre of enemy cluster inside your PlayerArea",
    Value = false,
    Type = "Checkbox",
    Icon = "brain-circuit",
    IconSize = 20,    Callback = function(state)
        SmartFarmMode = state
        if state then
            WindUI:Notify({Title = "Smart Farm ON", Content = "Teleports to middle of enemy cluster in your area", Duration = 3, Icon = "brain-circuit"})
        else
            WindUI:Notify({Title = "Smart Farm OFF", Content = "Back to single-target mode", Duration = 2, Icon = "zap"})
        end
    end
})

-- ── Auto Teleport Nearest Enemy ──────────────────────
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

-- ── Auto TP Nearest Gamemode Enemy ───────────────────
Main_Tab:Toggle({
    Title = "Auto TP Nearest Gamemode Enemy",    Desc = "Snaps to closest part in workspace.Server.Enemies.Gamemodes",
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

-- ── Auto Farm Ores ───────────────────────────────────
local selectedOres = {}
local oreRunning = false

Main_Tab:Dropdown({
    Title = "Select Ore",
    Values = {"All", "Blue Ore", "Orange Ore", "Purple Ore", "Pink Ore", "Green Ore", "Yellow Ore"},
    Value = {"All"},
    Multi = true,
    AllowNone = true,
    Callback = function(option) selectedOres = option end
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
    Icon = "zap",    Callback = function(state)
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
                        if health and health > 0 then table.insert(alive, v) end
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
                            if not health or health <= 0 or not ore.Parent then break end
                            local char = LocalPlayer.Character
                            local hrp = char and char:FindFirstChild("HumanoidRootPart")
                            if hrp then hrp.CFrame = ore:GetPivot() + Vector3.new(0, 4, 0) end
                            RunService.Heartbeat:Wait()
                        end
                    end
                end
            end
        end)
    end
})

-- ── Auto Attack + Click ──────────────────────────────
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

-- ── Auto Click Only ──────────────────────────────────
Main_Tab:Toggle({
    Title = "Auto Click Only",
    Desc = "Click without targeting an enemy",
    Value = false,
    Type = "Toggle",
    Icon = "mouse-pointer-click",
    IconSize = 20,
    Callback = function(state)
        AutoClickOnly = state
        if AutoClickOnly then            task.spawn(function()
                while AutoClickOnly do
                    FireRemote({{{"General","Attack","Click",{}, n = 4}, "\002"}})
                    task.wait(0.05)
                end
            end)
        end
    end
})
-- =====================================================
--               GAMEMODE FEATURES (Add to Main Tab)
-- =====================================================

-- ── Wave Helper Functions ─────────────────────────────
local function getTempestWave()
    local ok, result = pcall(function()
        return LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Main.Wave.Value
    end)
    return ok and result or nil
end

local function getTowerWave()
    local ok, result = pcall(function()
        return LocalPlayer.PlayerGui.UI.HUD.Gamemodes.Tower.Main.Wave.Value
    end)
    return ok and result or nil
end

-- ── Remote Args ───────────────────────────────────────
local function tempestJoinArgs()  return {{{"General","Gamemodes","Join","Tempest Invasion", n=4}, "\002"}} end
local function tempestLeaveArgs() return {{{"General","Gamemodes","Leave","Tempest Invasion", n=4}, "\002"}} end
local function towerJoinArgs()    return {{{"General","Gamemodes","Join","Tower", n=4}, "\002"}} end
local function towerLeaveArgs()   return {{{"General","Gamemodes","Leave","Tower", n=4}, "\002"}} end

-- ── Gamemode Section ──────────────────────────────────
local GamemodeSection = Main_Tab:Section({
    Title = "Gamemodes",
    Icon = "swords",
    Box = true, BoxBorder = true, Opened = false,
    FontWeight = Enum.FontWeight.ExtraBold,
    DescFontWeight = Enum.FontWeight.Light,
    TextSize = 18, DescTextSize = 14,
})

-- ===== TEMPEST INVASION =====
local TempestSubSection = GamemodeSection:Section({
    Title = "Tempest Invasion",
    Icon = "cloud-lightning",
    Box = true, BoxBorder = true, Opened = false,
    FontWeight = Enum.FontWeight.SemiBold,
    TextSize = 16,
})

local tempestWaveToLeave = 27
TempestSubSection:Input({
    Title = "Leave At Wave",
    Desc = "Auto-leave when this wave is reached",
    Type = "Input", Placeholder = "27", Value = "",
    InputIcon = "hash", ClearTextOnFocus = false, Width = 150,    Callback = function(text) tempestWaveToLeave = tonumber(text) or tempestWaveToLeave end,
})

local tempestAutoJoin = false
TempestSubSection:Toggle({
    Title = "Auto Join",
    Desc = "Automatically join Tempest Invasion",
    Value = false, Type = "Toggle", Icon = "log-in",
    Callback = function(state)
        tempestAutoJoin = state
        if tempestAutoJoin then task.spawn(function()
            FireRemote(tempestJoinArgs())
            while tempestAutoJoin do
                task.wait(1)
                local w = getTempestWave()
                local targetText = tostring(tempestWaveToLeave) .. " / 100"
                if w and w.Text == targetText then
                    task.wait(2)
                    while tempestAutoJoin do
                        local w2 = getTempestWave()
                        if not w2 or w2.Text ~= targetText then
                            if w2 and w2.Text == "1 / 100" then
                                task.wait(5)
                                local w3 = getTempestWave()
                                if w3 and w3.Text == "1 / 100" then FireRemote(tempestJoinArgs()) end
                            end
                            break
                        end
                        FireRemote(tempestJoinArgs())
                        task.wait(2)
                    end
                end
            end
        end) end
    end
})

local tempestLeaveAtWave = false
TempestSubSection:Toggle({
    Title = "Leave At Wave",
    Desc = "Auto-leave when target wave is reached",
    Value = false, Type = "Toggle", Icon = "log-out",
    Callback = function(state)
        tempestLeaveAtWave = state
        if tempestLeaveAtWave then task.spawn(function()
            while tempestLeaveAtWave do
                task.wait(1)
                local w = getTempestWave()
                if w and w.Text == tostring(tempestWaveToLeave) .. " / 100" then
                    FireRemote(tempestLeaveArgs())                    task.wait(5)
                end
            end
        end) end
    end
})

-- ===== TOWER =====
local TowerSubSection = GamemodeSection:Section({
    Title = "Tower",
    Icon = "tower-control",
    Box = true, BoxBorder = true, Opened = false,
    FontWeight = Enum.FontWeight.SemiBold,
    TextSize = 16,
})

local towerWaveToLeave = 27
TowerSubSection:Input({
    Title = "Leave At Wave",
    Desc = "Auto-leave when this wave is reached",
    Type = "Input", Placeholder = "27", Value = "",
    InputIcon = "hash", ClearTextOnFocus = false, Width = 150,
    Callback = function(text) towerWaveToLeave = tonumber(text) or towerWaveToLeave end,
})

local towerAutoJoin = false
TowerSubSection:Toggle({
    Title = "Auto Join",
    Desc = "Automatically join Tower gamemode",
    Value = false, Type = "Toggle", Icon = "log-in",
    Callback = function(state)
        towerAutoJoin = state
        if towerAutoJoin then task.spawn(function()
            FireRemote(towerJoinArgs())
            while towerAutoJoin do
                task.wait(1)
                local w = getTowerWave()
                local atTarget = w and tostring(w.Text):match("^" .. tostring(towerWaveToLeave) .. "%D")
                if atTarget then
                    task.wait(2)
                    while towerAutoJoin do
                        local w2 = getTowerWave()
                        local stillAtTarget = w2 and tostring(w2.Text):match("^" .. tostring(towerWaveToLeave) .. "%D")
                        if not stillAtTarget then
                            local atWave1 = w2 and tostring(w2.Text):match("^1%D")
                            if atWave1 then
                                task.wait(5)
                                local w3 = getTowerWave()
                                if w3 and tostring(w3.Text):match("^1%D") then FireRemote(towerJoinArgs()) end
                            end                            break
                        end
                        FireRemote(towerJoinArgs())
                        task.wait(2)
                    end
                end
            end
        end) end
    end
})

local towerLeaveAtWave = false
TowerSubSection:Toggle({
    Title = "Leave At Wave",
    Desc = "Auto-leave when target wave is reached",
    Value = false, Type = "Toggle", Icon = "log-out",
    Callback = function(state)
        towerLeaveAtWave = state
        if towerLeaveAtWave then task.spawn(function()
            while towerLeaveAtWave do
                task.wait(1)
                local w = getTowerWave()
                local atTarget = w and tostring(w.Text):match("^" .. tostring(towerWaveToLeave) .. "%D")
                if atTarget then
                    FireRemote(towerLeaveArgs())
                    task.wait(5)
                end
            end
        end) end
    end
})
-- =====================================================
-- =====================================================
local GoulTab = Window:Tab({Title = "Ghoul ",Icon = "bird",Locked = false,}) -- Icon is Optional

local CarsBoss = false
local delayofghoul = 1
local userEnabled = false
local isUpdatingUI = false
local monitorThread = nil

-- Optimized: stops at the first Part found (much faster than GetDescendants)
local function IsArenaActive()
    local arena = workspace.Server.Enemies.Gamemodes["Ghoul Arena"]
    if not arena then return false end
    return arena:FindFirstChildWhichIsA("Part") ~= nil
end

local AutoJonGhoul = GoulTab:Toggle({
    Title = "Auto Join Ghoul Arena",
    Value = false,
    Type = "Toggle",
    Icon = "zap",
    IconSize = 20,
    Callback = function(state)
        -- Prevents the UI sync from triggering the callback recursively
        if isUpdatingUI then return end
        userEnabled = state

        if userEnabled then
            -- Only spawn if no active monitor thread exists
            if not monitorThread or coroutine.status(monitorThread) == "dead" then
                monitorThread = task.spawn(function()
                    while userEnabled do
                        if IsArenaActive() then
                            -- 🟥 Arena has parts: Pause joining & sync UI to OFF
                            isUpdatingUI = true
                            if AutoJonGhoul.Set then AutoJonGhoul:Set(false) end
                            isUpdatingUI = false
                            
                            task.wait(0.5) -- Poll every 0.5s while waiting for arena to clear
                        else
                            -- 🟩 Arena clear: Sync UI to ON & Join
                            isUpdatingUI = true
                            if AutoJonGhoul.Set then AutoJonGhoul:Set(true) end
                            isUpdatingUI = false

                            local args = {
                                {
                                    {"General", "Gamemodes", "Join", "Ghoul Arena", n = 4},
                                    "\002"
                                }
                            }
                            dataRemote:FireServer(unpack(args))
                            task.wait(delayofghoul)
                        end
                    end
                end)
            end
        end
        -- If manually toggled OFF, `userEnabled` becomes false → loop breaks naturally
    end
})
-- =====================================================

local CarBossTab = Window:Tab({Title = "Car Boss",Icon = "bird",Locked = false,}) -- Icon is Optional

local BossCar = CarBossTab:Toggle({
    Title = "Auto Spawn Car Boss",
    Desc = "Delay 2 Secs",
    Value = false,
    Type = "Toggle",        -- or "Checkbox"
    Icon = "zap",           -- Lucide icon inside toggle, nil for no icon
    IconSize = 20,          -- 0-26 pixels
    Callback = function(state)
        CarsBoss = state
        if CarsBoss then 
          while CarsBoss do 
          local args = {
	{
		{
			"General",
			"SpawnBosses",
			"Spawn",
			"Cars",
			1,
			n = 5
		},
		"\002"
	}
}
dataRemote:FireServer(unpack(args))
          task.wait(2)
          end
        end 
    end
})




-- =====================================================

local Codes = {
  "SRRY4DELAY",
  "GRIMOIRES",
  "UPDATE6",
    "SRRY4SHUTDOWN",
      "PIRATESXSAILORS",
    "UPDATE5PT2",
    "WEREALLYREACHED12MILLIONVISITS!!",
    "!50KFAVORITESYOO!",
    "!50KFAVORITESYOO!",
    "SRRY4DELAY",
    "UPDATE5",
    
    -------- ACTIVE CODES ---------------
    "RELEASE",
    "SRRY4SHUTDOWN",
    "SRRY4SHUTDOWN2",
    "TIOGADIHIT!",
    "SRRY4SHUTDOWN3",
    "8KCCUISAWESOME!",
    "SRRY4DELAY",
    "9KPLAYERS",
    "WOW10KCCU",
    "AWESOME11KCCU",
    "UPDATE2",
    "CANTBELIEVE12KCCU!",
    "13KLIKESMILESTONE!",
    "TYFOR14KLIKES!",
    "ALREADY15KLIKESAWESOME?!",
    "OMG4MILLIONVISITS!",
    "4.5MILLIONVISITSYOOO!",
    "5MILLIONVISITSINSANE!",
    "15KFAVORITES!!!",
    "20KFAVORITESYAY!!",
    "DAMN25KFAVORITES!!",
    "13KPLAYERSISALOT!",
    "17.5KLIKES?!",
    "6MILLIONVISITSYO!!!",
    "7MILLIONVISITSYAY!?!",
    "YEAAA30KFAVORITES!!",
    "UPDATE3PT2",
    "!9MILLIONVISITSTYSM!",
    "UPDATE3QOL",
    "10MILLIONVISITSINSANE!!",
    
    

}
print("total codes = " .. #Codes)
local CODEs= Window:Tab({Title = "Misc ",Icon = "bird"}) -- Icon is Optional

local Player = game.Players.LocalPlayer
local accountAge = Player.AccountAge .. " days"
local Paragraph = CODEs:Paragraph({
    Title = "Hello, " .. Player.DisplayName,
    Desc = "Executor: " .. (identifyexecutor and identifyexecutor() or "Unknown") .. "\nAccount Age: " .. accountAge .. "\nUserID: " .. Player.UserId .. "\nStatus: " .. (Player.MembershipType == Enum.MembershipType.Premium and "Premium" or "Normal")
})
CODEs:Button({
    Title = "Redeem All Codes", Icon = "ticket-plus", Color = Color3.fromHex("#1d2731"),
    Justify = "Center", IconAlign = "Left",
    Callback = function()
        for _, code in ipairs(Codes) do
            FireRemote({{{"General","Codes","Redeem", tostring(code), n = 4}, "\002"}})
            task.wait(3)
        end
        WindUI:Notify({Title = "Done", Content = "All codes redeemed!", Duration = 3, Icon = "check"})
        
        
    end
})
-- =====================================================
local STARSTab = Window:Tab({Title = "Stars",Icon = "egg",Locked = false,}) -- Icon is Optional


local EggsTable = {}
for _, v in ipairs(game:GetService("ReplicatedStorage").Omni.Shared.Stars:GetChildren()) do 
  table.insert(EggsTable,v.Name)
end 


local SelectedStar = EggsTable[1]
local AutoSTAr = false



local STARSDropdown = STARSTab:Dropdown({
    Title = "Star",
    Values = EggsTable,
    Value = EggsTable[1],
    Multi = false,
    MenuWidth = 180,
    AllowNone = false,
    SearchBarEnabled = true,
    Callback = function(option)
      SelectedStar = option 
      end
})


local AutoStar = STARSTab:Toggle({
    Title = "Auto Hatch Selected Star",
    Value = false,
    Type = "Toggle",        -- or "Checkbox"
    Icon = "zap",           -- Lucide icon inside toggle, nil for no icon
    IconSize = 20,          -- 0-26 pixels
    Callback = function(state)
        AutoSTAr = state
        if AutoSTAr then 
          while AutoSTAr do 
          local args = {
	{
		{
			"General",
			"Stars",
			"Open",
			tostring(SelectedStar),
			9999,
			n = 5
		},
		"\002"
	}
}
dataRemote:FireServer(unpack(args))
          task.wait()
          end
        end 
    end
})

-- =====================================================


local ROLLSTab = Window:Tab({Title = "Rolls",Icon = "egg",Locked = false,}) -- Icon is Optional


local RollsTable = {}
for _, v in ipairs(game:GetService("ReplicatedStorage").Omni.Shared.Gacha.Machines:GetChildren()) do 
  if v:IsA("ModuleScript") then 
  table.insert(RollsTable,v.Name)
  end 
end 


local SelectedGacha = RollsTable[1]
local AutoRoll = false



local GachaDropdown = ROLLSTab:Dropdown({
    Title = "Select Gacha ",
    Values = RollsTable,
    Value = RollsTable[1],
    Multi = false,
    MenuWidth = 180,
    AllowNone = false,
    SearchBarEnabled = true,
    Callback = function(option)
      SelectedGacha = option 
      end
})


local AutoRools = ROLLSTab:Toggle({
    Title = "Auto Roll Selected Gacha",
    Value = false,
    Type = "Toggle",        -- or "Checkbox"
    Icon = "zap",           -- Lucide icon inside toggle, nil for no icon
    IconSize = 20,          -- 0-26 pixels
    Callback = function(state)
        AutoRoll = state
        if AutoRoll then 
          while AutoRoll do 
          local args = {
	{
		{
			"General",
			"Gacha",
			"Roll",
			tostring(SelectedGacha),
			{},
			n = 5
		},
		"\002"
	}
}
dataRemote:FireServer(unpack(args))
          task.wait()
          end
        end 
    end
})




-- =====================================================
WindUI:Notify({Title = "World Fighters", Content = "Script loaded!", Duration = 3, Icon = "info"})
