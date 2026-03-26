-- // Floating Toggle Button for Fluent (FIXED + ENHANCED)

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- cleanup if re-run
if CoreGui:FindFirstChild("FluentToggleButton") then
    CoreGui.FluentToggleButton:Destroy()
end

local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "FluentToggleButton"
ToggleGui.Parent = CoreGui
ToggleGui.ResetOnSpawn = false
ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Button = Instance.new("ImageButton")
Button.Size = UDim2.fromOffset(50, 50)
Button.Position = UDim2.fromOffset(20, 200)
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.Parent = ToggleGui
Button.AutoButtonColor = false
Button.ImageColor3 = Color3.fromRGB(255, 255, 255)

-- round
local corner = Instance.new("UICorner", Button)
corner.CornerRadius = UDim.new(1, 0)

-- stroke (clean look)
local stroke = Instance.new("UIStroke", Button)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(120, 120, 255)

-- ICON (Lucide style)
Button.Image = "https://raw.githubusercontent.com/lucide-icons/lucide/main/icons/menu.png"

-- toggle Fluent window
local visible = true
Button.MouseButton1Click:Connect(function()
    visible = not visible
    -- Safe call in case Window isn't defined yet
    if typeof(Window) == "table" and type(Window.Minimize) == "function" then
        Window:Minimize(not visible)
    end
end)

-- ========== DRAG SYSTEM (FIXED + ENHANCED) ==========
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local function update(input)
    if not startPos then return end
    local delta = input.Position - dragStart
    local newX = startPos.X.Offset + delta.X
    local newY = startPos.Y.Offset + delta.Y
    
    -- Keep button on-screen
    if Camera then
        local screenSize = Camera.ViewportSize
        local buttonSize = Button.AbsoluteSize
        newX = math.clamp(newX, 0, screenSize.X - buttonSize.X)
        newY = math.clamp(newY, 0, screenSize.Y - buttonSize.Y)
    end
    
    Button.Position = UDim2.fromOffset(newX, newY)
end

-- InputBegan on the button
Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
        
        -- Visual feedback
        Button:TweenSize(UDim2.fromOffset(52, 52), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
        
        -- Handle input end (this is the key fix!)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                dragInput = nil
                Button:TweenSize(UDim2.fromOffset(50, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
            end
        end)
    end
end)

-- InputChanged ON THE BUTTON (not UIS) - this is the fix!
Button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

-- UIS.InputChanged only fires when NOT over GUI, so we use it as backup
-- but the primary drag comes from Button.InputChanged
UIS.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Fallback InputEnded (in case the input.Changed connection fails)
UIS.InputEnded:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and dragging then
        dragging = false
        dragInput = nil
        Button:TweenSize(UDim2.fromOffset(50, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
    end
end)

-- Optional: Reset position on resolution change
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local pos = Button.Position
    local screenSize = Camera.ViewportSize
    local buttonSize = Button.AbsoluteSize
    Button.Position = UDim2.fromOffset(
        math.clamp(pos.X.Offset, 0, screenSize.X - buttonSize.X),
        math.clamp(pos.Y.Offset, 0, screenSize.Y - buttonSize.Y)
    )
end)
