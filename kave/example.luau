local Library = loadstring(game:HttpGet(

    "https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/kave/kav.luau"))()

local Window = Library.CreateLib("My Script", "Midnight")

-- Tab 1
local MainTab = Window:NewTab("Main")
local MainSec = MainTab:NewSection("Combat")

MainSec:NewToggle("Auto Farm", "Automatically farms mobs", function(state)
    print("Auto Farm:", state)
end)

MainSec:NewSlider("Walk Speed", "Player walk speed", 200, 16, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

MainSec:NewButton("Teleport to Spawn", "Teleports you to spawn", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 5, 0))
end)

-- Tab 2
local SettingsTab = Window:NewTab("Settings")
local SettingsSec = SettingsTab:NewSection("Preferences")

SettingsSec:NewDropdown("Theme", "Change UI theme",
    {"Midnight", "Ocean", "BloodTheme"},
    function(choice)
        print("Theme chosen:", choice)
    end
)

SettingsSec:NewKeybind("Toggle UI", "Show/hide the menu",
    Enum.KeyCode.RightShift,
    function()
        Library:ToggleUI()
    end
)

SettingsSec:NewColorPicker("Accent Color", "Change the accent color",
    Color3.fromRGB(26, 189, 158),
    function(color)
        Library:ChangeColor("SchemeColor", color)
    end
)


local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "CircleButton"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 50, 0, 50)
Button.Position = UDim2.new(0, 20, 0.5, 0) 
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- change to your SchemeColor
Button.BorderSizePixel = 0
Button.Image = "rbxassetid://15307540148"
Button.AutoButtonColor = false
Button.Active = true
Button.Draggable = true

UICorner.CornerRadius = UDim.new(1, 0) -- makes it perfectly circular
UICorner.Parent = Button

-- Hover effect
Button.MouseEnter:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(46, 209, 178),
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

Button.MouseLeave:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(26, 189, 158),
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end)

-- Click action (plug in whatever you want here)
Button.MouseButton1Click:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 44, 0, 44)
    }):Play()
    task.wait(0.08)
    TweenService:Create(Button, TweenInfo.new(0.08), {
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()

    -- your callback here, e.g.:
    Library:ToggleUI()
end)
