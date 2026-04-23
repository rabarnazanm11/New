--[[
         World Fighters Hub  |  Uses The game Script for  enemies

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]

-- =====================================================
--               ★ CONFIG (EDIT HERE) ★
-- =====================================================

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
    "RELEASE",
    "SRRY4SHUTDOWN",
    "SRRY4SHUTDOWN2",
    "TIOGADIHIT!",
    "THX1KCCU",
    "2KCCU!",
    "THANKYOU3KCCU",
    "4KONCHAMBER!",
    "ALREADY5K?",
    "6KTHXSOMUCH",
    "7KISALOT!",
    "THANKS1KLIKES",
    "100KVISITSONCHAMBER!",
    "SRRY4SHUTDOWN3",
    "RELEASEPATCH",
    "SRRY4SHUTDOWN",
    "TY2KLIKES!!",
    "THXFOR200KVISITS!",
    "300KVISITSTHANKYOU!",
    "400KVISITSINCREDIBLE",
    "WOW500KVISITS!",
    "1KFAVORITESTHX!",
    "EVENT2.5K!",
    "RELEASEPT2",
    "THX3KLIKES!",
    "600KVISITSYAY!",
    "700KVISITSINGAME",
    "2KFAVORITESTHANKYOU!",
    -- New codes
    "SPLENDID800KVISITS!",
    "900KVISITSTHANKYOU!",
    "ALREADY1MVISITS!?",
    "THXFOR4KLIKES",
    "THXFOR3KFAVORITES!",
}
-- =====================================================
--               SERVICES & SETUP
-- =====================================================
local Players          = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer      = Players.LocalPlayer

local dataRemote = ReplicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent")
local EnemiesUtil = require(game:GetService("ReplicatedStorage").Omni.Utils.Enemies)

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
--               STATE VARIABLES
-- =====================================================
local SelectedEnemies = {}
local AutoFarm        = false
local AutoAttack      = false
local AutoClickOnly   = false
local AutoHatch       = false
local AutoRoll        = false

local EggDelay  = 0.1
local RollDelay = 0.1
local CodeDelay = 1

local SelectedEgg      = nil
local SelectedRollType = nil

-- =====================================================
--               HELPER FUNCTIONS
-- =====================================================

-- Returns the player's HumanoidRootPart or nil
local function GetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end
-- Returns unique enemy names using the game's own spatial hash
local function GetEnemyNames()
    local names = {}
    local seen = {}
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

-- Returns the nearest alive enemy instance using the game's own spatial hash
local function GetNearestEnemy()
    local hrp = GetHRP()
    if not hrp then return nil end
    local result = EnemiesUtil.GetClosestEnemy(hrp.Position, 99999)
    return result and result.Instance or nil
end

local function IsSelectedEnemy(name)   -- now correctly captures the local above
    for _, v in ipairs(SelectedEnemies) do
        if v == name then return true end
    end
    return false
end


 ----======+======== Until here
-- Builds a flat list of keys from a table (for dropdowns)
local function TableKeys(t)
    local keys = {}
    for k in pairs(t) do
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


-- =====================================================
--               TAB: MAIN
-- =====================================================
local Main_Tab = Window:Tab({Title = "Main", Icon = "gamepad-directional"})

-- Enemy dropdown
local EnemyNames = GetEnemyNames()

local EnemyDropdown = Main_Tab:Dropdown({
    Title = "Select Enemy",
    Desc = "Choose enemies to target (multi)",
    Values = EnemyNames,
    Value = EnemyNames[1],
    Multi = true,              -- ← changed
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(option)
        SelectedEnemies = option  -- WindUI returns array for multi
    end
})
--[[ local EnemyDropdown = Main_Tab:Dropdown({
    Title = "Select Enemy",
    Desc = "Choose enemy to target",
    Values = EnemyNames,
    Value = EnemyNames[1],
    Multi = false,
    MenuWidth = 180,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(option)
        SelectedEnemy = option
    end
})
 ]]
