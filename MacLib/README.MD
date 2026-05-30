
> **Loadstring**
```luau
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
```
> **WINDOW**
```luau
local Window = MacLib:Window({
    Title = "Kuzu Hub",
    Subtitle = "Paid | V3.12",
    Size = UDim2.fromOffset(868, 650),
    DragStyle = 1, --    -- 1: Uses a move icon to drag, ideal for PC. 2: Uses the entire UI to drag, ideal for Mobile.
    DisabledWindowControls = {}, -- "Exit" or "Minimize"
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = false, -- can be detected 
})

```
> **Notification**
```luau

Window:Notify({Title = "Kuzu Hub",Description = "Hello, World!",Lifetime = 5})
    --[[
    --optional--
    Scale <number>
    SizeX = <number>
    Style <string: "None", "Confirm", "Cancel"> -- The type of button that the user interacts with, input "None" for no interactable (or leave nil), input "Confirm" for a checkmark, and input "Cancel" for a crossmark.
    Callback <function(): void>
    --]]
```
> Notification Functions
```luau
:UpdateTitle(<string>)
:UpdateDescription(<string>)
:Resize(<number>) -- Only X, Y is automatically determined by the content size
:Cancel()
```
> Tab 
```luau
local TabGroup = Window:TabGroup()

local Tab = TabGroup:Tab({
  Name = "Hi", --  <string>
  Image = "rbxassetid://18287",   -- <string> -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})
```
> Section 
```luau
local Section = Tab:Section({
  Side = "Left" --  <string: "Left", "Right">
})
```
