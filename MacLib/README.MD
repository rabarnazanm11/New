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
