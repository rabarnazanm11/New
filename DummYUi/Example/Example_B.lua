local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/rabarnazanm11/New/refs/heads/main/DummYUi/DunmyUi_Source.luau'))()
local Tabs = Library:Window({
    Title   = "My Hub",              -- Header title
    Desc    = "v1.0.0",              -- Subtitle under title (optional)
    Icon    = "door-open",           -- Icon name from icon list, or rbxassetid:// string
    Theme   = "Dark",            -- "Dark" or "Amethyst"
    Config  = {
        Keybind = Enum.KeyCode.RightShift,          -- Key to toggle UI visibility
        Size    = UDim2.new(0, 530, 0, 400),        -- Window size (optional)
    },
    CloseUIButton = {
        Enabled = true,              -- Show a floating close button
        Text    = "Close",           -- Label on the floating button
    }
})
Tabs:SelectTab(1)   -- Open the 1st tab by default (call before creating tabs)
local MainTab = Tabs:Tab({
    Title = "Main",       -- Tab label
    Icon  = "house",      -- Icon name or rbxassetid:// string (default: "house")
})

Tabs:Line()   -- Adds a thin divider in the tab sidebar
local MySection = MainTab:Section({
    Title = "Auto Farm"
})


local MyToggle = MainTab:Toggle({
    Title    = "Auto Farm",
    Desc     = "Farms automatically",   -- optional
    Image    = "",                       -- optional
    Value    = false,                    -- starting state
    Callback = function(value)           -- value is boolean
        print("Toggle:", value)
    end
})

MainTab:Button({
    Title    = "Teleport",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        print("🤔😂👀👀👀😂")
        error("🤔😂👀👀👀😂")
        print("🤔😂👀👀👀😂")
        
    end
})

local MySlider = MainTab:Slider({
    Title    = "Walk Speed",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Min      = 0,               -- minimum value (default: 0)
    Max      = 100,             -- maximum value (default: 100)
    Value    = 16,              -- starting value (default: Min + 1)
    Rounding = 2,               -- decimal places to round to (default: 2)
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})


-------------------------------------------------------
 --                 Dropdown Section                 --
-------------------------------------------------------
local ootions = {
  "Mode A ",
  "Mode B ",
  "Mode C ",
}


local MyDropdown = MainTab:Dropdown({
    Title    = "Select Mode",
    Desc     = "hiii",                           -- optional
    Image    = "house",                           -- optional
    List     = ootions,
    Value    =  "mode a",                     -- default selected (or nil)
    Multi    = false,                        -- true = multi-select mode
    Callback = function(selected)
        -- single mode:  selected is a string
        -- multi mode:   selected is a table of strings
        print(selected)
    end
})

MainTab:Button({
    Title    = "Dropdown Clear ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown:Clear()
        Tabs:Notify({
    Title = "Cleared !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
MainTab:Button({
    Title    = "Dropdown SetValue ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown:SetValue(nil) 
      Tabs:Notify({
    Title = "Set !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
MainTab:Button({
    Title    = "Dropdown Add ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown:Add("Mode A , B , C ","B")
        Tabs:Notify({
    Title = "Added !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
-------------------------------------------------------
local MyCode = MainTab:Code({
    Title = "Auto Farm Script",
    Code  = 'print("Hello World")',   -- Lua code string to display
})
local MyLabel = MainTab:Label({
    Title = "Version 1.0.0",
    Desc  = "Made by Bora",   -- optional subtitle
    Image = "zap",                -- optional
})
local MyTextbox = MainTab:Textbox({
    Title            = "Input Text",
    Desc             = "Type something here",   -- optional
    Image            = "",                       -- optional
    Placeholder      = "Enter value...",
    Value            = "",                       -- starting text
    ClearTextOnFocus = false,
    Callback         = function(text)            -- fires on FocusLost
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
        print("Input:", text)
    end
})
-------------------------------------------------------
 --                 Settings TabSection                 --
-------------------------------------------------------

local Settings = Tabs:Tab({
    Title = "Settings ",       -- Tab label
    Icon  = "house",      -- Icon name or rbxassetid:// string (default: "house")
})
local MySectio1n = Settings:Section({
    Title = "Auto Farm"
})


local MyTog2gle = Settings:Toggle({
    Title    = "Auto Farm",
    Desc     = "Farms automatically",   -- optional
    Image    = "",                       -- optional
    Value    = false,                    -- starting state
    Callback = function(value)           -- value is boolean
        print("Toggle:", value)
    end
})

Settings:Button({
    Title    = "Teleport",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        print("🤔😂👀👀👀😂")
        error("🤔😂👀👀👀😂")
        print("🤔😂👀👀👀😂")
        
    end
})

local MySlide3r = Settings:Slider({
    Title    = "Walk Speed",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Min      = 0,               -- minimum value (default: 0)
    Max      = 100,             -- maximum value (default: 100)
    Value    = 16,              -- starting value (default: Min + 1)
    Rounding = 2,               -- decimal places to round to (default: 2)
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})


-------------------------------------------------------
 --                 Dropdown Section                 --
-------------------------------------------------------
local ootions4 = {
  "Mode A ",
  "Mode B ",
  "Mode C ",
}

local MyDropdown4 = Settings:Dropdown({
    Title    = "Select Mode",
    Desc     = "hiii",                           -- optional
    Image    = "house",                           -- optional
    List     = ootions4,
    Value    =  "mode b ",                     -- default selected (or nil)
    Multi    = false,                        -- true = multi-select mode
    Callback = function(selected)
        -- single mode:  selected is a string
        -- multi mode:   selected is a table of strings
        print(selected)
    end
})

Settings:Button({
    Title    = "Dropdown Clear ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown4:Clear()
        Tabs:Notify({
    Title = "Cleared !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
Settings:Button({
    Title    = "Dropdown SetValue ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown4:SetValue("") 
      Tabs:Notify({
    Title = "Set !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
Settings:Button({
    Title    = "Dropdown Add ",
    Desc     = "",              -- optional
    Image    = "",              -- optional
    Callback = function()
        MyDropdown4:Add("hsh ","usisj")
        Tabs:Notify({
    Title = "Added !",
    Desc  = " successfully.",
    Time  = 5    -- seconds before auto-dismiss
})
    end
})
-------------------------------------------------------
local MyCod3e = Settings:Code({
    Title = "Auto Farm Script",
    Code  = 'print("Hello World")',   -- Lua code string to display
})
local MyLa3bel = Settings:Label({
    Title = "Version 1.0.0",
    Desc  = "Made by Bora",   -- optional subtitle
    Image = "zap",                -- optional
})
local MyText3box = Settings:Textbox({
    Title            = "Input Text",
    Desc             = "Type something here",   -- optional
    Image            = "",                       -- optional
    Placeholder      = "Enter value...",
    Value            = "",                       -- starting text
    ClearTextOnFocus = false,
    Callback         = function(text)            -- fires on FocusLost
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
        print("Input:", text)
    end
})




Tabs:Notify({
    Title = "Loaded!",
    Desc  = "Hub injected successfully.",
    Time  = 5    -- seconds before auto-dismiss
})



