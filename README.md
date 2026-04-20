## 🚀 Quick Start

### Step 1: Load the Library

```lua
-- Method A: Direct load (if hosted online)
local lib = loadstring(game:HttpGet("YOUR_HOSTED_LINK_HERE", true))()

-- Method B: If saved in ReplicatedStorage or ModuleScript
-- local lib = require(script.HoHoLibrary)

-- Method C: Access via global (if already loaded)
-- local lib = _G.hoho
```

### Step 2: Create Your Window

```lua
--[[
    Parameters:
    1. hub_name (string)      - Title displayed in the top-left of the sidebar
    2. game_name (string)     - Game name shown in the top bar
    3. main_color (Color3)    - Primary accent color for UI elements
]]

local win = lib:Window(
    "My Awesome Hub",                    -- Hub title
    "Adopt Me!",                         -- Target game name
    Color3.fromRGB(0, 170, 255)          -- Cyan accent color
)
```

### Step 3: Add a Tab

```lua
--[[
    Parameters:
    1. tab_name (string) - Name displayed on the tab button
]]

local mainTab = win:Tab("⚙️ Main")
local settingsTab = win:Tab("🔧 Settings")
```

---

## 🧩 UI Elements Reference

### 📝 Label (Static Text)

```lua
--[[
    Creates a non-interactive text display.
    
    Parameters:
    1. label_text (string)        - Initial text to display
    2. properties (table, optional) - Table of Roblox TextLabel properties to override
    
    Returns: Object with methods:
        :NewLabel(newText, properties?) - Update text/properties dynamically
]]

-- Basic usage
local statusLabel = mainTab:Label("Status: ✅ Ready")

-- With custom properties (e.g., hide initially)
local hiddenLabel = mainTab:Label("Secret Info", {
    Visible = false,
    TextColor3 = Color3.fromRGB(255, 100, 100),
    Font = Enum.Font.Code
})

-- Update later
hiddenLabel:NewLabel("Status: ⚠️ Loading...", {
    Visible = true,
    TextTransparency = 0
})
```

---

### 🔘 Button

```lua
--[[
    Creates a clickable button with ripple animation.
    
    Parameters:
    1. text (string)           - Button display text
    2. callback (function)     - Function to run when clicked
    
    Returns: Object with methods:
        :NewButton(newText) - Update button text dynamically
]]

-- Basic button
mainTab:Button("🚀 Teleport to Spawn", function()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
        lib:Nof("Teleported! 🎉", 2)  -- Show notification
    end
end)

-- Button with text update capability
local actionBtn = mainTab:Button("Start Farming", function()
    -- Your farming logic here
    print("Farming started!")
end)

-- Change button text later (e.g., toggle state)
actionBtn:NewButton("⏹️ Stop Farming")
```

---

### 🔁 Toggle (Switch)

```lua
--[[
    Creates an on/off toggle switch.
    
    Parameters:
    1. toggle_text (string)    - Label text next to the switch
    2. default_state (boolean) - Initial state: true = ON, false = OFF
    3. callback (function)     - Function(val) called when state changes
    
    Returns: Object with methods:
        :NewText(newText)  - Update the label text
        :NewState(boolean) - Programmatically change toggle state
]]

-- Basic toggle
local autoCollect = mainTab:Toggle("🧲 Auto-Collect Coins", false, function(enabled)
    if enabled then
        print("Auto-collect ENABLED")
        -- Start collection loop
    else
        print("Auto-collect DISABLED")
        -- Stop collection loop
    end
end)

-- Toggle with dynamic updates
local espToggle = mainTab:Toggle("ESP Wallhack", false, function(val)
    -- Toggle ESP rendering
end)

-- Update label text (e.g., for localization)
espToggle:NewText("👁️ See Through Walls")

-- Change state programmatically (e.g., from another script)
espToggle:NewState(true)  -- Turns toggle ON and fires callback
```

---

### 🎚️ Slider (Range Selector)

