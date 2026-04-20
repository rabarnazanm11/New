# Mentality UI Library

A Roblox exploit UI library by sametexe. This guide covers every element and feature with examples.

---

## Loading the Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/Mentality%20Lib/Src/Source.lua"))()
```

---

## Creating a Window

```lua
local Window = Library:Window({
    Name    = "Window",
    SubName = "sub name",
    Logo    = "120959262762131"
})
```

| Option    | Type   | Description                      |
|-----------|--------|----------------------------------|
| `Name`    | string | Title shown at the top           |
| `SubName` | string | Subtitle / version text          |
| `Logo`    | string | Roblox asset ID for the logo     |

---

## KeybindList

Creates a panel that lists all registered keybinds.

```lua
local KeybindList = Library:KeybindList("Keybinds")
```

---

## Categories & Pages

Categories are visual separators in the sidebar. Pages are tabs grouped under them.

```lua
Window:Category("Enviroment & Transport")
local CarPage  = Window:Page({ Name = "Car",  Icon = "138827881557940" })
local ESPPage  = Window:Page({ Name = "ESP",  Icon = "100050851789190", Columns = 1 })
local LangPage = Window:Page({ Name = "Lang", Icon = "126497581491926" })

Window:Category("Players & Vision")
local PlayersPage = Window:Page({ Name = "Players", Icon = "134236649319095" })
local RadarPage   = Window:Page({ Name = "Radar",   Icon = "123554105934637" })
local WorldPage   = Window:Page({ Name = "World",   Icon = "123944728972740" })

Window:Category("Utilities & Settings")
local MiscPage     = Window:Page({ Name = "Misc",     Icon = "103180437044643" })
local ExploitsPage = Window:Page({ Name = "Exploits", Icon = "108839695397679" })

-- Built-in settings page
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList)
```

| Option    | Type   | Description                              |
|-----------|--------|------------------------------------------|
| `Name`    | string | Tab label                                |
| `Icon`    | string | Roblox asset ID for the tab icon         |
| `Columns` | number | Number of columns (default `2`)          |

---

## Sections

Sections divide a page into groups. Use `Side` to place them in a specific column.

```lua
local Section = CarPage:Section({
    Name        = "Automobiles",
    Description = "Exploits for automobiles",
    Icon        = "123944728972740",
    Side        = 1   -- 1 = left, 2 = right
})
```

---

## Toggle

```lua
local Toggle = Section:Toggle({
    Name     = "Speed",
    Flag     = "Speed",
    Default  = false,
    Callback = function(Value)
        print(Value) -- true / false
    end
})
```

### Toggle Settings Panel

A sub-panel nested under a toggle for related controls.

```lua
local ToggleSettings = Toggle:Settings(300) -- height in pixels

ToggleSettings:Slider({ ... })
ToggleSettings:Label("text"):Colorpicker({ ... })
```

---

## Slider

```lua
Section:Slider({
    Name     = "Speed",
    Flag     = "Speed",
    Min      = 1,
    Max      = 100,
    Default  = 0,
    Decimals = 1,       -- decimal places (0 = integer)
    Suffix   = "km/h",  -- unit label after the value
    Callback = function(Value)
        print(Value)
    end
})
```

---

## Dropdown

```lua
Section:Dropdown({
    Name     = "Dropdown",
    Flag     = "Dropdown",
    Default  = {"First"},
    Items    = {"First", "Second", "Third", "Fourth"},
    Multi    = true,    -- true = multi-select, false = single-select
    Callback = function(Value)
        print(Value)
    end
})
```

---

## Label

```lua
-- Plain label
Section:Label("this a label boi")

-- Label with a color picker chained onto it
Section:Label("Color label"):Colorpicker({
    Name     = "Color",
    Flag     = "Color",
    Default  = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print(Value) -- Color3
    end
})
```

---

## Keybind

```lua
Section:Keybind({
    Name     = "Toggle Key",
    Flag     = "Keybind",
    Default  = Enum.KeyCode.X,
    Callback = function(Value)
        print(Value) -- KeyCode
    end
})
```

---

## Textbox

```lua
Section:Textbox({
    Flag        = "Text",
    Default     = "Text",
    Numeric     = false,  -- true = numbers only
    Placeholder = "...",
    Finished    = true,   -- true = fires on Enter, false = fires every keystroke
    Callback    = function(Value)
        print(Value)
    end
})
```

---

## Listbox

A scrollable list with support for dynamic item adding.

```lua
local Listbox = Section:Listbox({
    Flag     = "Listbox",
    Default  = "First",
    Size     = 275,     -- height in pixels
    Items    = {"First", "Second", "Third"},
    Multi    = false,   -- true = multi-select
    Callback = function(Value)
        print(Value)
    end
})

-- Add items dynamically at runtime
for i = 1, 50 do
    Listbox:Add(i)
end
```

---

## Global Chat

```lua
local GlobalChat = ESPPage:GlobalChat(1)

GlobalChat:OnMessageSendPressed(function()
    GlobalChat:SendMessage(
        "rbxassetid://78993485446406", -- avatar asset ID
        "spongebob",                   -- display name
        GlobalChat:GetTypedMessage(),  -- user's typed message
        true                           -- online status
    )
end)
```

---

## Notifications

```lua
Library:Notification({
    Title       = "Notification title",
    Description = "Notification description",
    Duration    = 5,                -- seconds before it disappears
    Icon        = "73789337996373",

    -- Optional gradient icon color:
    -- IconColor = {
    --     Start = Color3.fromRGB(255, 255, 255),
    --     End   = Color3.fromRGB(0, 0, 0)
    -- }
})
```

---

## Reading Flags

Every element with a `Flag` can be read at any time via `Library.Flags`.

```lua
print(Library.Flags["Speed"])    -- number
print(Library.Flags["AutoFarm"]) -- true / false
```

> Flag names must be unique across your entire script.

---

## Initializing

Always call `Window:Init()` **at the very end** of your script after all pages and elements are defined.

```lua
Window:Init()
```

---

