-- ║          RANJA ANIME ETERNAL SCRIPT  ·  V4.0                         ║
-- ║          WindUI Boreal Edition  ·  by AES                            ║

-- ╚═══════════════════════════════════════════════════════════════════════╝

--═══════════════════════════════════════════════════════════════════════════
--  🔌 LOAD MODULES FIRST
--═══════════════════════════════════════════════════════════════════════════

loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/glowing-waffle/refs/heads/main/DoorEsps"))()

--═══════════════════════════════════════════════════════════════════════════
--  📋 CONFIGURATION MODULE
--═══════════════════════════════════════════════════════════════════════════
local Config = {
    Version = "4.0",

    Settings = {
        StarOpenAmount = 30,
        RollAmount     = 4,
        AttackRange    = 100,
        FarmDelay      = 0.5,
        UIToggleKey    = "K",
    },

    WallDestroyer = {
        UpdateRate = 0.5,
    },

    Codes = {
        "EasterCode","Update45P2","Update45","Update44NoP3",
        "Update44NoP2","Update44","CodeCozNoUpdate43P3","Heyyyo",
        "Derp","SlashX","AllCodesInOneUpdate41","Update41P2AllCodesInOne",
        "AllCodesInOneUpdate42","Update43P2","AllCodesInOneUpdate43","Update42P3AllCodesInOne",
        "Update42P2AllCodesInOne","Update42P2AllCodesInOne",

    },

    Chests = {
        "Daily","Group","Christmas_Tree_Chest",
        "Ice_Chest","Santa_Chest","Christmas_Chest",
    },
}

--═══════════════════════════════════════════════════════════════════════════
--  🌍 WORLD DATA MODULE
--═══════════════════════════════════════════════════════════════════════════
local WorldData = {
    Gachas = {
        ["World 1"]  = {"Dragon_Race","Saiyan_Evolution"},
        ["World 2"]  = {"Pirate_Crew","Demon_Fruits","Swords"},
        ["World 3"]  = {"Reiatsu_Color","Zanpakuto"},
        ["World 4"]  = {"Curses"},
        ["World 5"]  = {"Demon_Arts"},
        ["World 6"]  = {"Solo_Hunter_Rank"},
        ["World 7"]  = {"Grimoire"},
        ["World 8"]  = {"Power_Eyes"},
        ["World 9"]  = {"Psychic_Mayhem"},
        ["World 10"] = {"Energy_Card_Shop","Damage_Card_Shop"},
        ["World 11"] = {"Families","Titans"},
        ["World 12"] = {"Sins","Commandments"},
        ["World 13"] = {"Kaiju_Powers","Power_of_Exchange"},
        ["World 14"] = {"Ultimate_Skills","Species"},
        ["World 15"] = {"Power_Energy_Runes"},
        ["World 16"] = {"Stands","Onomatopoeia"},
        ["World 17"] = {"Investigators","Kagune"},
        ["World 18"] = {"Debiru_Hunter","Akuma_Powers"},
        ["World 19"] = {"Special_Fire_Force"},
        ["World 20"] = {"Grand_Elder_Power","Frost_Demon_Evolution","Power_of_Friendship"},
        ["World 21"] = {"Scythes","Espada"},
        ["World 22"] = {"Shadow_Garden","Shadow_Arts"},
        ["World 23"] = {"Energy_Threat_Level","Punch_Power","Exchange_of_Power"},
        ["World 24"] = {"Adventurer_Rank","Magic_Tier"},
        ["World 25"] = {"Thriller_Zombie","Nightmare_Evolution"},
    },

    Upgrades = {
        ["World 3"]  = {
            {Name="Spiritual Pressure", Args={Upgrading_Name="Spiritual_Pressure", Action="_Upgrades", Upgrade_Name="Spiritual_Pressure"}},
        },
        ["World 4"]  = {
            {Name="Cursed", Args={Upgrading_Name="Curse", Action="_Upgrades", Upgrade_Name="Cursed_Progression"}},
        },
        ["World 6"]  = {
            {Name="ReAwakening", Args={Upgrading_Name="ReAwakening", Action="_Upgrades", Upgrade_Name="ReAwakening_Progression"}},
            {Name="Monarch",     Args={Upgrading_Name="Monarch",     Action="_Upgrades", Upgrade_Name="Monarch_Progression"}},
        },
        ["World 7"]  = {
            {Name="Water Spirit", Args={Upgrading_Name="Water_Spirit", Action="_Upgrades", Upgrade_Name="Water_Spirit_Progression"}},
            {Name="Fire Spirit",  Args={Upgrading_Name="Fire_Spirit",  Action="_Upgrades", Upgrade_Name="Fire_Spirit_Progression"}},
            {Name="Wind Spirit",  Args={Upgrading_Name="Wind_Spirit",  Action="_Upgrades", Upgrade_Name="Wind_Spirit_Progression"}},
        },
        ["World 8"]  = {
            {Name="Chakra", Args={Upgrading_Name="Chakra", Action="_Upgrades", Upgrade_Name="Chakra_Progression"}},
        },
        ["World 9"]  = {
            {Name="Lucky Spirit", Args={Bench_Name="Lucky_Spirit", Action="_Progression", Upgrade_Name="Luck"}},
        },
        ["World 10"] = {
            {Name="Ten",               Args={Upgrading_Name="Ten",             Action="_Upgrades",    Upgrade_Name="Ten_Progression"}},
            {Name="Contract of Greed", Args={Bench_Name="Contract_of_Greed",  Action="_Progression", Upgrade_Name="Coins"}},
        },
        ["World 12"] = {
            {Name="Energy Progression", Args={Bench_Name="Energy_Progression", Action="_Progression", Upgrade_Name="Strenght"}},
        },
        ["World 13"] = {
            {Name="Fortitude Level", Args={Bench_Name="Fortitude_Level", Action="_Progression", Upgrade_Name="Strenght"}},
            {Name="Kaiju Energy",    Args={Bench_Name="Kaiju_Energy",    Action="_Progression", Upgrade_Name="Energy"}},
        },
        ["World 14"] = {
            {Name="Demon Lord Energy", Args={Bench_Name="Demon_Lord_Energy", Action="_Progression", Upgrade_Name="Energy"}},
            {Name="Demon Lord Damage", Args={Bench_Name="Demon_Lord_Damage", Action="_Progression", Upgrade_Name="Damage"}},
            {Name="Demon Lord Luck",   Args={Bench_Name="Demon_Lord_Luck",   Action="_Progression", Upgrade_Name="Luck"}},
            {Name="Demon Lord Coins",  Args={Bench_Name="Demon_Lord_Coins",  Action="_Progression", Upgrade_Name="Coins"}},
        },
        ["World 17"] = {
            {Name="Damage Cells", Args={Bench_Name="Damage_Cells", Action="_Progression", Upgrade_Name="Damage"}},
        },
        ["World 18"] = {
            {Name="Akuma Damage", Args={Bench_Name="Akuma_Damage", Action="_Progression", Upgrade_Name="Damage"}},
            {Name="Akuma Energy", Args={Bench_Name="Akuma_Energy", Action="_Progression", Upgrade_Name="Energy"}},
        },
        ["World 20"] = {
            {Name="Dragon Energy", Args={Bench_Name="Dragon_Energy", Action="_Progression", Upgrade_Name="Energy"}},
            {Name="Dragon Damage", Args={Bench_Name="Dragon_Damage", Action="_Progression", Upgrade_Name="Damage"}},
        },
        ["World 24"] = {
            {Name="Mana_Growth", Args={Bench_Name="Mana_Growth", Action="_Progression", Upgrade_Name="Energy"}},
            {Name="Ultimate_Cast", Args={Bench_Name="Ultimate_Cast", Action="_Progression", Upgrade_Name="Damage"}},
        },
    },
}

