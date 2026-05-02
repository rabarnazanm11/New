Window:Divider()
local colorz = {

  
["DarkBlue"] = Color3.fromRGB(23,33,152),
["Cyan"] = Color3.fromRGB(68,229,246),
["Red"] = Color3.fromRGB(246,68,68),
["Purple ish"] = Color3.fromRGB(138,68,246),
["Green"] = Color3.fromRGB(31,212,25),
["Gray"] = Color3.fromRGB(112,112,112),
["Black ish"] = Color3.fromRGB(23,23,23),
}
--[[
colorz["DarkBlue"]
colorz["Cyan"]
colorz["Red"]
colorz["Purple ish"]
colorz["Green"]
colorz["Gray"]
colorz["Black ish"]
]]
  --                                                                  or "rbxassetid://"                    "Square" or "Circle"                                                                    Left , Center , Right
local SettingsTab = Window:Tab({Title = "Settings",Desc = "Change Themes",Icon = "bolt",IconThemed = false,Locked = false,ShowTabTitle = true,Border = true,TabTitleAlign = "Left",CustomEmptyPage = {Title = "This is a cool empty tab",Desc = "I like it. its so great tab with cool 'custom empty page'",Icon = "lucide:smile",},})

local Themes_Dropdown = SettingsTab:Dropdown({
    Title = "Select Theme ",
    Desc = "Default : Midnight",
    Values = {
        "Dark",
        "Light",
        "Rose",
        "Plant",
        "Red",
        "Indigo",
        "Sky",
        "Violet",
        "Amber",
        "Emerald",
        "Midnight",
        "Crimson",
        "MonokaiPro",
        "CottonCandy",
        "Mellowsi",
    },
    Value = "Midnight",
    AllowNone = false, 
    SearchBarEnabled = true, 
    Multi = false,
    Locked = false,
    Flag = "Themes_dropdown",
    Callback = function(selected)
      WindUI:SetTheme(selected)
        Notify("Notify","Theme Changed To"..selected,2,"bell-check")
    end
})

local Section_All_Themes = SettingsTab:Section({
    Title = "Available Themes",
    Desc = "You Could Search it Up in the Dropdown ", -- optional
    Icon = "", -- lucide icon or "rbxassetid://". optional
    IconColor = colorz["DarkBlue"], -- custom icon color. optional
    TextSize = 19, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4, -- description transparency. optional
})


Section_All_Themes:Paragraph({
    Title = "All The Themes ",
    Desc ="Dark\nLight\nRose\nPlant\nRed\nIndigo\nSky\nViolet\nAmber\nEmerald\nMidnight\nCrimson\nMonokaiPro\nCottonCandy\nMellowsi",
    Image = "",
    ImageSize = 2,
    Thumbnail = "rbxassetid://16360998387",
    ThumbnailSize = 250,
    Color = colorz["Black ish"],
    
})

 SettingsTab:Slider({
    Title = "Background Transparency ",
    Desc = "0 - Clear\n 1 - Transparent ", -- optional
    Value = {
        Min = 0, -- minimum value
        Max = 1, -- maximum value
        Default = 0-- initial value
    },
    Step = 0.1, -- increment step (use 0.1 for floats). optional
    Width = 100, 
    Locked = false, -- disable slider. optional
    Flag = "Background_Transpercay", -- for config saving. optional
    Callback = function(value)
      Window:SetBackgroundTransparency(value)
    end
})

SettingsTab:Button({
    Title = "Destroy Window",
    Callback = function()
        Window:Destroy()
    end
})
SettingsTab:Button({
    Title = "Move Window To Center ",
    Callback = function()
        Window:SetToTheCenter()
    end
})
