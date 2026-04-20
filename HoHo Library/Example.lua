-------------------------------------------------------
 --                 Library Setup                 --
-------------------------------------------------------
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/HohoLib.lua", true))()
-------------------------------------------------------
 --                 Window Ui                 --
-------------------------------------------------------

local win = lib:Window(
    "My Awesome Hub",                    -- Hub title,hub_name (string)   
    "Adopt Me!",                         -- ,game_name usually (string)  
    Color3.fromRGB(0, 170, 255)          -- ,main_color (Color3)    - Primary accent color for UI elements
)

-------------------------------------------------------
 --                 Tabs  Section                 --
-------------------------------------------------------

local mainTab = win:Tab("Main")  -- Tab_Name (string)  
local settingsTab = win:Tab("Settings") -- Tab_Name (string) 


-------------------------------------------------------
 --                 Label Section                 --
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
local Label = mainTab:Label("Custom Styled", {

    Font = Enum.Font.GothamBold, -- or Font = Enum.Font.Code
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 215, 0), 
    TextStrokeColor3 = Color3.new(0,0,0),
    TextStrokeTransparency = 0.8,
    

    TextXAlignment = Enum.TextXAlignment.Center,
    TextWrapped = true,
    

    Visible = true,
    TextTransparency = 0,
    
    -- Any other TextLabel property...
})

-------------------------------------------------------
 --                 Button Section                 --
-------------------------------------------------------
--[[
Methods
Update Button Name | 

actionBtn:NewButton("Stop Farming") -- Change button text

]]

--                                ⬇️ Button Name
local actionBtn = mainTab:Button("Start Farming", function()
    print("Farming started!") -- Your Code 
end)

-------------------------------------------------------
 --                 Toggle Section                 --
-------------------------------------------------------

--[[
Methods | 

        :NewText(newText)  - Update the Toggle text
        :NewState(boolean) - Programmatically change toggle state
]]

--                                  ⬇️toggle_text (string),default_state
local autoCollect = mainTab:Toggle("Auto-Collect Coins", false, function(v)
    -- Your Logic 
end)

-------------------------------------------------------
 --                 Slider Section                 --
-------------------------------------------------------

--[[
    Note: Value updates continuously while dragging + on release
]]

-- ⬇️     label (string) , min (number) , max (number) ,  default (number)
mainTab:Slider(" WalkSpeed", 1, 100, 30, function(value)
    
end)

-------------------------------------------------------
 --                 Dropdown Section                 --
-------------------------------------------------------

--[[
     methods | 
        :NewText("newLabel")       - Update the prefix label
        :NewDrop({"NewOption","1",1,}) - Replace dropdown options dynamically
]]

-- ⬇️ label (string) , options (table) - Array of values (strings, numbers, etc.)
local weaponDrop = mainTab:Dropdown("🔫 Equip Weapon", 
    {"Sword", "Bow", "Magic Staff", "Dual Daggers"}, 
    function(v)
        
    end
)

-------------------------------------------------------
 --                 Text Box Section                 --
-------------------------------------------------------

--[[
    Note: Callback fires on FocusLost (when user finishes typing)
]]

--               ⬇️ label (string), placeholder (string) ,
mainTab:Textbox("Find Player", "Enter username...", function(v)
    
end)
-------------------------------------------------------
 --                 Line  /  Seperator  Section                 --
-------------------------------------------------------

-- Adds a horizontal divider line for visual organization.

mainTab:Line()  

-------------------------------------------------------
 --                 Notification Section                 --
-------------------------------------------------------

--        ⬇️ message (string) ,  duration (number)
lib:Nof("✅ Script loaded successfully!", 3)

-------------------------------------------------------
