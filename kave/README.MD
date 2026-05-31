# Kavo UI Library

A lightweight Roblox UI library for building executor/script GUIs with tabs, sections, and interactive elements.

---

## Loading the Library

```lua
local Library = loadstring(game:HttpGet(
  "https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/kave/kav.luau"))()
```

---

## Basic Structure

Every script follows this hierarchy:

```
Library → CreateLib → NewTab → NewSection → Elements
```

```lua
local Window = Library.CreateLib("My Script", "Midnight")
local Tab    = Window:NewTab("Main")
local Section = Tab:NewSection("Features")

Section:NewButton("Click Me", "This is a button", function()
    print("Clicked!")
end)
```

---

## Themes

Pass a theme name as the second argument to `CreateLib`:

| Name         | Description                        |
|--------------|------------------------------------|
| `DarkTheme`  | Black background, grey accent      |
| `LightTheme` | White background, light grey       |
| `BloodTheme` | Black background, red accent       |
| `GrapeTheme` | Purple tones                       |
| `Ocean`      | Deep blue, indigo accent           |
| `Midnight`   | Dark teal theme                    |
| `Sentinel`   | Dark with red/green contrast       |
| `Synapse`    | Very dark, brown text              |
| `Serpent`    | Dark green accent                  |

**Custom theme:**
```lua
local Window = Library.CreateLib("My Script", {
    SchemeColor = Color3.fromRGB(100, 200, 255),
    Background  = Color3.fromRGB(20, 20, 30),
    Header      = Color3.fromRGB(10, 10, 20),
    TextColor   = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(30, 30, 45)
})
```

---

## CreateLib

```lua
local Window = Library.CreateLib(title, theme)
```

| Parameter | Type            | Description                        |
|-----------|-----------------|------------------------------------|
| `title`   | string          | Title shown in the header          |
| `theme`   | string or table | Theme name or custom color table   |

---

## NewTab

```lua
local Tab = Window:NewTab("Tab Name")
```

Creates a clickable tab button on the left sidebar. The first tab created is selected by default.

---

## NewSection

```lua
local Section = Tab:NewSection("Section Name")
-- Hidden header variant:
local Section = Tab:NewSection("Section Name", true)
```

Passing `true` as the second argument hides the section header bar (useful for clean layouts).

---

## Elements

All elements are created from a `Section` object.

---

### Button

```lua
Section:NewButton(name, tooltip, callback)
```

| Parameter  | Type     | Description                            |
|------------|----------|----------------------------------------|
| `name`     | string   | Label shown on the button              |
| `tooltip`  | string   | Info shown when the ℹ️ icon is clicked  |
| `callback` | function | Fires when the button is clicked       |

**Example:**
```lua
local Btn = Section:NewButton("Kill Aura", "Enables Kill Aura", function()
    print("Kill Aura activated")
end)

-- Update the button label later:
Btn:UpdateButton("New Label")
```

---

### Toggle

```lua
Section:NewToggle(name, tooltip, callback)
```

| Parameter  | Type     | Description                              |
|------------|----------|------------------------------------------|
| `name`     | string   | Label shown next to the toggle           |
| `tooltip`  | string   | Info shown when the ℹ️ icon is clicked    |
| `callback` | function | Fires with `true`/`false` on each flip   |

**Example:**
```lua
local Tog = Section:NewToggle("Auto Farm", "Automatically farms", function(state)
    print("Auto Farm:", state)
end)

-- Force-set the toggle:
Tog:UpdateToggle("New Name", true)   -- turn on
Tog:UpdateToggle(nil, false)         -- turn off (keep same name)
```

---

### Slider

```lua
Section:NewSlider(name, tooltip, maxValue, minValue, callback)
```

| Parameter  | Type     | Description                           |
|------------|----------|---------------------------------------|
| `name`     | string   | Label shown on the slider             |
| `tooltip`  | string   | Info shown when the ℹ️ icon is clicked |
| `maxValue` | number   | Maximum slider value                  |
| `minValue` | number   | Minimum slider value                  |
| `callback` | function | Fires with the current value          |

**Example:**
```lua
Section:NewSlider("Walk Speed", "Sets walk speed", 200, 16, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)
```

---

### TextBox

```lua
Section:NewTextBox(name, tooltip, callback)
```

| Parameter  | Type     | Description                              |
|------------|----------|------------------------------------------|
| `name`     | string   | Label shown next to the textbox          |
| `tooltip`  | string   | Info shown when the ℹ️ icon is clicked    |
| `callback` | function | Fires with the typed text on Enter press |

**Example:**
```lua
Section:NewTextBox("Player Name", "Enter a player name", function(text)
    print("Entered:", text)
end)
```

---

### Dropdown

```lua
Section:NewDropdown(name, tooltip, list, callback)
```

| Parameter  | Type     | Description                             |
|------------|----------|-----------------------------------------|
| `name`     | string   | Label shown on the dropdown             |
| `tooltip`  | string   | Info shown when the ℹ️ icon is clicked   |
| `list`     | table    | Array of option strings                 |
| `callback` | function | Fires with the selected option string   |

**Example:**
```lua
local Drop = Section:NewDropdown("Game Mode", "Select a mode",
    {"Easy", "Medium", "Hard"},
    function(selected)
        print("Chose:", selected)
    end
)

-- Refresh the options list later:
Drop:Refresh({"Option A", "Option B"})
```

---

### Keybind

```lua
Section:NewKeybind(name, tooltip, defaultKey, callback)
```

| Parameter    | Type        | Description                                    |
|--------------|-------------|------------------------------------------------|
| `name`       | string      | Label shown on the keybind element             |
| `tooltip`    | string      | Info shown when the ℹ️ icon is clicked          |
| `defaultKey` | Enum.KeyCode | The default key (e.g. `Enum.KeyCode.F`)       |
| `callback`   | function    | Fires every time the bound key is pressed      |

**Example:**
```lua
Section:NewKeybind("Toggle Menu", "Press to toggle", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)
```

---

### Color Picker

```lua
Section:NewColorPicker(name, tooltip, defaultColor, callback)
```

| Parameter      | Type          | Description                              |
|----------------|---------------|------------------------------------------|
| `name`         | string        | Label shown on the color picker          |
| `tooltip`      | string        | Info shown when the ℹ️ icon is clicked    |
| `defaultColor` | Color3        | Starting color                           |
| `callback`     | function      | Fires with the selected `Color3`         |

Includes a **Rainbow** toggle that cycles through hues automatically.

**Example:**
```lua
Section:NewColorPicker("ESP Color", "Color for ESP boxes",
    Color3.fromRGB(255, 0, 0),
    function(color)
        print("Color changed:", color)
    end
)
```

---

### Label

```lua
Section:NewLabel("Some text here")
```

A static text banner styled with the theme's `SchemeColor`. Supports RichText.

**Example:**
```lua
local Lbl = Section:NewLabel("Status: Idle")

-- Update later:
Lbl:UpdateLabel("Status: Running")
```

---

## Other Methods

### Toggle UI Visibility

```lua
Library:ToggleUI()
```

Shows or hides the entire GUI window.

### Change Theme Colors at Runtime

```lua
Library:ChangeColor("SchemeColor", Color3.fromRGB(255, 100, 0))
Library:ChangeColor("Background",  Color3.fromRGB(20, 20, 20))
Library:ChangeColor("Header",      Color3.fromRGB(10, 10, 10))
Library:ChangeColor("TextColor",   Color3.fromRGB(255, 255, 255))
Library:ChangeColor("ElementColor",Color3.fromRGB(30, 30, 30))
```

---

## Full Example Script

```lua
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
```