--═══════════════════════════════════════════════════════════════════════════
--  🔧 CORE UTILITIES MODULE
--═══════════════════════════════════════════════════════════════════════════
local Utils = {}

local Services = {
    Players           = game:GetService("Players"),
    ReplicatedStorage = game:GetService("ReplicatedStorage"),
    RunService        = game:GetService("RunService"),
    UserInputService  = game:GetService("UserInputService"),
    Workspace         = workspace,
}

local LocalPlayer = Services.Players.LocalPlayer
local Debris      = Services.Workspace:WaitForChild("Debris")
local To_Server   = Services.ReplicatedStorage:WaitForChild("Events"):WaitForChild("To_Server")

local State = {
    Toggles          = {},
    Connections      = {},
    Character        = {},
    SelectedMonsters = {},
    MonsterTitleMap  = {},
    LastFarmTime     = 0,
    LastDungFarmTime = 0,
}

function Utils.FireRemote(args)
    local ok, err = pcall(function() To_Server:FireServer(unpack(args)) end)
    if not ok then warn("⚠️ Remote failed:", err) end
    return ok
end

function Utils.SetHeartbeat(key, enabled, callback)
    if State.Connections[key] then
        State.Connections[key]:Disconnect()
        State.Connections[key] = nil
    end
    if enabled then
        State.Connections[key] = Services.RunService.Heartbeat:Connect(callback)
    end
end

function Utils.UpdateCharacter(character)
    if character then
        State.Character.Root     = character:WaitForChild("HumanoidRootPart", 10)
        State.Character.Humanoid = character:WaitForChild("Humanoid", 10)
    else
        State.Character = {}
    end
end

function Utils.SortWorlds(worldTable)
    local sorted = {}
    for name in pairs(worldTable) do table.insert(sorted, name) end
    table.sort(sorted, function(a, b)
        return tonumber(a:match("%d+")) < tonumber(b:match("%d+"))
    end)
    return sorted
end

function Utils.GetMonsterPart(monster)
    for _, name in ipairs({"Head","LeftArm","Left Arm","LeftLeg","Left Leg","HumanoidRootPart"}) do
        local p = monster:FindFirstChild(name)
        if p then return p end
    end
end

