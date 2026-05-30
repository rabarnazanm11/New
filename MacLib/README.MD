# MacLib

A clean, feature-rich Roblox UI library for building executor GUIs.

---

## Table of Contents

- [Loadstring](#loadstring)
- [Window](#window)
- [Notifications](#notifications)
- [Tabs](#tabs)
- [Sections](#sections)
- [Elements](#elements)
  - [Button](#button)
  - [Input](#input)
  - [Slider](#slider)
  - [Toggle](#toggle)
  - [Spacer](#spacer)
  - [Divider](#divider)
  - [SubLabel](#sublabel)
  - [Label](#label)
  - [Paragraph](#paragraph)
  - [Header](#header)

---

## Loadstring

```luau
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
```

---

## Window

Creates the main GUI window.

```luau
local Window = MacLib:Window({
    Title = "Kuzu Hub",
    Subtitle = "Paid | V3.12",
    Size = UDim2.fromOffset(868, 650),
    DragStyle = 1,                    -- 1: Drag handle icon (PC). 2: Drag entire UI (Mobile).
    DisabledWindowControls = {},      -- Pass "Exit" or "Minimize" to disable those controls.
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = false,              -- Note: can be detected by some anti-cheats.
})
```

---

## Notifications

### Create a Notification

```luau
local Notif = Window:Notify({
    Title = "Kuzu Hub",
    Description = "Hello, World!",
    Lifetime = 5,
    -- Optional:
    -- Scale       = <number>
    -- SizeX       = <number>
    -- Style       = "None" | "Confirm" | "Cancel"
    --               "None"    → no interactive button
    --               "Confirm" → checkmark button
    --               "Cancel"  → crossmark button
    -- Callback    = function() end
})
```

### Notification Functions

| Function | Description |
|---|---|
| `:UpdateTitle(<string>)` | Updates the notification title |
| `:UpdateDescription(<string>)` | Updates the notification description |
| `:Resize(<number>)` | Resizes the width (height auto-adjusts to content) |
| `:Cancel()` | Dismisses the notification |

---

## Tabs

Tabs are created from a `TabGroup`, which is attached to the Window.

```luau
local TabGroup = Window:TabGroup()

local Tab = TabGroup:Tab({
    Name  = "Main",          -- <string>
    Image = "rbxassetid://18287", -- <string> — max 16×16 px
})
```

---

## Sections

Sections live inside Tabs and hold all UI elements. Each tab can have a left and right column.

```luau
local Section = Tab:Section({
    Side = "Left", -- "Left" | "Right"
})
```

---

## Elements

### Button

```luau
local Btn = Section:Button({
    Name = "Click Me",
    Callback = function()
        print("Button clicked.")
    end,
})
```

**Button Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the button label |
| `:SetVisiblity(<boolean>)` | Shows or hides the button |

---

### Input

```luau
local Inp = Section:Input({
    Name = "Target",
    Placeholder = "Username",
    AcceptedCharacters = "All", -- "All" | "Numeric" | "Alphabetic" | "AlphaNumeric"
    Callback = function(input)  -- Also accepts `onChanged`. Called on every text change.
        print("Target set: " .. input)
    end,
}, "TargetInput") -- Optional flag (string | nil)
```

**Input Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the input label |
| `:SetVisiblity(<boolean>)` | Shows or hides the input |
| `:GetInput()` → `string` | Returns the current input value |
| `:UpdatePlaceholder(<string>)` | Updates the placeholder text |
| `:UpdateText(<string>)` | Sets the input text programmatically |

---

### Slider

```luau
local Sld = Section:Slider({
    Name    = "WalkSpeed",
    Default = 16,
    Minimum = 0,
    Maximum = 100,
    DisplayMethod = "Value",   -- "Round" | "Degrees" | "Percent" | "Value"
    Precision     = 1,         -- <number> — decimal places
    Callback = function(value) -- Returns number
        local humanoid = game.Players.LocalPlayer.Character
            and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end,
}, "WalkSpeedSlider") -- Optional flag (string | nil)
```

**Slider Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the slider label |
| `:SetVisiblity(<boolean>)` | Shows or hides the slider |
| `:UpdateValue(<number>)` | Sets the slider value programmatically |
| `:GetValue()` → `number` | Returns the current slider value |

---

### Toggle

```luau
local Tog = Section:Toggle({
    Name    = "Flight",
    Default = false,
    Callback = function(value)
        Window:Notify({
            Title = "Kuzu Hub",
            Description = (value and "Enabled " or "Disabled ") .. "Flight",
        })
    end,
}, "FlightToggle") -- Optional flag (string | nil)
```

**Toggle Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the toggle label |
| `:SetVisiblity(<boolean>)` | Shows or hides the toggle |
| `:UpdateState(<boolean>)` | Sets the toggle state programmatically |
| `:GetState()` → `boolean` | Returns the current toggle state |

---

### Spacer

Adds an empty vertical gap between elements.

```luau
local Spc = Section:Spacer()
```

**Spacer Functions**

| Function | Description |
|---|---|
| `:Remove()` | Removes the spacer |
| `:SetVisiblity(<boolean>)` | Shows or hides the spacer |

---

### Divider

Adds a horizontal rule to visually separate elements.

```luau
local Div = Section:Divider()
```

**Divider Functions**

| Function | Description |
|---|---|
| `:Remove()` | Removes the divider |
| `:SetVisiblity(<boolean>)` | Shows or hides the divider |

---

### SubLabel

A small secondary text label, typically used for hints or descriptions.

```luau
local Sub = Section:SubLabel({
    Text = "Some hint text",   -- <string>
}, "Flag") -- Optional flag (string | nil)
```

---

### Label

A standard text label.

```luau
local Lbl = Section:Label({
    Text = "Some label",   -- <string>
}, "Flag") -- Optional flag (string | nil)
```

**Label Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the label text |
| `:SetVisiblity(<boolean>)` | Shows or hides the label |

---

### Paragraph

A block of text with a bold header and a body for longer descriptions.

```luau
local Par = Section:Paragraph({
    Header = "About",          -- <string>
    Body   = "This is a long description of something.", -- <string>
}, "Flag") -- Optional flag (string | nil)
```

**Paragraph Functions**

| Function | Description |
|---|---|
| `:SetVisiblity(<boolean>)` | Shows or hides the paragraph |
| `:UpdateHeader(<string>)` | Updates the header text |
| `:UpdateBody(<string>)` | Updates the body text |

---

### Header

A bold section heading, larger than a label.

```luau
local Hdr = Section:Header({
    Text = "Settings",   -- <string>
}, "Flag") -- Optional flag (string | nil)
```

**Header Functions**

| Function | Description |
|---|---|
| `:UpdateName(<string>)` | Updates the header text |
| `:SetVisiblity(<boolean>)` | Shows or hides the header |
