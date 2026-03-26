# Fluent

## Creating Library

```lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
```

### Accessibility

{% hint style="success" %}
Fluent is accessible from any function
{% endhint %}

```lua
function Init()
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end

function Test()
    print(Fluent.Options)
end

Init()
Test()
```

## Creating Window

```lua
local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
```

### Themes

<table data-column-title-hidden data-view="cards"><thead><tr><th>Themes</th><th data-hidden data-card-cover data-type="files"></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td>Amethyst</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2FdBM3mnKDhW6nGM8arRB3%2Fpreview-amethyst.png?alt=media&#x26;token=3663aea2-6398-4ffa-a96d-4a6c6a4b67be">preview-amethyst.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Amethyst.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Amethyst.lua</a></td></tr><tr><td>Aqua</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2Fa4cq3HnfrwMST6VJXmrD%2Fpreview-aqua.png?alt=media&#x26;token=c851266a-21d8-4e14-a94a-86a2eb40663b">preview-aqua.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Aqua.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Aqua.lua</a></td></tr><tr><td>Rose</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2FtdBbjnWxhLvsRFChge2o%2Fpreview-rose.png?alt=media&#x26;token=b18792bc-d9cf-4b18-a7e8-810295e9ae68">preview-rose.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Rose.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Rose.lua</a></td></tr><tr><td>Light</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2FHR3EqFEUzvFSX2Lm7485%2Fpreview-light.png?alt=media&#x26;token=45e4e1a6-418d-4956-9942-9ca777d17d17">preview-light.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Light.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Light.lua</a></td></tr><tr><td>Dark</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2Fd1gIViyg0a16tblMtit3%2Fpreview-dark.png?alt=media&#x26;token=02032afe-04da-4ff7-904d-2a5e3453bb73">preview-dark.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Dark.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Dark.lua</a></td></tr><tr><td>Darker</td><td><a href="https://1481849050-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FqTYspa6M7hcHjeBMoysI%2Fuploads%2FFDCzLD1agGp7grOBYwD0%2Fpreview-darker.png?alt=media&#x26;token=2fd85197-023b-4484-9a57-c99b98cdc01e">preview-darker.png</a></td><td><a href="https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Darker.lua">https://github.com/dawid-scripts/Fluent/blob/master/src/Themes/Darker.lua</a></td></tr></tbody></table>

### Key Codes

{% embed url="<https://create.roblox.com/docs/reference/engine/enums/KeyCode>" %}
Documentation
{% endembed %}

## Creating Options

```lua
local Options = Fluent.Options
```

{% hint style="info" %}
Options are used by the library to save the elements to access them in the future
{% endhint %}

## Creating Notifications

```lua
Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
})
```

## Creating Dialogs

```lua
Window:Dialog({
    Title = "Title",
    Content = "This is a dialog",
    Buttons = {
        { 
            Title = "Confirm",
            Callback = function()
                print("Confirmed the dialog.")
            end 
        }, {
            Title = "Cancel",
            Callback = function()
                print("Cancelled the dialog.")
            end 
        }
    }
})
```

## Creating Tabs