-- Turns off all three farm modes and their heartbeats
function Utils.StopAllFarms()
    State.Toggles.FarmNearest  = false
    State.Toggles.FarmSelected = false
    State.Toggles.FarmDungeon  = false
    Utils.SetHeartbeat("FarmNearest",  false, nil)
    Utils.SetHeartbeat("FarmSelected", false, nil)
    Utils.SetHeartbeat("FarmDungeon",  false, nil)
end

if LocalPlayer.Character then Utils.UpdateCharacter(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(Utils.UpdateCharacter)

--═══════════════════════════════════════════════════════════════════════════
--  🧱 WALL DESTROYER MODULE
--═══════════════════════════════════════════════════════════════════════════
local WallDestroyer = { Enabled = false, LoopRunning = false }

function WallDestroyer:DestroyWalls()
    local dungeons = Services.Workspace:FindFirstChild("Dungeons")
    if not dungeons then return end
    for _, dungeon in ipairs(dungeons:GetChildren()) do
        for _, obj in ipairs(dungeon:GetDescendants()) do
            pcall(function()
                if obj:IsA("Folder") and obj.Name == "Folder"
                and obj.Parent and obj.Parent.Name == "Labrinth" then
                    for _, w in ipairs(obj:GetChildren()) do w:Destroy() end
                end
                if obj:IsA("BasePart") and obj.Name == "Wall"
                and obj:FindFirstAncestor("Labrinth") then obj:Destroy() end
                if obj.Name == "Labrinth" then obj:Destroy() end
            end)
        end
    end
end

function WallDestroyer:Run()
    if self.LoopRunning then return end
    self.LoopRunning = true
    while self.Enabled do
        self:DestroyWalls()
        task.wait(Config.WallDestroyer.UpdateRate)
    end
    self.LoopRunning = false
end

--═══════════════════════════════════════════════════════════════════════════
--  ⚔️ COMBAT MODULE
--═══════════════════════════════════════════════════════════════════════════
local Combat = {}

function Combat.AttackNearest()
    if not State.Character.Root then return end
    local nearest, closestDist = nil, math.huge
    local monstersFolder = Debris:FindFirstChild("Monsters")
    if not monstersFolder then return end
    for _, monster in pairs(monstersFolder:GetChildren()) do
        local mRoot = monster:FindFirstChild("HumanoidRootPart")
        local mHum  = monster:FindFirstChild("Humanoid")
        if mRoot and mHum and mHum.Health > 0 then
            local dist = (mRoot.Position - State.Character.Root.Position).Magnitude
            if dist < closestDist and dist <= Config.Settings.AttackRange then
                nearest     = monster
                closestDist = dist
            end
        end
    end
    if nearest then Utils.FireRemote({{Id = nearest.Name, Action = "_Mouse_Click"}}) end
end

--═══════════════════════════════════════════════════════════════════════════
--  👹 FARMING MODULE
--═══════════════════════════════════════════════════════════════════════════
local Farming = {}

function Farming.GetMonsterList()
    local list, seen = {}, {}
    local monstersFolder = Debris:FindFirstChild("Monsters")
    if not monstersFolder then return {}, {} end

    for _, monster in ipairs(monstersFolder:GetChildren()) do
        local title = monster:GetAttribute("Title")
        local rank  = monster:GetAttribute("Rank")
        local maxHP = monster:GetAttribute("Max_Health")

        if title and not seen[title] then
            seen[title] = true
            local display
            if rank and maxHP then
                display = string.format("[%s] %s  |  %s", tostring(rank), title:gsub("_"," "), tostring(maxHP))
            elseif maxHP then
                display = string.format("%s  |  %s", title:gsub("_"," "), tostring(maxHP))
            else
                display = title:gsub("_"," ")
            end
table.insert(list, {
    display = display,
    title = title,
    rank = rank
})
        end
    end

    -- Rank priority (highest → lowest)
local RankOrder = {
    SSS = 1,
    SS  = 2,
    S   = 3,
    A   = 4,
    B   = 5,
    C   = 6,
    D   = 7,
    E   = 8
}

table.sort(list, function(a, b)
    local rankA = a.rank or "E"
    local rankB = b.rank or "E"

    local orderA = RankOrder[rankA] or 999
    local orderB = RankOrder[rankB] or 999

    if orderA == orderB then
        return a.display < b.display
    end

    return orderA < orderB
end)

    local displayList, titleMap = {}, {}
    for _, item in ipairs(list) do
        table.insert(displayList, item.display)
        titleMap[item.display] = item.title
    end
    return displayList, titleMap
end

function Farming.FarmMonsters(mode)
    local now = os.clock()
    if now - State.LastFarmTime < Config.Settings.FarmDelay then return end
    State.LastFarmTime = now
    if not State.Character.Root then return end

    local monstersFolder = Debris:FindFirstChild("Monsters")
    if not monstersFolder then return end

    local candidates = {}
    for _, monster in ipairs(monstersFolder:GetChildren()) do
        local part = Utils.GetMonsterPart(monster)
        local hum  = monster:FindFirstChild("Humanoid")
        if part and hum and hum.Health > 0 then
            if mode == "Selected" then
                if table.find(State.SelectedMonsters, monster:GetAttribute("Title")) then
                    table.insert(candidates, {monster = monster, part = part})
                end
            elseif mode == "Nearest" then
                table.insert(candidates, {monster = monster, part = part})
            end
        end
    end
    if #candidates == 0 then return end

    table.sort(candidates, function(a, b)
        return (a.part.Position - State.Character.Root.Position).Magnitude
             < (b.part.Position - State.Character.Root.Position).Magnitude
    end)

    local target = candidates[1]
    if target then
        pcall(function()
            State.Character.Root.CFrame = target.part.CFrame * CFrame.new(0, 5, 0)
        end)
    end
end

-- ── Auto Farm Dungeon ──────────────────────────────────────────────────────
-- Identical to Farm Nearest but filters to monsters that have Is_Dungeon set.
-- If no such monster exists yet the function returns early and retries next tick.
function Farming.FarmDungeon()
    local now = os.clock()
    if now - State.LastDungFarmTime < Config.Settings.FarmDelay then return end
    State.LastDungFarmTime = now
    if not State.Character.Root then return end

    local monstersFolder = Debris:FindFirstChild("Monsters")
    if not monstersFolder then return end

    local candidates = {}
    for _, monster in ipairs(monstersFolder:GetChildren()) do
        local part      = Utils.GetMonsterPart(monster)
        local hum       = monster:FindFirstChild("Humanoid")
        local isDungeon = monster:GetAttribute("Is_Dungeon")
        if part and hum and hum.Health > 0 and isDungeon then
            table.insert(candidates, {monster = monster, part = part})
        end
    end

    -- No dungeon monsters spawned yet — wait silently
    if #candidates == 0 then return end

    table.sort(candidates, function(a, b)
        return (a.part.Position - State.Character.Root.Position).Magnitude
             < (b.part.Position - State.Character.Root.Position).Magnitude
    end)

    local target = candidates[1]
    if target then
        pcall(function()
            State.Character.Root.CFrame = target.part.CFrame * CFrame.new(0, 5, 0)
        end)
    end
end

--═══════════════════════════════════════════════════════════════════════════
--  🎨 UI  ·  WindUI Boreal Edition
--═══════════════════════════════════════════════════════════════════════════
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/WindUiBoreal/Source.lua"
))()

