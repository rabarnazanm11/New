local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/Mentality%20Lib/Src/Source.lua"))()

local Window = Library:Window({
    Name    = "My Hub",
    SubName = "v1.0",
    Logo    = "YOUR_ASSET_ID"
})

local KeybindList = Library:KeybindList("Keybinds")

Window:Category("Main")
local MainPage = Window:Page({ Name = "Main", Icon = "YOUR_ASSET_ID" })

Window:Category("Settings")
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList)

local Section = MainPage:Section({ Name = "General", Side = 1 })

Section:Toggle({
    Name     = "Auto Farm",
    Flag     = "AutoFarm",
    Default  = false,
    Callback = function(Value)
        -- your logic here
    end
})

Section:Slider({
    Name     = "Walk Speed",
    Flag     = "WalkSpeed",
    Min      = 16,
    Max      = 500,
    Default  = 16,
    Decimals = 0,
    Suffix   = "wu",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Window:Init()
