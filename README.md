##  Quick Start

### Library

```lua
-- Method A: Direct load (if hosted online)
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/HohoLib.lua", true))()


```

### Create Window

```lua

local win = lib:Window(
    "My Awesome Hub",                    -- Hub title,hub_name (string)      - Title displayed in the top-left of the sidebar
    "Adopt Me!",                         -- Target game name,game_name (string)     - Game name shown in the top bar
    Color3.fromRGB(0, 170, 255)          -- Cyan accent color,main_color (Color3)    - Primary accent color for UI elements
)
```

### Tab

```lua

local mainTab = win:Tab("⚙️ Main")  -- tab_name (string) - Name displayed on the tab button
local settingsTab = win:Tab("🔧 Settings") -- tab_name (string) - Name displayed on the tab button
```

---

### Label

```lua
--[[
Info | 
1. Only The Text is Not Optional 
so you could do :

local hiddenLabel = mainTab:Label("Secret Info")


Updating Label | 
    :NewLabel(newText, properties?) -- Update text/properties dynamically
    
]]

local hiddenLabel = mainTab:Label("Secret Info", {Visible = true,TextColor3 = Color3.fromRGB(255, 100, 100),Font = Enum.Font.Code})

```

---

### Button

```lua
--[[
Methods
Update Button Name | 

actionBtn:NewButton("Stop Farming") -- Change button text

]]

--                                ⬇️ Button Name
local actionBtn = mainTab:Button("Start Farming", function()
    print("Farming started!") -- Your Code 
end)

```

---

### Toggle

```lua
--[[
Methods | 

        :NewText(newText)  - Update the Toggle text
        :NewState(boolean) - Programmatically change toggle state
]]

--                                  ⬇️toggle_text (string),default_state
local autoCollect = mainTab:Toggle("Auto-Collect Coins", false, function(v)
    -- Your Logic 
end)

```

---

### Slider

```lua
--[[
    Note: Value updates continuously while dragging + on release
]]

-- ⬇️     label (string) , min (number) , max (number) ,  default (number)
mainTab:Slider(" WalkSpeed", 1, 100, 30, function(value)
    
end)

```

---

### Dropdown 

```lua
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

```

---

### Textbox

```lua
--[[
    Note: Callback fires on FocusLost (when user finishes typing)
]]

--               ⬇️ label (string), placeholder (string) ,
mainTab:Textbox("Find Player", "Enter username...", function(v)
    
end)

```

---

### ➖ Line Separator

```lua
--[[
    Adds a horizontal divider line for visual organization.
    
    Parameters: None
]]

mainTab:Label("⚙️ Movement Settings")
mainTab:Slider("Speed", 16, 100, 16, function(v) end)
mainTab:Slider("Jump", 50, 200, 50, function(v) end)

mainTab:Line()  -- Visual break

mainTab:Label("🎨 Visual Settings")
mainTab:Toggle("Fullbright", false, function(v) end)
mainTab:Toggle("Chams", false, function(v) end)
```

---

## 🔔 Notifications

```lua
--[[
    Shows an animated toast notification.
    
    Parameters:
    1. message (string) - Text to display
    2. duration (number) - How long to show (in seconds)
]]

-- Simple notification
lib:Nof("✅ Script loaded successfully!", 3)

-- Error notification
lib:Nof("❌ Failed to connect to server", 5)

-- Usage in callbacks
mainTab:Button("Save Settings", function()
    -- Save logic here
    lib:Nof("💾 Settings saved!", 2)
end)
```

---

## 🎨 Advanced Configuration

### Custom Colors

```lua
-- Use predefined Color3 values
local win = lib:Window("Hub", "Game", Color3.fromRGB(255, 105, 180)) -- Hot Pink

-- Use HSB for vibrant colors
local win = lib:Window("Hub", "Game", Color3.fromHSV(0.6, 0.8, 1)) -- Blue

-- Use hex helper (if you have one) or convert manually:
local function hexToColor(hex)
    hex = hex:gsub("#","")
    return Color3.fromRGB(
        tonumber(hex:sub(1,2), 16),
        tonumber(hex:sub(3,4), 16),
        tonumber(hex:sub(5,6), 16)
    )
end
local win = lib:Window("Hub", "Game", hexToColor("#9B59B6")) -- Purple
```

### Property Overrides for Labels

```lua
-- Any Roblox TextLabel property can be passed in the properties table
mainTab:Label("Custom Styled", {
    -- Text properties
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 215, 0), -- Gold
    TextStrokeColor3 = Color3.new(0,0,0),
    TextStrokeTransparency = 0.8,
    
    -- Layout properties
    TextXAlignment = Enum.TextXAlignment.Center,
    TextWrapped = true,
    
    -- Visibility/animation
    Visible = true,
    TextTransparency = 0,
    
    -- Any other TextLabel property...
})
```
