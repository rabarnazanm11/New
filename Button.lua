-- // Floating Toggle Button for Fluent (HOSTED)
-- Requires global 'Window' from Fluent

if typeof(Window) ~= "table" then
    warn("Fluent Window not found!")
    return
end

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

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

local corner = Instance.new("UICorner", Button)
corner.CornerRadius = UDim.new(1, 0)

local stroke = Instance.new("UIStroke", Button)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(120, 120, 255)

Button.Image = "https://raw.githubusercontent.com/lucide-icons/lucide/main/icons/menu.png"

-- TOGGLE FIX: Use Minimize instead of broken visible variable
local isMinimized = false
Button.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Window:Minimize(isMinimized)
end)

-- DRAG SYSTEM
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local function update(input)
    local delta = input.Position - dragStart
    local newX = startPos.X.Offset + delta.X
    local newY = startPos.Y.Offset + delta.Y
    local screenSize = Camera.ViewportSize
    local buttonSize = Button.AbsoluteSize
    
    newX = math.clamp(newX, 0, screenSize.X - buttonSize.X)
    newY = math.clamp(newY, 0, screenSize.Y - buttonSize.Y)
    
    Button.Position = UDim2.fromOffset(newX, newY)
end

Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
        Button:TweenSize(UDim2.fromOffset(52, 52), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                dragInput = nil
                Button:TweenSize(UDim2.fromOffset(50, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
            end
        end)
    end
end)

Button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

UIS.InputEnded:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and dragging then
        dragging = false
        dragInput = nil
        Button:TweenSize(UDim2.fromOffset(50, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
    end
end)

Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local pos = Button.Position
    local screenSize = Camera.ViewportSize
    local buttonSize = Button.AbsoluteSize
    Button.Position = UDim2.fromOffset(
        math.clamp(pos.X.Offset, 0, screenSize.X - buttonSize.X),
        math.clamp(pos.Y.Offset, 0, screenSize.Y - buttonSize.Y)
    )
end)
