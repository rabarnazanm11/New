# 🌸 Dummy Kawaii UI Library

A feature-rich Roblox exploit UI library with theme support, smooth animations, and a clean component system.

---

## 📦 Loading the Library

Paste this at the top of your script to load the library:

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Dummyrme/Library/refs/heads/main/Source.lua'))()
```

> The library auto-loads its icon spritesheet from the same GitHub repo. Make sure HTTP requests are enabled in your executor.

---

## 🪟 Creating a Window

```lua
local Tabs = Library:MakeWindow({
    Name = "My Hub",              -- Title shown in the header
    Theme = "Amethyst",           -- Starting theme: "Dark" or "Amethyst"
    Keybind = Enum.KeyCode.RightShift, -- Key to toggle UI visibility
    CloseUIButton = {
        Enabled = true,
        Text = "Close"
    }
})
```

`MakeWindow` returns a `Tabs` object used to create tabs, send notifications, and open dialogs.

---

## 📑 Creating Tabs

```lua
local MainTab = Tabs:MakeTab({
    Name = "Main",
    Icon = "home"   -- Icon name from the icon list, or an rbxassetid:// string
})
```

---

## 📋 Creating Sections

Sections group your elements inside a tab.

```lua
local MainSection = MainTab:MakeSection({
    Name = "Auto Farm"
})
```

---

## 🧩 Elements

### ✅ Toggle

```lua
MainSection:MakeToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(value)
        print("Toggle is now:", value)
    end
})
```

---

### 🎚️ Slider

```lua
MainSection:MakeSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
```

---

### 📋 Dropdown

```lua
MainSection:MakeDropdown({
    Name = "Select Mode",
    Options = {"Mode A", "Mode B", "Mode C"},
    Default = "Mode A",
    Callback = function(selected)
        print("Selected:", selected)
    end
})
```

---

### 🔘 Button

```lua
MainSection:MakeButton({
    Name = "Teleport to Spawn",
    Callback = function()
        -- your code here
    end
})
```

---

### ⌨️ Textbox

```lua
MainSection:MakeTextbox({
    Name = "Player Name",
    Placeholder = "Enter name...",
    Callback = function(text)
        print("Input:", text)
    end
})
```

---

### 🔑 Keybind

```lua
MainSection:MakeKeybind({
    Name = "Spam Key",
    Default = Enum.KeyCode.E,
    Toggle = false,       -- if true, acts as a toggle keybind
    Callback = function(key)
        print("Key set to:", key)
    end
})
```

---

### 🎨 Color Picker

```lua
MainSection:MakeColorPicker({
    Name = "ESP Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print("Color changed:", color)
    end
})
```

---

### 🏷️ Label

```lua
MainSection:MakeLabel({
    Name = "Version: 1.0.0"
})
```

---

## 🔔 Notifications

Send a notification popup to the user:

```lua
Tabs:Notify({
    Title = "Loaded!",
    Desc = "Hub has been injected successfully.",
    Time = 5   -- seconds before auto-dismiss
})
```

---

## 💬 Dialog

Show a confirmation dialog with two buttons:

```lua
Tabs:Dialog({
    Title = "Are you sure?",
    Button1 = {
        Title = "Confirm",
        Color = Color3.fromRGB(0, 188, 0),
        Callback = function()
            print("Confirmed!")
        end
    },
    Button2 = {
        Title = "Cancel",
        Color = Color3.fromRGB(226, 39, 6),
        -- No Callback = just closes the dialog
    }
})
```

---

## 🎨 Themes

The library comes with two built-in themes:

| Theme | Accent Color | Description |
|---|---|---|
| `Dark` | Steel Blue | Minimal dark UI |
| `Amethyst` | Purple `#5B44D1` | Purple-tinted dark UI |

The theme is set when creating the window via the `Theme` field. Switching themes live re-colors all registered UI elements automatically via `Library:setTheme()`.

---

## 🧪 Full Example Script

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Dummyrme/Library/refs/heads/main/Source.lua'))()

local Tabs = Library:MakeWindow({
    Name = "Bora Hub",
    Theme = "Amethyst",
    Keybind = Enum.KeyCode.RightShift,
    CloseUIButton = { Enabled = true, Text = "Hide" }
})

local MainTab = Tabs:MakeTab({ Name = "Main", Icon = "star" })
local FarmSection = MainTab:MakeSection({ Name = "Auto Farm" })

local farming = false

FarmSection:MakeToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(v)
        farming = v
    end
})

FarmSection:MakeSlider({
    Name = "Farm Speed",
    Min = 1,
    Max = 100,
    Default = 50,
    Callback = function(v)
        print("Speed:", v)
    end
})

FarmSection:MakeButton({
    Name = "Collect All",
    Callback = function()
        Tabs:Notify({ Title = "Done!", Desc = "All items collected.", Time = 3 })
    end
})
```

---

## ⚠️ Notes

- The library uses `game:GetService("CoreGui")` as the parent outside Studio and `PlayerGui` inside Studio — no extra setup needed.
- Icons are loaded from a spritesheet via `HttpGet`. If icons don't appear, check that your executor allows HTTP requests.
- Using `ScreenGui:Destroy()` (via the Close button) fully cleans up the UI.