--[[
Refresh enemy list
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all folders for new enemies",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center",
    IconAlign = "Left",
    Callback = function()
        local names = GetEnemyNames()
        if #names == 0 then
            WindUI:Notify({Title = "Warning", Content = "No enemies found!", Duration = 3, Icon = "alert-circle"})
            return
        end
        EnemyDropdown:Refresh(names)
        EnemyDropdown:Select(names[1])
        SelectedEnemy = names[1]
        WindUI:Notify({Title = "Refreshed", Content = "Found " .. #names .. " enemies", Duration = 2, Icon = "check"})
    end
})
--]]
Main_Tab:Button({
    Title = "Refresh Enemies",
    Desc = "Scan all folders for new enemies",
    Icon = "refresh-cw",
    Color = Color3.fromHex("#3b82f6"),
    Justify = "Center",
    IconAlign = "Left",
    Callback = function()
        local names = GetEnemyNames()
        SelectedEnemies = {}           -- clear selection
        EnemyDropdown:Refresh(names)   -- resets dropdown state
        if #names == 0 then
            WindUI:Notify({Title = "Warning", Content = "No enemies found!", Duration = 3, Icon = "alert-circle"})
            return
        end
        WindUI:Notify({Title = "Refreshed", Content = "Found " .. #names .. " enemies", Duration = 2, Icon = "check"})
    end
})

-- Auto Farm toggle
Main_Tab:Toggle({
    Title = "Auto Farm",
    Desc = "Teleport to alive enemy, wait for kill, find next",
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
                    -- Check if current target is still alive
                    if lastEnemy and lastEnemy.Parent then
                        local died   = lastEnemy:GetAttribute("Died")
                        local respawning = lastEnemy:GetAttribute("Respawning")
                        local health = lastEnemy:GetAttribute("Health")
                        if not died and not respawning and health and health > 0 then
                            hrp.CFrame = lastEnemy.CFrame * CFrame.new(0, 5, 0)
                        else
                            lastEnemy = nil
                        end
                    end

                    -- Find a new target if needed
                    if not lastEnemy then
                        if #SelectedEnemies == 0 then
                            task.wait(1)
                        else
                            -- EnemiesUtil already filters dead/respawning enemies
                            local found = nil
                            for _, e in ipairs(EnemiesUtil.GetEnemiesInRange(hrp.Position, 99999)) do
                                if IsSelectedEnemy(e.Instance.Name) then
                                    found = e.Instance
                                    break
                                end
                            end

                            if found then
                                lastEnemy = found
                                hrp.CFrame = found.CFrame * CFrame.new(0, 5, 0)
                                WindUI:Notify({Title = "Auto Farm", Content = "Locked onto " .. found.Name, Duration = 1, Icon = "check"})
                            else
                                task.wait(2)
                            end
                        end
                    end
                else
                    task.wait(1)
                end
                task.wait(0.5)
            end
        end)
    end
end
})
--[[ Auto Farm toggle
Main_Tab:Toggle({
    Title = "Auto Farm",
    Desc = "Teleport to alive enemy, wait for kill, find next",
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
                        local aliveEnemy = nil

                        -- Check if our current target is still alive
                        if lastEnemy and lastEnemy.Parent then
                            local died   = lastEnemy:GetAttribute("Died")
                            local health = lastEnemy:GetAttribute("Health")
                            if not died and health and health > 0 then
                                hrp.CFrame = lastEnemy.CFrame * CFrame.new(0, 5, 0)
                            else
                                lastEnemy = nil
                            end
                        end

                        -- Find a new alive enemy if needed
                        if not lastEnemy then
                            for _, enemy in ipairs(GetAllEnemies()) do
                                if enemy:IsA("BasePart") and enemy.Name == SelectedEnemy then
                                    local died   = enemy:GetAttribute("Died")
                                    local health = enemy:GetAttribute("Health")
                                    if not died and health and health > 0 then
                                        aliveEnemy = enemy
                                        break
                                    end
                                end
                            end

                            if aliveEnemy then
                                lastEnemy = aliveEnemy
                                hrp.CFrame = aliveEnemy.CFrame * CFrame.new(0, 5, 0)
                                WindUI:Notify({Title = "Auto Farm", Content = "Locked onto " .. SelectedEnemy, Duration = 1, Icon = "check"})
                            else
                                task.wait(2)
                            end
                        end
                    else
                        task.wait(1)
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})
]]
-- Auto Attack + Click toggle
Main_Tab:Toggle({
    Title = "Auto Attack + Click",
    Desc = "Attack nearest enemy in any world/folder",
    Value = false,
    Type = "Checkbox",
    Icon = "sword",
    IconSize = 20,
    Callback = function(state)
        AutoAttack = state
        if AutoAttack then
            task.spawn(function()
                while AutoAttack do
                    local enemy = GetNearestEnemy()
                    if enemy then
                        local id = enemy:GetAttribute("ID")
                        if id then
                            FireRemote({{{"General","Attack","Click",{[tostring(id)] = true}, n = 4}, "\002"}})
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Click Only toggle
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
