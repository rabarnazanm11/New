--[[
         World Fighters Hub  |  Ready 

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]

-- =====================================================
--               ★ CONFIG (EDIT HERE) ★
-- =====================================================

local Codes = {
    -------- ACTIVE CODES ---------------
    "UPDATE4PT2",
    "22.5KLIKESREALLY!?",
    "UNREAL11MILLIONVISITS!!!",
    "UPDATE4",
    "UPDATE3QOL",
    "10MILLIONVISITSINSANE!!",
    "WEARESOSORRY",
    "UPDATE3PT2",
    "!9MILLIONVISITSTYSM!",
    "SRRY4SHUTDOWN",
    "SRRY4SHUTDOWN2",
    "SRRY4SHUTDOWN3",
    "SRRY4DELAY",
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
    "WOW10KCCU",
    "AWESOME11KCCU",
    "RELEASE",
    "TIOGADIHIT!",
    "8KCCUISAWESOME!",
    "9KPLAYERS",
    -------- Not ACTIVE CODES ---------------
    "UPDATE3",
    "!!8MILLIONVISITS!!",
    "40KFAVORITES!TY!",
    "20KLIKESYOUAREINSANE?!",
    "SORRY4SHUTDOWN3",
    "UPDATE2QOL",
    "UPDATE2PT2",
    "13KPLAYERSISALOT",
    "WOW10KLIKES!",
    "11KLIKESLETSGO!",
    "12KLIKESINSANE!",
    "10KFAVORITESTYSM!",
    "11KFAVORITESNOWAY!",
    "12KFAVORITESBABY!",
    "UPDATE1QOL",
    "UPDATE1PT2",
    "UPDATE1",
    "SRRY4UPDPROBLEMS",
    "LOVE8KLIKES!",
    "THXSOMUCHFOR9KLIKES!",
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
    "RELEASEPATCH",
    "RELEASEPT2",
    "RELEASEQOL",
    "THX1KCCU",
    "2KCCU!",
    "THANKYOU3KCCU",
    "4KONCHAMBER!",
    "ALREADY5K?",
    "6KTHXSOMUCH",
    "7KISALOT!",
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
}
print("total codes = " .. #Codes)

-- =====================================================
--               SERVICES & SETUP
-- =====================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer       = Players.LocalPlayer
local HttpService       = game:GetService("HttpService")
local TeleportService   = game:GetService("TeleportService")
local Workspace         = game:GetService("Workspace")  -- add this

local dataRemote  = ReplicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent")
local EnemiesUtil = require(ReplicatedStorage.Omni.Utils.Enemies)

-- PlayerArea lives at workspace.Cache.PlayerArea
-- It is a 45 x 0.5 x 45 flat BasePart that marks the combat zone.
-- We call this each time so it survives server changes / respawns.
local function GetPlayerArea()
    local cache = workspace:FindFirstChild("Cache")
    return cache and cache:FindFirstChild("PlayerArea")
end


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/DummYUi/DunmyUi_Source.luau'))()

-- =====================================================
--               WINDOW SETUP
-- =====================================================
local Tabs = Library:Window({
    Title   = "My Hub",              -- Header title
    Desc    = "v1.0.0",              -- Subtitle under title (optional)
    Icon    = "door-open",           -- Icon name from icon list, or rbxassetid:// string
    Theme   = "Amethyst",            -- "Dark" or "Amethyst"
    Config  = {
        Keybind = Enum.KeyCode.RightShift,          -- Key to toggle UI visibility
        Size    = UDim2.new(0, 530, 0, 400),        -- Window size (optional)
    },
    CloseUIButton = {
        Enabled = true,              -- Show a floating close button
        Text    = "Close",           -- Label on the floating button
    }
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
local Main_Tab = Tabs:Tab({
    Title = "Main",       -- Tab label
    Icon  = "house",      -- Icon name or rbxassetid:// string (default: "house")
})
local EnemyNames = GetEnemyNames()

-- ── Multi-select enemy dropdown ──────────────────────────────────────────────
local EnemyDropdown = Main_Tab:Dropdown({
    Title = "Select Enemy",
    List = EnemyNames,
    Value = EnemyNames[1],
    Multi = true,
    Callback = function(option) -- multi mode:   selected is a table of strings
        SelectedEnemies = option
    end
})

-- ── Priority System (multi-select) ──────────────────────────────────────────
--
--  Tick any number of enemies here.  Auto Farm will search for an alive
--  priority enemy first (closest one wins), then fall back to SelectedEnemies.
--  Smart Farm mode also checks priority enemies when computing the cluster.
--


local PriorityLabel  -- updated on every priority change

local function RefreshPriorityLabel()
    local txt = #PriorityEnemies > 0
        and ("Prioritised: " .. table.concat(PriorityEnemies, ", "))
        or  "Prioritised: None"
    if PriorityLabel then
        pcall(function() PriorityLabel:SetDesc(txt) end)
    end
end

local PriorityDropdown = Main_Tab:Dropdown({
    Title = "Priority Enemies",
    Desc = "Farmed before all other enemies (multi-select)",
    List = EnemyNames,
    Value = nil,
    Multi = true,           -- ← multi-select
    Callback = function(options)
        PriorityEnemies = type(options) == "table" and options or {}
        RefreshPriorityLabel()
        if #PriorityEnemies > 0 then
            Tabs:Notify({
                Title = "Priority Updated",
                Desc = #PriorityEnemies .. " enemy/enemies set as priority",
                Time = 2
            })
        end
    end
})


--[[PriorityLabel = Main_Tab:Paragraph({
    Title = "Active Priority Queue",
    Desc = "Prioritised: None",
    Color = "Blue",
    Image = "", ImageSize = 30, Thumbnail = "", ThumbnailSize = 80, Locked = false,
})
]]
Main_Tab:Button({
    Title = "Clear Priority List",
    Callback = function()
        PriorityEnemies = {}
        PriorityDropdown:Refresh(GetEnemyNames())  -- resets tick-marks visually
        RefreshPriorityLabel()
        Tabs:Notify({Title = "Priority", Desc = "Priority list cleared", Time = 2})
    end
})

-- ── Refresh enemies ──────────────────────────────────────────────────────────
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all enemies currently in world",
    Callback = function()
        local names = GetEnemyNames()
        SelectedEnemies = {}
        PriorityEnemies = {}
        EnemyDropdown:Refresh(names)
        PriorityDropdown:Refresh(names)
        RefreshPriorityLabel()
        if #names == 0 then
            Tabs:Notify({Title = "Warning", Desc = "No enemies found!", Time = 3})
            return
        end
        Tabs:Notify({Title = "Refreshed", Desc = "Found " .. #names .. " enemies", Time = 2})
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
                                        Tabs:Notify({Title = "Auto Farm", Desc = "Locked onto " .. found.Name, Time = 1})
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
    Callback = function(state)
        SmartFarmMode = state
        if state then
            Tabs:Notify({
                Title = "Smart Farm ON",
                Desc = "Teleports to middle of enemy cluster in your area",
                Time = 3,
            })
        else
            Tabs:Notify({
                Title = "Smart Farm OFF",
                Desc = "Back to single-target mode",
                Time = 2,
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


-- ── Auto Attack + Click ──────────────────────────────────────────────────────
Main_Tab:Toggle({
    Title = "Auto Attack + Click",
    Desc = "Attack all enemies with same name as nearest (all worlds)",
    Value = false,
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
--               TAB: MISC
-- =====================================================
local Misc_Tab = Tabs:Tab({Title = "Misc", Icon = "box"})

Misc_Tab:Button({
    Title = "Redeem All Codes", 
    Callback = function()
        for _, code in ipairs(Codes) do
            FireRemote({{{"General","Codes","Redeem", tostring(code), n = 4}, "\002"}})
            task.wait(CodeDelay)
        end
        Tabs:Notify({Title = "Done", Content = "All codes redeemed!", Duration = 3, Icon = "check"})
    end
})

Misc_Tab:Slider({
    Title = "Code Redeem Speed", 
    Desc = "Higher = slower (prevents rate limiting)",
    Rounding = 0.1, 
    Min      = 0,
    Max      = 3,
    Value    = 1,
    Callback = function(value) CodeDelay = value end
})

-- =====================================================
--               TAB: GAMEMODE
-- =====================================================
local Gamemode_Tab = Tabs:Tab({Title = "Gamemode", Icon = "swords"})

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

Gamemode_Tab:Textbox({
    Title = "Leave At Wave :",
    Desc = "Once reached, auto-leave triggers",
    Placeholder = "27",
    Value = "",
    ClearTextOnFocus = false,
    
    Callback = function(text)
        wave_to_leave_at = tonumber(text) or wave_to_leave_at
    end,
})

local Autojoin = false
Gamemode_Tab:Toggle({
    Title = "Tempest Invasion / Auto Join",
    Value = false,
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
                        task.wait(2)
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
--               GAMEMODE TAB : TOWER
-- =====================================================
local function getTowerWave()
    local ok, result = pcall(function()
        return Players.LocalPlayer
            .PlayerGui.UI.HUD.Gamemodes.Tower.Main.Wave.Value
    end)
    return ok and result or nil
end

local function towerJoinArgs()
    return {{{ "General", "Gamemodes", "Join", "Tower", n = 4 }, "\002"}}
end
local function towerLeaveArgs()
    return {{{ "General", "Gamemodes", "Leave", "Tower", n = 4 }, "\002"}}
end

local tower_wave_to_leave_at = 27
Gamemode_Tab:Textbox({
    Title = "Tower — Leave At Wave :",
    Desc = "Once reached, auto-leave triggers",
    Placeholder = "27",
    Value = "",
    ClearTextOnFocus = false,
    
    Callback = function(text)
        tower_wave_to_leave_at = tonumber(text) or tower_wave_to_leave_at
    end,
})

local TowerAutojoin = false
Gamemode_Tab:Toggle({
    Title = "Tower / Auto Join",
    Value = false,
    Callback = function(state)
        TowerAutojoin = state
        if TowerAutojoin then
            task.spawn(function()
                FireRemote(towerJoinArgs())
                while TowerAutojoin do
                    task.wait(1)
                    local w = getTowerWave()
                    -- wave text may be "27 / 50" or similar; match the number prefix safely
                    local atTarget = w and tostring(w.Text):match("^" .. tostring(tower_wave_to_leave_at) .. "%D")
                    if atTarget then
                        task.wait(2)   -- 2 s instead of 15 s
                        while TowerAutojoin do
                            local w2 = getTowerWave()
                            local stillAtTarget = w2 and tostring(w2.Text):match("^" .. tostring(tower_wave_to_leave_at) .. "%D")
                            if not stillAtTarget then
                                -- back to wave 1 means new round started → rejoin
                                local atWave1 = w2 and tostring(w2.Text):match("^1%D")
                                if atWave1 then
                                    task.wait(5)
                                    local w3 = getTowerWave()
                                    local stillWave1 = w3 and tostring(w3.Text):match("^1%D")
                                    if stillWave1 then
                                        FireRemote(towerJoinArgs())
                                    end
                                end
                                break
                            end
                            FireRemote(towerJoinArgs())
                            task.wait(2)
                        end
                    end
                end
            end)
        end
    end
})

local tower_leave_at_wave = false
Gamemode_Tab:Toggle({
    Title = "Tower\nLeave At Wave :",
    Value = false,
    Callback = function(state)
        tower_leave_at_wave = state
        if tower_leave_at_wave then
            task.spawn(function()
                while tower_leave_at_wave do
                    task.wait(1)
                    local w = getTowerWave()
                    local atTarget = w and tostring(w.Text):match("^" .. tostring(tower_wave_to_leave_at) .. "%D")
                    if atTarget then
                        FireRemote(towerLeaveArgs())
                        task.wait(5)
                    end
                end
            end)
        end
    end
})
