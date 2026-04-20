### Test
```lua
-- Old Hoho LiB 
-- Version : Test
--
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/HohoLib.lua", true))()

local win = lib:Window(
    "Wolrd Fighters",                    -- Hub title,hub_name (string)      - Title displayed in the top-left of the sidebar
    "Niga Hub",                         -- Target game name,game_name (string)     - Game name shown in the top bar
    Color3.fromRGB(0, 170, 255)          -- Cyan accent color,main_color (Color3)    - Primary accent color for UI elements
)
-------------------------------------------------------
 --                 Helpers Section                 --
-------------------------------------------------------
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChild("Humanoid")
local Hrp = Character:FindFirstChild("HumanoidRootPart")

-------------------------------------------------------
 --                 Tabs Section                 --
-------------------------------------------------------

local mainTab = win:Tab("Main")  -- tab_name (string) - Name displayed on the tab button
local settingsTab = win:Tab("Settings") -- tab_name (string) - Name displayed on the tab button

-------------------------------------------------------
 --                  Section                 --
-------------------------------------------------------

--[[
Info | 
1. Any Roblox TextLabel property can be passed in the properties table

2. Only The Text is Not Optional 
so you could do :

local hiddenLabel = mainTab:Label("Secret Info")


Updating Label | 
    :NewLabel(newText, properties?) -- Update text/properties dynamically
    
]]
--                           ⬇️ Text (string)
local Label = mainTab:Label("Walk Speed", {

    Font = Enum.Font.GothamBold, -- or Font = Enum.Font.Code
    TextSize = 18,
    TextColor3 = Color3.fromRGB(68,161,252), 
    TextStrokeColor3 = Color3.new(0,0,0),
    TextStrokeTransparency = 0.8,
    

    TextXAlignment = Enum.TextXAlignment.Center,
    TextWrapped = true,
    

    Visible = true,
    TextTransparency = 0,
    
    -- Any other TextLabel property...
})
mainTab:Line()  
--[[
    Note: Callback fires on FocusLost (when user finishes typing)
]]

mainTab:Textbox("Walk Speed ", "Enter Number...", function(v)
    Humanoid.WalkSpeed = v
    lib:Nof("Your Speed is Now " .. v  , 3)

end)
mainTab:Line()  

local LabelJump = mainTab:Label("Jump Power ", {

    Font = Enum.Font.GothamBold, -- or Font = Enum.Font.Code
    TextSize = 18,
    TextColor3 = Color3.fromRGB(68,161,252), 
    TextStrokeColor3 = Color3.new(0,0,0),
    TextStrokeTransparency = 0.8,
    

    TextXAlignment = Enum.TextXAlignment.Center,
    TextWrapped = true,
    

    Visible = true,
    TextTransparency = 0,
    
    -- Any other TextLabel property...
})
mainTab:Line()  

mainTab:Textbox("Jump Power", "Enter Number...", function(v)
    Humanoid.JumpPower = v
    lib:Nof("Your Jump Power is Now " .. v  , 3)

end)
mainTab:Line()  


--[[
Methods
Update Button Name | 

actionBtn:NewButton("Stop Farming") -- Change button text

]]

--                                ⬇️ Button Name
local actionBtn = settingsTab:Button("Use Jump Power ", function()
   Humanoid.UseJumpPower = true
    lib:Nof("You're Now Using Jump Power" , 3)
end)
settingsTab:Line()  

local actionBt3n = settingsTab:Button("Don't Use Jump Power ", function()
   Humanoid.UseJumpPower = false
    lib:Nof("You're Now Not Using Jump Power" , 3)
end)


lib:Nof(" Script loaded successfully!", 3)
```
