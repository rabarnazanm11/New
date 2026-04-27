# WindUI — Complete Reference

> Modern open-source UI library for Roblox exploit scripts.  
> **Docs:** https://footagesus.github.io/treehub-web/docs/windui  
> **GitHub:** https://github.com/Footagesus/WindUI

---

## Table of Contents

- [Loading WindUI](#loading-windui)
- [Global Setup](#global-setup)
- [Themes](#themes)
- [Window](#window)
- [Tab](#tab)
- [Section](#section)
- [Elements](#elements)
  - [Button](#button)
  - [Toggle](#toggle)
  - [Slider](#slider)
  - [Input](#input)
  - [Dropdown](#dropdown)
  - [Paragraph](#paragraph)
  - [Keybind](#keybind)
  - [Colorpicker](#colorpicker)
  - [Divider](#divider)
  - [Space](#space)
- [Dialog](#dialog)
- [Notification](#notification)
- [WindUI Global Methods](#windui-global-methods)
- [Common Notes](#common-notes)

---

## Loading WindUI

### Recommended — Pinned Version
```lua
local _version = "1.6.64-fix"
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"
))()
```

### Latest Release
```lua
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()
```

### Unstable (Repo HEAD — may have bugs)
```lua
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()
```

> **Tip:** Use the pinned version for production scripts. New releases sometimes ship with bugs.

---

## Global Setup

Optional calls before creating any Window:

```lua
-- Push notifications lower (avoids Roblox jump button on mobile)
WindUI:SetNotificationLower(true)

-- Set a custom font for the whole library
-- Font IDs: https://create.roblox.com/store/fonts
WindUI:SetFont("rbxassetid://FONT_ID_HERE")

-- Re-parent all UI to a custom Instance
WindUI:SetParent(game.Players.LocalPlayer.PlayerGui)

-- Set display language
WindUI:SetLanguage("en")
```

---

## Themes

### Built-in Themes

| Name | | Name | |
|---|---|---|---|
| `Dark` | `Light` | `Rose` | `Plant` |
| `Red` | `Indigo` | `Sky` | `Violet` |
| `Amber` | `Emerald` | `Midnight` | `Crimson` |
| `Monokai Pro` | `Cotton Candy` | `Mellowsi` | `Rainbow` |

### Using a Built-in Theme
```lua
-- Set via Window config (see Window section)
Theme = "Midnight"

-- Or set after creation
WindUI:SetTheme("Midnight")
```

### Creating a Custom Theme
```lua
WindUI:AddTheme({
    Name       = "MyTheme",
    Accent      = Color3.fromHex("#18181b"),
    Background  = Color3.fromHex("#101010"),
    Outline     = Color3.fromHex("#FFFFFF"),
    Text        = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button      = Color3.fromHex("#52525b"),
    Icon        = Color3.fromHex("#a1a1aa"),
})

WindUI:SetTheme("MyTheme")
```

---

## Window

The root container. Create one per script.

### Minimal Example
```lua
local Window = WindUI:CreateWindow({
    Title  = "My Hub",
    Icon   = "house",
    Author = "by you",
})
```

### Full Example
```lua
local Window = WindUI:CreateWindow({
    Title   = "My Hub",
    Icon    = "house",           -- Lucide icon name, "rbxassetid://ID", or URL
    Author  = "by you",          -- subtitle shown under title

    Folder  = "MyHub",           -- save folder name for configs

    Size    = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),

    Theme     = "Midnight",       -- built-in or custom theme name
    Resizable = true,
    Transparent = true,

    SideBarWidth  = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,

    BackgroundImageTransparency = 0.42,
    Background = "rbxassetid://1234",   -- or a table for gradient

    ShadowTransparency = 0.5,
    Radius         = 8,
    ElementsRadius = 6,

    ToggleKey = Enum.KeyCode.RightShift, -- key to show/hide window
    Acrylic   = false,                   -- blur effect (executor support varies)

    User = {
        Enabled   = true,
        Anonymous = false,          -- hide username
        Callback  = function() end, -- fired when user icon clicked
    },
})
```

### Window Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Window title |
| `Icon` | `string?` | Lucide icon, asset ID, or URL |
| `Author` | `string?` | Subtitle text |
| `Folder` | `string?` | Config save folder |
| `Size` | `UDim2?` | Initial size |
| `MinSize` | `Vector2?` | Minimum resize bounds |
| `MaxSize` | `Vector2?` | Maximum resize bounds |
| `Position` | `UDim2?` | Initial position |
| `Transparent` | `boolean?` | Enable transparency |
| `Theme` | `string?` | Theme name |
| `Resizable` | `boolean?` | Allow user resizing |
| `SideBarWidth` | `number?` | Width of the tab sidebar |
| `HideSearchBar` | `boolean?` | Hide the search bar |
| `ScrollBarEnabled` | `boolean?` | Show scrollbar |
| `BackgroundImageTransparency` | `number?` | `0` = opaque, `1` = invisible |
| `Background` | `string\|table?` | Asset ID or gradient table |
| `ShadowTransparency` | `number?` | Drop shadow transparency |
| `Radius` | `number?` | Window corner radius |
| `ElementsRadius` | `number?` | Element corner radius |
| `ToggleKey` | `Enum.KeyCode?` | Key to open/close window |
| `Acrylic` | `boolean?` | Blur-behind effect |
| `IgnoreAlerts` | `boolean?` | Suppress alert dialogs |
| `HidePanelBackground` | `boolean?` | Hide content panel background |
| `AutoScale` | `boolean?` | Auto-scale on screen resize |
| `User` | `table?` | User icon config |

### Window Methods

```lua
Window:SetTitle("New Title")
Window:SetAuthor("New Author")
Window:SetIcon("star")
Window:SetSize(UDim2.fromOffset(600, 500))
Window:SetTheme("Rose")
Window:SetToggleKey(Enum.KeyCode.Insert)
Window:SetBackgroundImage("rbxassetid://ID")
Window:SetBackgroundImageTransparency(0.5)
Window:SetBackgroundTransparency(0.3)
Window:SetUIScale(1.2)
Window:SetPanelBackground(false)
Window:IsResizable(false)
Window:ToggleTransparency(true)
Window:SetToTheCenter()

Window:Toggle()   -- open if closed, close if open
Window:Open()
Window:Close()
Window:Destroy()
Window:ToggleFullscreen()

Window:SelectTab(Tab)    -- programmatically switch to a tab
Window:LockAll()         -- disable all tab interaction
Window:UnlockAll()

Window:OnOpen(function() print("opened") end)
Window:OnClose(function() print("closed") end)
Window:OnDestroy(function() print("destroyed") end)

Window:Dialog({ ... })   -- see Dialog section
Window:Divider()         -- add a divider in the topbar area

-- Disable specific topbar buttons
Window:DisableTopbarButtons({ "Minimize", "Fullscreen" })

-- Add a custom topbar button
Window:CreateTopbarButton({
    Icon     = "star",
    Callback = function() print("custom button") end,
})
```

---

## Tab

Tabs organize content inside the window's sidebar.

### Basic
```lua
local Tab = Window:Tab({
    Title = "Main",
    Icon  = "home",
})
```

### Full
```lua
local Tab = Window:Tab({
    Title         = "Main",
    Desc          = "Tooltip shown on hover",
    Icon          = "home",
    IconColor     = Color3.fromRGB(100, 200, 255),
    IconShape     = "Circle",    -- "Square" or "Circle"
    IconThemed    = true,        -- use theme accent color
    Locked        = false,       -- disable tab interaction
    ShowTabTitle  = true,        -- show title inside content area
    Border        = true,        -- border around content area
    TabTitleAlign = "Left",      -- "Left" or "Center"

    CustomEmptyPage = {
        Icon  = "lucide:smile",
        Title = "Nothing here yet",
        Desc  = "Add elements to see them here",
    },
})
```

### Tab Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Title` | `string` | `"Tab"` | Tab label |
| `Desc` | `string?` | `nil` | Hover tooltip |
| `Icon` | `string?` | `nil` | Lucide icon or asset ID |
| `IconColor` | `Color3?` | `nil` | Custom icon tint |
| `IconShape` | `string?` | `nil` | `"Square"` or `"Circle"` |
| `IconThemed` | `boolean?` | `false` | Use theme accent color |
| `Locked` | `boolean?` | `false` | Disable interaction |
| `ShowTabTitle` | `boolean?` | `false` | Show title in panel |
| `Border` | `boolean?` | `false` | Border around panel |
| `TabTitleAlign` | `string?` | `"Left"` | Title alignment |
| `CustomEmptyPage` | `table?` | — | Empty-state display |

### Tab Methods

```lua
Tab:Select()               -- switch to this tab
Tab:SetTitle("New")
Tab:SetDesc("New tooltip")
Tab:Lock()
Tab:Unlock()
Tab:ScrollToTheElement(1)  -- scroll to element at index
```

---

## Section

Groups elements under a collapsible header.

```lua
local Section = Tab:Section({
    Title          = "Settings",
    Desc           = "Optional description",
    Icon           = "settings",
    IconColor      = Color3.fromRGB(255, 200, 0),
    Opened         = true,          -- start expanded
    Box            = false,         -- box border around section
    BoxBorder      = false,
    TextSize       = 14,
    TextXAlignment = "Left",        -- "Left" or "Center"
    FontWeight     = Enum.FontWeight.Bold,
})

-- Elements attach to the Section, not the Tab
Section:Button({ Title = "A button inside section" })
Section:Toggle({ Title = "A toggle inside section" })
```

### Section Methods

```lua
Section:SetTitle("New Title")
Section:SetDesc("New description")
Section:Open()
Section:Close()
Section:Destroy()
```

---

## Elements

All elements below can be created on a `Tab` or a `Section` with the same syntax.

---

### Button

Fires a callback when clicked.

```lua
local Button = Tab:Button({
    Title       = "Click Me",
    Desc        = "Optional description",
    Icon        = "play",
    IconAlign   = "Left",           -- "Left" or "Right"
    Color       = Color3.fromRGB(255, 80, 80),
    Justify     = "Left",           -- "Left" or "Center"
    Locked      = false,
    LockedTitle = "Unavailable",
    Flag        = "MyButton",       -- unique ID for configs
    Callback    = function()
        print("clicked")
    end,
})
```

#### Button Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description line |
| `Icon` | `string?` | Lucide icon or asset ID |
| `IconAlign` | `string?` | `"Left"` or `"Right"` |
| `Color` | `Color3?` | Tint color |
| `Justify` | `string?` | `"Left"` or `"Center"` |
| `Locked` | `boolean?` | Disable click |
| `LockedTitle` | `string?` | Tooltip when locked |
| `Flag` | `string?` | Config key |
| `Callback` | `function?` | Called on click |

#### Button Methods

```lua
Button:SetTitle("New Label")
Button:SetDesc("New description")
Button:Lock()
Button:Unlock()
Button:Highlight()
Button:Destroy()
```

---

### Toggle

On/off switch or checkbox.

```lua
local Toggle = Tab:Toggle({
    Title       = "Enable Feature",
    Desc        = "Turns the feature on or off",
    Icon        = "zap",
    Value       = false,          -- initial state
    Type        = "Toggle",       -- "Toggle" or "Checkbox"
    Locked      = false,
    Flag        = "FeatureToggle",
    Callback    = function(state) -- state is boolean
        print("Toggle is now:", state)
    end,
})
```

#### Toggle Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description |
| `Icon` | `string?` | Icon |
| `Value` | `boolean?` | Default value |
| `Type` | `string?` | `"Toggle"` (default) or `"Checkbox"` |
| `Locked` | `boolean?` | Disable interaction |
| `Flag` | `string?` | Config key |
| `Callback` | `function?` | `function(state: boolean)` |

#### Toggle Methods

```lua
Toggle:Set(true)         -- set value programmatically
Toggle:Toggle()          -- flip current state
Toggle:SetTitle("New")
Toggle:SetDesc("New description")
Toggle:Lock()
Toggle:Unlock()
Toggle:Highlight()
Toggle:Destroy()
```

---

### Slider

Numeric range input.

```lua
local Slider = Tab:Slider({
    Title = "Speed",
    Desc  = "Controls walk speed",
    Value = {
        Min     = 0,
        Max     = 100,
        Default = 16,
    },
    Step   = 1,       -- step size; use decimals for floats e.g. 0.1
    Locked = false,
    Flag   = "SpeedSlider",
    Width  = 200,     -- optional custom width in px
    Callback = function(value)
        print("Slider value:", value)
    end,
})
```

#### Slider Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description |
| `Value.Min` | `number` | **Required.** Minimum |
| `Value.Max` | `number` | **Required.** Maximum |
| `Value.Default` | `number` | **Required.** Starting value |
| `Step` | `number?` | Increment step |
| `Locked` | `boolean?` | Disable interaction |
| `Flag` | `string?` | Config key |
| `Width` | `number?` | Custom width in px |
| `Callback` | `function?` | `function(value: number)` |

#### Slider Methods

```lua
Slider:Set(50)
Slider:SetMin(0)
Slider:SetMax(200)
Slider:SetTitle("New Title")
Slider:SetDesc("New description")
Slider:Lock()
Slider:Unlock()
Slider:Highlight()
Slider:Destroy()
```

---

### Input

Text entry field, single-line or textarea.

```lua
local Input = Tab:Input({
    Title            = "Username",
    Desc             = "Enter your username",
    Icon             = "user",
    Type             = "Input",       -- "Input" or "Textarea"
    Placeholder      = "Type here...",
    Value            = "",            -- pre-filled text
    ClearTextOnFocus = false,
    Width            = 150,           -- px (Input type only)
    Locked           = false,
    Flag             = "UsernameInput",
    Callback         = function(text) -- fires on FocusLost
        print("Submitted:", text)
    end,
})
```

#### Input Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description |
| `Icon` | `string?` | Icon inside field |
| `Type` | `string?` | `"Input"` (default) or `"Textarea"` |
| `Placeholder` | `string?` | Hint text |
| `Value` | `string?` | Pre-filled value |
| `Locked` | `boolean?` | Read-only |
| `Flag` | `string?` | Config key |
| `Callback` | `function?` | `function(text: string)` fires on FocusLost |

#### Input Methods

```lua
Input:Set("hello")
Input:SetTitle("New Label")
Input:SetDesc("New description")
Input:Lock()
Input:Unlock()
Input:Highlight()
Input:Destroy()
```

---

### Dropdown

Select from a list. Supports single and multi-select.

```lua
local Dropdown = Tab:Dropdown({
    Title           = "Choose Option",
    Desc            = "Pick one from the list",
    Values          = { "Option A", "Option B", "Option C" },
    Value           = "Option A",     -- default selected value
    Multi           = false,          -- true for multi-select
    AllowNone       = false,          -- allow no selection
    SearchBarEnabled = true,
    MenuWidth       = 180,
    Locked          = false,
    Flag            = "MyDropdown",
    Callback        = function(selected)
        -- single: selected is a string
        -- multi:  selected is a table of strings
        print("Selected:", selected)
    end,
})
```

> **Important:** All values in the `Values` table must be unique. Duplicates will cause issues.

#### Dropdown Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description |
| `Values` | `table` | **Required.** List of string options |
| `Value` | `string?` | Default selection |
| `Multi` | `boolean?` | Enable multi-select |
| `AllowNone` | `boolean?` | Allow empty selection |
| `SearchBarEnabled` | `boolean?` | Show search box |
| `MenuWidth` | `number?` | Dropdown menu width |
| `Locked` | `boolean?` | Disable interaction |
| `Flag` | `string?` | Config key |
| `Callback` | `function?` | `function(selected)` |

#### Dropdown Methods

```lua
Dropdown:Select("Option B")         -- single
Dropdown:Select({"Option A", "Option B"}) -- multi
Dropdown:SetTitle("New Label")
Dropdown:SetDesc("New description")
Dropdown:Lock()
Dropdown:Unlock()
Dropdown:Highlight()
Dropdown:Destroy()
```

---

### Paragraph

Displays static text, images, or thumbnails. Use this instead of `Label` (which does not exist).

```lua
local Para = Tab:Paragraph({
    Title         = "Info",
    Desc          = "This is some information text.",
    Image         = "info",          -- Lucide icon name or asset ID
    ImageSize     = 16,
    Thumbnail     = "rbxassetid://ID", -- optional thumbnail image
    ThumbnailSize = 80,
    Color         = Color3.fromRGB(255, 200, 0), -- accent color
    Locked        = false,
    Buttons       = {
        {
            Title    = "Open Link",
            Icon     = "external-link",
            Variant  = "Secondary",
            Callback = function() end,
        },
    },
})
```

#### Paragraph Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Heading text |
| `Desc` | `string?` | Body text |
| `Image` | `string?` | Icon or asset ID |
| `ImageSize` | `number?` | Icon size in px |
| `Thumbnail` | `string?` | Thumbnail asset ID |
| `ThumbnailSize` | `number?` | Thumbnail size |
| `Color` | `string\|Color3?` | Accent color |
| `Buttons` | `table?` | Action buttons (see below) |
| `Locked` | `boolean?` | Disable interaction |

**Button inside Paragraph:**

| Key | Type | Description |
|---|---|---|
| `Title` | `string` | Button label |
| `Icon` | `string?` | Icon |
| `Variant` | `string?` | `"Primary"`, `"Secondary"`, `"Destructive"` |
| `Callback` | `function` | Click handler |

#### Paragraph Methods

```lua
Para:SetTitle("New Title")
Para:SetDesc("New description")
Para:SetImage("check-circle", 20)
Para:SetThumbnail("rbxassetid://ID", 80)
Para:SetColor(Color3.fromRGB(0, 255, 0))
Para:Destroy()
```

---

### Keybind

Lets users assign a keyboard shortcut.

```lua
local Keybind = Tab:Keybind({
    Title    = "Toggle UI",
    Desc     = "Press to show/hide the window",
    Value    = "V",              -- default key name
    Locked   = false,
    Flag     = "ToggleKey",
    Callback = function(key)
        print("Key pressed:", key)
    end,
})
```

#### Keybind Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Label |
| `Desc` | `string?` | Description |
| `Value` | `string?` | Default key (e.g. `"V"`, `"F5"`) |
| `Locked` | `boolean?` | Disable rebinding |
| `Flag` | `string?` | Config key |
| `Callback` | `function?` | `function(key: string)` |

#### Keybind Methods

```lua
Keybind:Set(Enum.KeyCode.Insert)
Keybind:SetTitle("New Label")
Keybind:Lock()
Keybind:Unlock()
```

---

### Colorpicker

Visual color selection returning `Color3`.

```lua
local Picker = Tab:Colorpicker({
    Title    = "Accent Color",
    Desc     = "Choose your preferred color",
    Default  = Color3.fromRGB(255, 100, 50),
    Locked   = false,
    Flag     = "AccentColor",
    Callback = function(color)
        -- color is Color3
        print("Color:", color)
    end,
})
```

#### Colorpicker Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Title` | `string` | `"Colorpicker"` | Label |
| `Desc` | `string?` | `nil` | Description |
| `Default` | `Color3?` | White | Starting color |
| `Locked` | `boolean?` | `false` | Disable interaction |
| `Flag` | `string?` | `nil` | Config key |
| `Callback` | `function?` | `nil` | `function(color: Color3)` |

#### Colorpicker Methods

```lua
Picker:Set(Color3.fromRGB(0, 255, 0))
Picker:Set(Color3.fromRGB(0, 255, 0), 0.5) -- with transparency
Picker:Lock()
Picker:Unlock()
```

---

### Divider

A horizontal separator line.

```lua
Tab:Divider()
```

---

### Space

Empty vertical spacing.

```lua
Tab:Space()
```

---

## Dialog

Modal confirmation window. Called on `Window`, not `Tab`.

```lua
local Dialog = Window:Dialog({
    Title       = "Confirm Action",
    Icon        = "triangle-alert",
    IconThemed  = true,
    Content     = "Are you sure you want to do this?",
    Buttons     = {
        {
            Title    = "Yes, Continue",
            Icon     = "check",
            Variant  = "Destructive",   -- "Primary", "Secondary", "Destructive"
            Callback = function()
                print("Confirmed")
            end,
        },
        {
            Title    = "Cancel",
            Icon     = "x",
            Variant  = "Secondary",
            Callback = function()
                print("Cancelled")
            end,
        },
    },
})
```

### Dialog Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Dialog heading |
| `Icon` | `string?` | Lucide icon |
| `IconThemed` | `boolean?` | Use theme accent on icon |
| `Content` | `string` | **Required.** Body message |
| `Buttons` | `table` | **Required.** Array of button configs |

### Button Variants

| Variant | Appearance |
|---|---|
| `"Primary"` | Accent-colored confirm button |
| `"Secondary"` | Neutral/grey button |
| `"Destructive"` | Red danger button |

### Dialog Methods

```lua
Dialog:Show()   -- display the dialog
Dialog:Close()  -- hide the dialog
```

---

## Notification

Temporary toast notification. Called on `WindUI`, not `Window`.

```lua
WindUI:Notify({
    Title    = "Success",
    Content  = "Operation completed successfully.",
    Icon     = "check-circle",
    Duration = 3,              -- seconds before auto-dismiss
})
```

### Notification Parameters

| Parameter | Type | Description |
|---|---|---|
| `Title` | `string` | **Required.** Heading |
| `Content` | `string` | **Required.** Message body |
| `Icon` | `string?` | Lucide icon |
| `Duration` | `number?` | Seconds shown (default: 3) |

---

## WindUI Global Methods

All available methods on the `WindUI` object itself:

```lua
WindUI:CreateWindow(config)                  -- create a Window
WindUI:Notify(config)                        -- show a notification
WindUI:Popup(config)                         -- show a popup window
WindUI:AddTheme(theme)                       -- register a custom theme
WindUI:SetTheme("ThemeName")                 -- apply a theme globally
WindUI:GetCurrentTheme()                     -- returns current theme name
WindUI:GetThemes()                           -- returns table of all themes
WindUI:SetFont("rbxassetid://ID")            -- set global font
WindUI:SetParent(Instance)                   -- reparent all UI
WindUI:SetLanguage("en")                     -- set locale
WindUI:Localization(config)                  -- custom localization table
WindUI:SetNotificationLower(true)            -- push notifications lower
WindUI:GetTransparency()                     -- returns current transparency
WindUI:GetWindowSize()                       -- returns UDim2
WindUI:ToggleAcrylic(true)                   -- toggle blur effect
WindUI:Gradient(colors, config)              -- helper to create a gradient
```

---

## Common Notes

**Icons** — All `Icon` fields accept:
- Lucide icon names: `"house"`, `"zap"`, `"triangle-alert"` etc.
- Roblox asset IDs: `"rbxassetid://12345678"`
- Direct URLs

Browse all Lucide icons at: https://lucide.dev/icons/

**Flags** — Setting a `Flag` on an element ties it to the config save system. Use unique string keys per element if you want configs to persist across sessions via the `Folder` setting.

**Sections vs Tabs** — Both `Tab` and `Section` support all the same elements (Button, Toggle, Slider etc.) with identical syntax. Sections just add a collapsible group header on top.

**Dropdown duplicates** — Every entry in a Dropdown's `Values` table must be unique. Passing duplicate strings will cause display bugs.

**Delta executor** — The `continue` keyword is not supported. Use an `if`-guard pattern instead:
```lua
-- Instead of:
for i, v in pairs(t) do
    if bad then continue end
    doSomething()
end

-- Use:
for i, v in pairs(t) do
    if not bad then
        doSomething()
    end
end
```

**Multi-line conditions** — Delta's mobile Lua parser rejects multi-line `and`/`or` chains. Keep all conditions on a single line.