local Window = WindUI:CreateWindow({
    Title        = "AES Hub  ·  v" .. Config.Version,
    Icon         = "swords",
    Size         = UDim2.fromOffset(740, 560),
    ModernLayout = true,
    Resizable    = true,
    Theme        = "Dark",
    Watermark    = {
        Enabled  = true,
        Text     = "Ranja Anime Eternal  ·  v" .. Config.Version,
        Opacity  = 0.45,
        Position = "bottom-right",
        Size     = 14,
        Padding  = 12,
        Offset   = Vector2.new(0, 0),
    },
})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  📌  SIDEBAR  ·  Quick Actions                                        ║
--║                                                                       ║
--║  SideBarButton = momentary (press once)                               ║
--║  Farm toggles use manual state tracking since WindUI Boreal           ║
--║  SideBarButton has no built-in toggle state — we track it ourselves   ║
--║  and reflect the on/off status in the notification.                   ║
--╚═══════════════════════════════════════════════════════════════════════╝

Window:SideBarLabel({ Title = "AES Hub" })

-- ── Redeem Codes ───────────────────────────────────────────────────────────
Window:SideBarButton({
    Title    = "Redeem Codes",
    Icon     = "ticket",
    Callback = function()
        WindUI:Notify({Title="Redeeming…", Content="Attempting "..#Config.Codes.." codes", Icon="loader", Duration=3})
        task.spawn(function()
            local count = 0
            for _, code in ipairs(Config.Codes) do
                if Utils.FireRemote({{Action="_Redeem_Code", Text=code}}) then count += 1 end
                task.wait(0.1)
            end
            WindUI:Notify({Title="Done", Content=count.."/"..#Config.Codes.." codes sent", Icon="check-circle", Duration=4})
        end)
    end,
})

-- ── Farm Nearest — quick toggle ────────────────────────────────────────────
Window:SideBarButton({
    Title    = "Farm Nearest",
    Icon     = "map-pin",
    Callback = function()
        local turning_on = not State.Toggles.FarmNearest
        Utils.StopAllFarms()
        if turning_on then
            State.Toggles.FarmNearest = true
            Utils.SetHeartbeat("FarmNearest", true, function() Farming.FarmMonsters("Nearest") end)
            WindUI:Notify({Title="Farm Nearest  ON", Content="Farming closest monster", Icon="map-pin", Duration=2})
        else
            WindUI:Notify({Title="Farm Nearest  OFF", Content="Stopped", Icon="x", Duration=2})
        end
    end,
})

-- ── Farm Selected — quick toggle ───────────────────────────────────────────
Window:SideBarButton({
    Title    = "Farm Selected",
    Icon     = "crosshair",
    Callback = function()
        local turning_on = not State.Toggles.FarmSelected
        if turning_on and #State.SelectedMonsters == 0 then
            WindUI:Notify({Title="No Selection", Content="Pick monsters in the Monsters tab first", Icon="alert-circle", Duration=3})
            return
        end
        Utils.StopAllFarms()
        if turning_on then
            State.Toggles.FarmSelected = true
            Utils.SetHeartbeat("FarmSelected", true, function() Farming.FarmMonsters("Selected") end)
            WindUI:Notify({Title="Farm Selected  ON", Content="Farming selected monsters", Icon="crosshair", Duration=2})
        else
            WindUI:Notify({Title="Farm Selected  OFF", Content="Stopped", Icon="x", Duration=2})
        end
    end,
})

-- ── Auto Farm Dungeon — quick toggle ───────────────────────────────────────
-- Only targets monsters with the Is_Dungeon attribute.
-- Waits silently if no dungeon monsters have spawned yet.
Window:SideBarButton({
    Title    = "Auto Farm Dungeon",
    Icon     = "sword",
    Callback = function()
        local turning_on = not State.Toggles.FarmDungeon
        Utils.StopAllFarms()
        if turning_on then
            State.Toggles.FarmDungeon = true
            Utils.SetHeartbeat("FarmDungeon", true, function() Farming.FarmDungeon() end)
            WindUI:Notify({Title="Dungeon Farm  ON", Content="Waiting for dungeon monsters…", Icon="sword", Duration=2})
        else
            WindUI:Notify({Title="Dungeon Farm  OFF", Content="Stopped", Icon="x", Duration=2})
        end
    end,
})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  ⚡  AUTO TAB                                                         ║
--╚═══════════════════════════════════════════════════════════════════════╝
local AutoTab = Window:Tab({ Title = "Auto", Icon = "zap" })
AutoTab:Space({})

-- ── Combat ────────────────────────────────────────────────────────────────
local CombatSec = AutoTab:Section({
    Title = "Combat", Icon = "crosshair",
    Box = true, BoxBorder = true, Opened = true,
})
CombatSec:Space({})

CombatSec:Input({
    Title       = "Attack Range  (studs)",
    Desc        = "1 – 1000  ·  Default: 100",
    Placeholder = "Enter studs…",
    Value       = tostring(Config.Settings.AttackRange),
    Callback    = function(v)
        local n = tonumber(v)
        if n and n > 0 and n <= 1000 then
            Config.Settings.AttackRange = n
            WindUI:Notify({Title="Range Updated", Content="Set to "..n.." studs", Icon="check", Duration=2})
        else
            WindUI:Notify({Title="Invalid Value", Content="Enter a number between 1 and 1000", Icon="alert-circle", Duration=3})
        end
    end,
})
CombatSec:Space({})

CombatSec:Toggle({
    Title    = "Auto Attack",
    Desc     = "Continuously attacks the nearest monster",
    Icon     = "sword",
    Value    = false,
    Callback = function(v)
        State.Toggles.AutoAttack = v
        Utils.SetHeartbeat("AutoAttack", v, Combat.AttackNearest)
    end,
})
CombatSec:Space({})

-- ── Dungeon Tools ──────────────────────────────────────────────────────────
local DungSec = AutoTab:Section({
    Title = "Dungeon Tools", Icon = "shield",
    Box = true, BoxBorder = true, Opened = true,
})
DungSec:Space({})

DungSec:Toggle({
    Title    = "Wall Destroyer",
    Desc     = "Destroys Labyrinth walls every 0.5 s",
    Icon     = "hammer",
    Value    = false,
    Callback = function(v)
        WallDestroyer.Enabled = v
        if v then
            WindUI:Notify({Title="Wall Destroyer ON", Content="Clearing walls every "..Config.WallDestroyer.UpdateRate.."s", Icon="hammer", Duration=3})
            task.spawn(function() WallDestroyer:Run() end)
        else
            WindUI:Notify({Title="Wall Destroyer OFF", Content="Stopped", Icon="x", Duration=2})
        end
    end,
})
DungSec:Space({})

DungSec:Toggle({
    Title    = "Door ESP  (350 m)",
    Desc     = "Green = Start  ·  Red = Boss  ·  Orange = Monster",
    Icon     = "eye",
    Value    = false,
    Callback = function(v)
        getgenv().DoorESP.Enabled = v
        if v then
            WindUI:Notify({Title="Door ESP ON", Content="Highlighting dungeon doors…", Icon="eye", Duration=3})
        else
            WindUI:Notify({Title="Door ESP OFF", Content="Labels & tracers hidden", Icon="eye-off", Duration=2})
        end
    end,
})
DungSec:Space({})

DungSec:Toggle({
    Title    = "Door Tracers",
    Desc     = "Show line from screen centre to closest door",
    Icon     = "navigation",
    Value    = true,
    Callback = function(v)
        getgenv().DoorESP.ShowTracers = v
    end,
})
DungSec:Space({})

DungSec:Toggle({
    Title    = "Door Labels",
    Desc     = "Show [ TYPE · Distance ] text above doors",
    Icon     = "tag",
    Value    = true,
    Callback = function(v)
        getgenv().DoorESP.ShowLabels = v
    end,
})
DungSec:Space({})

DungSec:Slider({
    Title    = "ESP Max Distance",
    Desc     = "Studs — doors beyond this are ignored",
    Value    = { Min = 50, Max = 800, Default = 350 },
    Step     = 10,
    Callback = function(v)
        getgenv().DoorESP.MaxDistance = v
    end,
})
DungSec:Space({})

-- ── Progression ────────────────────────────────────────────────────────────
local ProgAutoSec = AutoTab:Section({
    Title = "Progression", Icon = "trending-up",
    Box = true, BoxBorder = true, Opened = true,
})
ProgAutoSec:Space({})

ProgAutoSec:Toggle({
    Title    = "Auto Rank Up",
    Desc     = "Continuously ranks up your character",
    Icon     = "chevrons-up",
    Value    = false,
    Callback = function(v)
        State.Toggles.RankUp = v
        Utils.SetHeartbeat("RankUp", v, function()
            Utils.FireRemote({{Upgrading_Name="Rank", Action="_Upgrades", Upgrade_Name="Rank_Up"}})
        end)
    end,
})
ProgAutoSec:Space({})
AutoTab:Space({})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  🥚  AUTO HATCH TAB                                                   ║
--╚═══════════════════════════════════════════════════════════════════════╝
local EggTab = Window:Tab({ Title = "AutoHatch", Icon = "egg" })
EggTab:Space({})

local HatchCfgSec = EggTab:Section({
    Title = "Settings", Icon = "settings",
    Box = true, BoxBorder = true, Opened = true,
})
HatchCfgSec:Space({})

HatchCfgSec:Input({
    Title       = "Stars per Open",
    Desc        = "How many stars to open per tick  (1 – 100)",
    Placeholder = "Default: 30",
    Value       = tostring(Config.Settings.StarOpenAmount),
    Callback    = function(v)
        local n = tonumber(v)
        if n and n > 0 and n <= 100 then
            Config.Settings.StarOpenAmount = n
            WindUI:Notify({Title="Updated", Content="Opening "..n.." stars per tick", Icon="check", Duration=2})
        end
    end,
})
HatchCfgSec:Space({})
EggTab:Space({})

-- Stars 1 – 20
local Stars1Sec = EggTab:Section({
    Title = "Stars  1 – 20", Icon = "star",
    Box = true, BoxBorder = true, Opened = false,
})
for i = 1, 20 do
    Stars1Sec:Space({})
    Stars1Sec:Toggle({
        Title    = "Star " .. i,
        Value    = false,
        Callback = function(v)
            local key = "Star_"..i
            State.Toggles[key] = v
            Utils.SetHeartbeat(key, v, function()
                Utils.FireRemote({{Open_Amount=Config.Settings.StarOpenAmount, Action="_Stars", Name="Star_"..i}})
            end)
        end,
    })
end
Stars1Sec:Space({})
EggTab:Space({})

-- Stars 21 – 40
local Stars2Sec = EggTab:Section({
    Title = "Stars  21 – 40", Icon = "star",
    Box = true, BoxBorder = true, Opened = false,
})
for i = 21, 40 do
    Stars2Sec:Space({})
    Stars2Sec:Toggle({
        Title    = "Star " .. i,
        Value    = false,
        Callback = function(v)
            local key = "Star_"..i
            State.Toggles[key] = v
            Utils.SetHeartbeat(key, v, function()
                Utils.FireRemote({{Open_Amount=Config.Settings.StarOpenAmount, Action="_Stars", Name="Star_"..i}})
            end)
        end,
    })
end
Stars2Sec:Space({})
EggTab:Space({})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  👹  MONSTERS TAB                                                     ║
--╚═══════════════════════════════════════════════════════════════════════╝
local MonsterTab = Window:Tab({ Title = "Monsters", Icon = "skull" })
MonsterTab:Space({})

-- ── Farm Settings ──────────────────────────────────────────────────────────
local MonCfgSec = MonsterTab:Section({
    Title = "Farm Settings", Icon = "settings-2",
    Box = true, BoxBorder = true, Opened = true,
})
MonCfgSec:Space({})

MonCfgSec:Input({
    Title       = "Farm Delay  (seconds)",
    Desc        = "Applies to all farm modes  ·  Min: 0.1  ·  Max: 5",
    Placeholder = "e.g.  0.5",
    Value       = tostring(Config.Settings.FarmDelay),
    Callback    = function(v)
        local n = tonumber(v)
        if n and n >= 0.1 and n <= 5 then
            Config.Settings.FarmDelay = n
            WindUI:Notify({Title="Delay Updated", Content=n.."s between farm ticks", Icon="check", Duration=2})
        end
    end,
})
MonCfgSec:Space({})

-- ── Monster Selection ──────────────────────────────────────────────────────
local MonSelSec = MonsterTab:Section({
    Title = "Monster Selection", Icon = "list",
    Box = true, BoxBorder = true, Opened = true,
})
MonSelSec:Space({})

local monDisplayList, monTitleMap = Farming.GetMonsterList()
State.MonsterTitleMap = monTitleMap

local MonDropdown = MonSelSec:Dropdown({
    Title            = "Select Monster(s)",
    Desc             = "Format:  [Rank]  Name  |  Max HP",
    Values           = monDisplayList,
    Value            = {},
    Multi            = true,
    AllowNone        = true,
    SearchBarEnabled = true,
    Callback         = function(options)
        State.SelectedMonsters = {}
        for _, disp in ipairs(options) do
            local title = State.MonsterTitleMap[disp]
            if title then table.insert(State.SelectedMonsters, title) end
        end
    end,
})
MonSelSec:Space({})

MonSelSec:Button({
    Title    = "Refresh Monster List",
    Desc     = "Rescans monsters currently in the world",
    Icon     = "refresh-cw",
    Callback = function()
        State.SelectedMonsters = {}
        local newList, newMap = Farming.GetMonsterList()
        State.MonsterTitleMap = newMap
        MonDropdown:Refresh(newList)
        MonDropdown:Select({})
        WindUI:Notify({Title="Refreshed", Content="Monster list updated ("..#newList.." found)", Icon="check", Duration=2})
    end,
})
MonSelSec:Space({})

-- ── Auto Farm ──────────────────────────────────────────────────────────────
local FarmSec = MonsterTab:Section({
    Title = "Auto Farm", Icon = "swords",
    Box = true, BoxBorder = true, Opened = true,
})
FarmSec:Space({})

FarmSec:Toggle({
    Title    = "Farm Selected Monsters",
    Desc     = "Teleports to and farms chosen monsters",
    Icon     = "crosshair",
    Value    = false,
    Callback = function(v)
        if v and #State.SelectedMonsters == 0 then
            WindUI:Notify({Title="No Selection", Content="Pick at least one monster first", Icon="alert-circle", Duration=3})
            return
        end
        Utils.StopAllFarms()
        if v then
            State.Toggles.FarmSelected = true
            Utils.SetHeartbeat("FarmSelected", true, function() Farming.FarmMonsters("Selected") end)
        end
    end,
})
FarmSec:Space({})

FarmSec:Toggle({
    Title    = "Farm Nearest Monster",
    Desc     = "Always teleports to the closest monster",
    Icon     = "map-pin",
    Value    = false,
    Callback = function(v)
        Utils.StopAllFarms()
        if v then
            State.Toggles.FarmNearest = true
            Utils.SetHeartbeat("FarmNearest", true, function() Farming.FarmMonsters("Nearest") end)
        end
    end,
})
FarmSec:Space({})
MonsterTab:Space({})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  🎲  ROLLS TAB                                                        ║
--╚═══════════════════════════════════════════════════════════════════════╝
local RollTab = Window:Tab({ Title = "Rolls", Icon = "dice-6" })
RollTab:Space({})

local RollCfgSec = RollTab:Section({
    Title = "Roll Settings", Icon = "settings",
    Box = true, BoxBorder = true, Opened = true,
})
RollCfgSec:Space({})

RollCfgSec:Input({
    Title       = "Rolls per Gacha",
    Desc        = "Times to roll per heartbeat  (1 – 100)",
    Placeholder = "Default: 4",
    Value       = tostring(Config.Settings.RollAmount),
    Callback    = function(v)
        local n = tonumber(v)
        if n and n > 0 and n <= 100 then
            Config.Settings.RollAmount = n
            WindUI:Notify({Title="Updated", Content="Rolling "..n.."x per gacha", Icon="check", Duration=2})
        end
    end,
})
RollCfgSec:Space({})

local GachaToggles = {}

for _, worldName in ipairs(Utils.SortWorlds(WorldData.Gachas)) do
    local gList = WorldData.Gachas[worldName]
    if #gList > 0 then
        RollTab:Space({})
        local wSec = RollTab:Section({
            Title = worldName, Icon = "globe",
            Box = true, BoxBorder = true, Opened = false,
        })
        for _, gName in ipairs(gList) do
            wSec:Space({})
            wSec:Toggle({
                Title    = gName:gsub("_"," "),
                Value    = false,
                Callback = function(v) GachaToggles[gName] = v end,
            })
        end
        wSec:Space({})
    end
end

RollTab:Space({})

Services.RunService.Heartbeat:Connect(function()
    for gName, active in pairs(GachaToggles) do
        if active then
            Utils.FireRemote({{Open_Amount=Config.Settings.RollAmount, Action="_Gacha_Activate", Name=gName}})
        end
    end
end)

--╔═══════════════════════════════════════════════════════════════════════╗
--║  📈  PROGRESSION TAB                                                  ║
--╚═══════════════════════════════════════════════════════════════════════╝
local ProgTab = Window:Tab({ Title = "Progression", Icon = "trending-up" })

for _, worldName in ipairs(Utils.SortWorlds(WorldData.Upgrades)) do
    local upgrades = WorldData.Upgrades[worldName]
    if #upgrades > 0 then
        ProgTab:Space({})
        local pSec = ProgTab:Section({
            Title = worldName, Icon = "arrow-up-circle",
            Box = true, BoxBorder = true, Opened = false,
        })
        for _, upg in ipairs(upgrades) do
            pSec:Space({})
            pSec:Toggle({
                Title    = upg.Name,
                Value    = false,
                Callback = function(v)
                    State.Toggles[upg.Name] = v
                    Utils.SetHeartbeat(upg.Name, v, function()
                        Utils.FireRemote({upg.Args})
                    end)
                end,
            })
        end
        pSec:Space({})
    end
end
ProgTab:Space({})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  📦  MISC TAB                                                         ║
--╚═══════════════════════════════════════════════════════════════════════╝
local MiscTab = Window:Tab({ Title = "Misc", Icon = "box" })
MiscTab:Space({})

-- Chests
local ChestSec = MiscTab:Section({
    Title = "Chests", Icon = "package",
    Box = true, BoxBorder = true, Opened = true,
})
ChestSec:Space({})

ChestSec:Toggle({
    Title    = "Auto Claim Chests",
    Desc     = "Claims Daily, Group and seasonal chests",
    Icon     = "gift",
    Value    = false,
    Callback = function(v)
        State.Toggles.AutoChests = v
        if v then
            task.spawn(function()
                while State.Toggles.AutoChests do
                    for _, chest in ipairs(Config.Chests) do
                        if not State.Toggles.AutoChests then break end
                        Utils.FireRemote({{Action="_Chest_Claim", Name=chest}})
                        task.wait(1)
                    end
                    task.wait(5)
                end
            end)
        end
    end,
})
ChestSec:Space({})

-- Dungeons
local DungMiscSec = MiscTab:Section({
    Title = "Dungeons", Icon = "door-open",
    Box = true, BoxBorder = true, Opened = true,
})
DungMiscSec:Space({})

DungMiscSec:Button({
    Title    = "Enter Ice Raid",
    Desc     = "Teleport into the Ice Raid dungeon",
    Icon     = "snowflake",
    Callback = function()
        Utils.FireRemote({{Action="_Enter_Dungeon", Name="Ice_Raid"}})
        WindUI:Notify({Title="Entering", Content="Ice Raid", Icon="door-open", Duration=2})
    end,
})
DungMiscSec:Space({})

DungMiscSec:Button({
    Title    = "Enter Kaiju Dungeon",
    Desc     = "Teleport into the Kaiju Dungeon",
    Icon     = "footprints",
    Callback = function()
        Utils.FireRemote({{Name="Kaiju_Dungeon", Action="_Enter_Dungeon", Is_New=true}})
        WindUI:Notify({Title="Entering", Content="Kaiju Dungeon", Icon="door-open", Duration=2})
    end,
})
DungMiscSec:Space({})

DungMiscSec:Button({
    Title    = "Leave Dungeon",
    Desc     = "Exit the current dungeon",
    Icon     = "log-out",
    Callback = function()
        Utils.FireRemote({{Action="Dungeon_Leave"}})
        WindUI:Notify({Title="Leaving", Content="Dungeon exited", Icon="log-out", Duration=2})
    end,
})
DungMiscSec:Space({})
MiscTab:Space({})

--╔═══════════════════════════════════════════════════════════════════════╗
--║  ⚙️  SETTINGS TAB                                                     ║
--╚═══════════════════════════════════════════════════════════════════════╝
local SettTab = Window:Tab({ Title = "Settings", Icon = "settings" })
SettTab:Space({})

local UISec = SettTab:Section({
    Title = "UI Controls", Icon = "layout-dashboard",
    Box = true, BoxBorder = true, Opened = true,
})
UISec:Space({})

UISec:Keybind({
    Title    = "Toggle Hub",
    Desc     = "Key to show / hide the entire hub",
    Value    = Config.Settings.UIToggleKey,
    Callback = function(v)
        if v and Enum.KeyCode[v] then
            Window:SetToggleKey(Enum.KeyCode[v])
        end
    end,
})
UISec:Space({})

UISec:Button({
    Title    = "Reset All Toggles",
    Desc     = "Turns off every active feature",
    Icon     = "power-off",
    Callback = function()
        for key, conn in pairs(State.Connections) do
            conn:Disconnect()
            State.Connections[key] = nil
        end
        State.Toggles             = {}
        State.SelectedMonsters    = {}
        WallDestroyer.Enabled     = false
        getgenv().DoorESP.Enabled = false
        WindUI:Notify({Title="Reset", Content="All toggles turned off", Icon="check-circle", Duration=3})
    end,
})
UISec:Space({})
SettTab:Space({})

--═══════════════════════════════════════════════════════════════════════════
--  🎉 INIT
--═══════════════════════════════════════════════════════════════════════════
WindUI:Notify({
    Title    = "AES Hub  v" .. Config.Version,
    Content  = "Loaded!  Press " .. Config.Settings.UIToggleKey .. " to toggle.",
    Icon     = "check-circle",
    Duration = 5,
})