```lua
--[[
    Creates a draggable slider for numeric values.
    
    Parameters:
    1. label (string)        - Text label for the slider
    2. min (number)          - Minimum value
    3. max (number)          - Maximum value  
    4. default (number)      - Starting value (clamped between min/max)
    5. callback (function)   - Function(val) called when value changes
    
    Note: Value updates continuously while dragging + on release
]]

-- Speed slider (1-100, starts at 30)
mainTab:Slider("🏃 WalkSpeed", 1, 100, 30, function(value)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end)

-- Transparency slider (0-1, starts at 0.5)
mainTab:Slider("🔮 ESP Transparency", 0, 1, 0.5, function(alpha)
    -- Update ESP part transparency
    print("Transparency set to: " .. alpha)
end)

-- Damage multiplier (1-10x, starts at 1x)
mainTab:Slider("⚔️ Damage Multiplier", 1, 10, 1, function(mult)
    _G.damageMultiplier = mult  -- Store for combat script
end)
```

---

### 📋 Dropdown (Selection List)

```lua
--[[
    Creates an expandable dropdown menu.
    
    Parameters:
    1. label (string)         - Prefix text shown before selected value
    2. options (table)        - Array of values (strings, numbers, etc.)
    3. callback (function)    - Function(selectedValue) called on selection
    
    Returns: Object with methods:
        :NewText(newLabel)       - Update the prefix label
        :NewDrop(newOptionsTable) - Replace dropdown options dynamically
]]

-- Weapon selector
local weaponDrop = mainTab:Dropdown("🔫 Equip Weapon", 
    {"Sword", "Bow", "Magic Staff", "Dual Daggers"}, 
    function(weapon)
        print("Equipping: " .. weapon)
        -- Fire remote or change loadout
    end
)

-- Update label later
weaponDrop:NewText("⚔️ Select Melee")

-- Replace options dynamically (e.g., based on player level)
weaponDrop:NewDrop({"Legendary Sword", "Mythic Bow", "Admin Blade"})

-- Team selector with numbers
mainTab:Dropdown("👥 Join Team", 
    {1, 2, 3, 4, "Spectator"}, 
    function(teamId)
        if teamId == "Spectator" then
            -- Handle spectate logic
        else
            -- Join team number
        end
    end
)
```

---

### ⌨️ Textbox (Input Field)

```lua
--[[
    Creates a single-line text input field.
    
    Parameters:
    1. label (string)         - Prefix text before input box
    2. placeholder (string)   - Gray hint text shown when empty
    3. callback (function)    - Function(inputText) called when user presses Enter or clicks away
    
    Note: Callback fires on FocusLost (when user finishes typing)
]]

-- Player name search
mainTab:Textbox("🔍 Find Player", "Enter username...", function(username)
    if username and username:len() > 0 then
        print("Searching for: " .. username)
        -- Implement search logic
    end
end)

-- Command console
mainTab:Textbox("💬 Execute Command", "/teleport ...", function(cmd)
    if cmd:sub(1,1) == "/" then
        print("Running command: " .. cmd)
        -- Parse and execute command
    end
end)

-- Custom value input
mainTab:Textbox("🎯 Set Jump Power", "e.g., 100", function(val)
    local num = tonumber(val)
    if num then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
    end
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

---

## 🔄 Dynamic Updates Example

```lua
-- Create elements and store references for later control
local statusLabel = mainTab:Label("State: Idle")
local startBtn = mainTab:Button("▶️ Start", function()
    -- Start logic
    statusLabel:NewLabel("State: 🟢 Running", {TextColor3 = Color3.fromRGB(0,255,0)})
    startBtn:NewButton("⏹️ Stop")
end)

-- Later in your script (e.g., when task completes)
statusLabel:NewLabel("State: ✅ Complete!", {TextColor3 = Color3.fromRGB(0,200,255)})
startBtn:NewButton("🔄 Restart")
```

---