<pre class="language-lua"><code class="lang-lua">-- Fluent provides Lucide Icons, they are optional
<strong>local Tabs = {
</strong>    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
</code></pre>

### Tab (Settings) With Interface And Configs

```lua
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
```

### Selecting Main Tab

```lua
Window:SelectTab(1)
```

### Icons

{% embed url="<https://lucide.dev/icons/>" %}

## Creating Sections

```lua
local Section = Tab:AddSection("Section Name")
```

{% hint style="info" %}
Section can be used as a parent for any element instead of a tab
{% endhint %}

<pre class="language-lua"><code class="lang-lua">local Section = Tab:AddSection("Section Name")
Section:AddParagraph({
    Title = "Paragraph"
<strong>})
</strong></code></pre>

## Creating Paragraphs

```lua
Tab:AddParagraph({
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})
```

## Creating Buttons

<pre class="language-lua"><code class="lang-lua"><strong>Tab:AddButton({
</strong>    Title = "Button",
    Description = "Very important button",
    Callback = function()
        print("Hello, world!")
    end
})
</code></pre>

## Creating Toggles

```lua
local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "Toggle", 
    Description = "Toggle description",
    Default = false
    Callback = function(state)
	if state then
	    print("Toggle On")
	else
	    print("Toggle Off")
        end
    end 
})
```

### Event Handling

<pre class="language-lua"><code class="lang-lua">Toggle:OnChanged(function()
    print("Toggle changed:", <a data-footnote-ref href="#user-content-fn-1">Options</a>.MyToggle.Value)
end)
</code></pre>

### Changing Value

```lua
Toggle:SetValue(false)
```

## Creating Sliders

{% code fullWidth="false" %}

```lua
local Slider = Tab:AddSlider("Slider", 
{
    Title = "Slider",
    Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        print("Slider was changed:", Value)
    end
})
```

{% endcode %}

### Event Handling

```lua
Slider:OnChanged(function(Value)
    print("Slider changed:", Value)
end)
```

### Changing Value

```lua
Slider:SetValue(3)
```

## Creating Dropdowns

```lua
local Dropdown = Tab:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Description = "Dropdown description",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = false,
    Default = 1,
})
```

### Multiple Dropdown

```lua
local MultiDropdown = Tab:AddDropdown("MultiDropdown", {
   Title = "Dropdown",
   Description = "You can select multiple values.",
   Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
   Multi = true,
   Default = {"seven", "twelve"},
})
```

### Event Handling

```lua
Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
end)
```

```lua
MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        table.insert(Values, Value)
    end
    print("Mutlidropdown changed:", table.concat(Values, ", "))
end)
```

### Changing Value

```lua
Dropdown:SetValue("four")
```

```lua
MultiDropdown:SetValue({
   three = true,
   five = true,
   seven = false
})
```

## Creating Colorpickers

```lua
local Colorpicker = Tab:AddColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Description = "Description for colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
end)
    
Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))
```

### Transparency Colorpicker

```lua
local TColorpicker = Tab:AddColorpicker("TransparencyColorpicker", {
    Title = "Colorpicker",
    Description = "but you can change the transparency.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})
```

### Event Handling

```lua
Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
end)

TColorpicker:OnChanged(function()
    print(
        "TColorpicker changed:", TColorpicker.Value,
        "Transparency:", TColorpicker.Transparency
    )
end)
```

### Changing Value

```lua
Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

TColorpicker:SetValue({0, 100, 100}, 0.5) -- hsv, transparency
```

## Creating Keybinds

<pre class="language-lua"><code class="lang-lua">local Keybind = Tab:AddKeybind("Keybind", {
    Title = "Keybind",
    Description = "Keybind Description",
    Mode = "Toggle", -- Always, Toggle, Hold
    Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

    -- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function(Value)
        print("Keybind clicked!", Value)
    end,

    -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    ChangedCallback = function(New)
        print("Keybind changed!", New)
    end
<strong>})
</strong></code></pre>

### Event Handling

```lua
-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
end)

Keybind:OnChanged(function()
    print("Keybind changed:", Keybind.Value)
end)

task.spawn(function()
    while true do
        wait(1)
        -- example for checking if a keybind is being pressed
        local state = Keybind:GetState()
        if state then
            print("Keybind is being held down")
        end

        if Fluent.Unloaded then break end
    end
end)
```

### Changing Value

```lua
Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold
```

## Creating Inputs

```lua
local Input = Tab:AddInput("Input", {
    Title = "Input",
    Description = "Input Description",
    Default = "Default",
    Placeholder = "Placeholder",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        print("Input changed:", Value)
    end
})
```

### Event Handling

```lua
Input:OnChanged(function()
    print("Input updated:", Input.Value)
end)
```

### Changing Value

```lua
Input:SetValue("Text")
```

### Toggle Gui Transparency

```lua
Fluent:ToggleTransparency(false) and Fluent:ToggleTransparency(true)
```

### Toggle Acrylic (Blur)

```lua
Fluent:ToggleAcrylic(false) or Fluent:ToggleAcrylic(true)
```

### Destroy Fluent

```lua
Fluent:Destroy()
```

[^1]: [#creating-options](#creating-options "mention")


# Save Manager

### Creating Save Manager

```lua
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
```

### Auto Load Config

```lua
SaveManager:LoadAutoloadConfig()
```
