# 🌸 Dummy Kawaii UI Library

A feature-rich Roblox exploit UI library with theme support, smooth animations, and a full component system.

---

## 📦 Loading the Library

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/DummYUi/DunmyUi_Source.luau'))()
```

> The library auto-loads its icon spritesheet via HttpGet. Make sure HTTP requests are enabled in your executor.

---

## 🪟 Creating a Window

```lua
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
```

`Library:Window` returns a `Tabs` object used to create tabs, separators, notifications, and dialogs.

---

## 📑 Creating Tabs

```lua
local MainTab = Tabs:Tab({
    Title = "Main",       -- Tab label
    Icon  = "house",      -- Icon name or rbxassetid:// string (default: "house")
})
```

Returns a `Tab` object used to add sections and elements.

### Controlling which Tab opens by default

```lua
Tabs:SelectTab(1)   -- Open the 1st tab by default (call before creating tabs)
```

### Adding a separator line between tabs

```lua
Tabs:Line()   -- Adds a thin divider in the tab sidebar
```

---

## 📋 Creating Sections

Sections are labels inside a tab that group your elements visually.

```lua
local MySection = MainTab:Section({
    Title = "Auto Farm"
})
```

**Methods:**
```lua
MySection:SetTitle("New Name")
```

---

## 🧩 Elements

All elements support `Title`, `Desc`, and `Image` unless noted otherwise.

| Parameter | Type   | Description |
|-----------|--------|-------------|
| `Title`   | string | Element label |
| `Desc`    | string | Subtitle text shown below title (optional) |
| `Image`   | string | Icon name or rbxassetid:// (optional) |

---

### ✅ Toggle

```lua
local MyToggle = MainTab:Toggle({
    Title    = "Auto Farm",
    Desc     = "Farms automatically",   -- optional
    Image    = "",                       -- optional
    Value    = false,                    -- starting state
    Callback = function(value)           -- value is boolean
        print("Toggle:", value)
    end
})
```

**Methods:**
```lua
MyToggle:SetTitle("New Title")
MyToggle:SetDesc("New Desc")
MyToggle:SetValue(true)        -- set state programmatically (fires Callback)
MyToggle:SetVisible(false)     -- show/hide element
```

---

### 🔘 Button

```lua
MainTab:Button({
    Title    = "Teleport",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        -- your code here
    end
})
```

> ⚠️ Button returns **nothing** — no methods available.

---

### 🎚️ Slider

```lua
local MySlider = MainTab:Slider({
    Title    = "Walk Speed",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Min      = 0,               -- minimum value (default: 0)
    Max      = 100,             -- maximum value (default: 100)
    Value    = 16,              -- starting value (default: Min + 1)
    Rounding = 0,               -- decimal places to round to (default: 2)
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
```

**Methods:**
```lua
MySlider:SetTitle("New Title")
MySlider:SetDesc("New Desc")
MySlider:SetValue(50)          -- set value programmatically (fires Callback)
MySlider:SetMin(10)            -- update minimum
MySlider:SetMax(500)           -- update maximum
MySlider:SetVisible(false)
```

---

### 📋 Dropdown

```lua
local MyDropdown = MainTab:Dropdown({
    Title    = "Select Mode",
    Desc     = "",                           -- optional
    Image    = "",                           -- optional
    List     = {"Mode A", "Mode B", "Mode C"},
    Value    = "Mode A",                     -- default selected (or nil)
    Multi    = false,                        -- true = multi-select mode
    Callback = function(selected)
        -- single mode:  selected is a string
        -- multi mode:   selected is a table of strings
        print(selected)
    end
})
```

**Methods:**
```lua
MyDropdown:SetTitle("New Title")
MyDropdown:SetDesc("New Desc")
MyDropdown:SetValue("Mode B")   -- set selected value (fires Callback)
MyDropdown:Add("Mode D")        -- add a new option at runtime
MyDropdown:Clear()              -- remove all options
MyDropdown:Clear("Mode A")      -- remove one specific option by name
MyDropdown:SetVisible(false)
```

---

### 🔑 Keybind

```lua
local MyKeybind = MainTab:Keybind({
    Title    = "Spam Key",
    Desc     = "",                      -- optional
    Image    = "",                      -- optional
    Key      = Enum.KeyCode.E,          -- default key
    Value    = false,                   -- starting toggle state
    Callback = function(key, value)     -- fires on key change AND on key press
        print("Key:", key, "| Active:", value)
    end
})
```

> Clicking the key badge in the UI lets the user rebind it. The Callback fires both when the key is rebound and every time the key is pressed.

**Methods:**
```lua
MyKeybind:SetTitle("New Title")
MyKeybind:SetDesc("New Desc")
MyKeybind:SetValue(true)                    -- set toggle state (fires Callback)
MyKeybind:SetKey(Enum.KeyCode.F)            -- change the key programmatically
MyKeybind:SetVisible(false)
```

---

### 🎨 ColorPicker

```lua
local MyColorPicker = MainTab:ColorPicker({
    Title    = "ESP Color",
    Desc     = "",                              -- optional
    Image    = "",                              -- optional
    Value    = Color3.fromRGB(255, 0, 0),       -- starting color
    Callback = function(color)                  -- color is Color3
        print("Color:", color)
    end
})
```

**Methods:**
```lua
MyColorPicker:SetTitle("New Title")
MyColorPicker:SetDesc("New Desc")
MyColorPicker:SetVisible(false)
```

---

### 🏷️ Label

```lua
local MyLabel = MainTab:Label({
    Title = "Version 1.0.0",
    Desc  = "Made by Bora",   -- optional subtitle
    Image = "",                -- optional
})
```

**Methods:**
```lua
MyLabel:SetTitle("New Title")
MyLabel:SetDesc("New Desc")
MyLabel:SetVisible(false)
```

---

### 📝 Textbox

```lua
local MyTextbox = MainTab:Textbox({
    Title            = "Input Text",
    Desc             = "Type something here",   -- optional
    Image            = "",                       -- optional
    Placeholder      = "Enter value...",
    Value            = "",                       -- starting text
    ClearTextOnFocus = false,
    Callback         = function(text)            -- fires on FocusLost
        print("Input:", text)
    end
})
```

**Methods:**
```lua
MyTextbox:SetTitle("New Title")
MyTextbox:SetDesc("New Desc")
MyTextbox:SetVisible(false)
```

---

### 💻 Code

Displays a syntax-highlighted, read-only code block with a built-in Copy button.

```lua
local MyCode = MainTab:Code({
    Title = "Auto Farm Script",
    Code  = 'print("Hello World")',   -- Lua code string to display
})
```

**Methods:**
```lua
MyCode:SetTitle("New Title")
MyCode:SetCode('print("Updated!")')   -- update the displayed code
```

---

## 🔔 Notifications

```lua
Tabs:Notify({
    Title = "Loaded!",
    Desc  = "Hub injected successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
```

---

## 💬 Dialog

```lua
Tabs:Dialog({
    Title   = "Are you sure you want to <font color='#FF0000'>close</font>?",
    Button1 = {
        Title    = "Confirm",
        Color    = Color3.fromRGB(0, 188, 0),
        Callback = function()
            print("Confirmed!")
        end
    },
    Button2 = {
        Title = "Cancel",
        Color = Color3.fromRGB(226, 39, 6),
        -- no Callback = just closes the dialog
    }
})
```

> `Title` supports RichText formatting.

---

## 🎨 Themes

| Theme | Accent | Style |
|---|---|---|
| `"Dark"` | Steel Blue `rgb(70,130,180)` | Minimal dark |
| `"Amethyst"` | Purple `rgb(91,68,209)` | Purple-tinted dark |

Set via the `Theme` field in `Library:Window`. The theme re-colors all registered UI elements automatically.

---

## 🧪 Full Example

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/DummYUi/DunmyUi_Source.luau'))()

local Tabs = Library:Window({
    Title  = "Bora Hub",
    Desc   = "v1.0.0",
    Icon   = "star",
    Theme  = "Amethyst",
    Config = {
        Keybind = Enum.KeyCode.RightShift,
    },
    CloseUIButton = { Enabled = true, Text = "Hide" }
})

Tabs:SelectTab(1)

local MainTab = Tabs:Tab({ Title = "Main", Icon = "house" })

MainTab:Section({ Title = "Auto Farm" })

local farmToggle = MainTab:Toggle({
    Title    = "Auto Farm",
    Value    = false,
    Callback = function(v)
        print("Farming:", v)
    end
})

local speedSlider = MainTab:Slider({
    Title    = "Walk Speed",
    Min      = 16,
    Max      = 500,
    Value    = 16,
    Rounding = 0,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

local modeDropdown = MainTab:Dropdown({
    Title    = "Mode",
    List     = {"Fast", "Safe", "AFK"},
    Value    = "Safe",
    Callback = function(v)
        print("Mode:", v)
    end
})

MainTab:Button({
    Title    = "Collect All",
    Callback = function()
        Tabs:Notify({ Title = "Done!", Desc = "All items collected.", Time = 3 })
    end
})

Tabs:Line()

local SettingsTab = Tabs:Tab({ Title = "Settings", Icon = "settings" })

SettingsTab:Section({ Title = "Visuals" })

SettingsTab:ColorPicker({
    Title    = "ESP Color",
    Value    = Color3.fromRGB(255, 0, 0),
    Callback = function(c)
        print("Color:", c)
    end
})

SettingsTab:Keybind({
    Title    = "Toggle UI",
    Key      = Enum.KeyCode.RightShift,
    Value    = false,
    Callback = function(key, active)
        print("Key:", key, "Active:", active)
    end
})
```

---

## ⚠️ Notes

- The library parents to `gethui()` → `CoreGui` → `PlayerGui` in priority order.
- GUI is protected with `protectgui` / `syn.protect_gui` automatically if available.
- Icons are loaded from a spritesheet via HttpGet — if icons appear blank, your executor may not support HTTP.
- `ScreenGui:Destroy()` (triggered by the Close button dialog) fully cleans up all UI.
