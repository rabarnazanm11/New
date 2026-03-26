return function(Window)
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

    Instance.new("UICorner", Button).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", Button)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(120, 120, 255)

    Button.Image = "https://raw.githubusercontent.com/lucide-icons/lucide/main/icons/menu.png"

    local isMinimized = false
    Button.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        Window:Minimize(isMinimized)
    end)

    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        local newX = math.clamp(startPos.X.Offset + delta.X, 0, Camera.ViewportSize.X - 50)
        local newY = math.clamp(startPos.Y.Offset + delta.Y, 0, Camera.ViewportSize.Y - 50)
        Button.Position = UDim2.fromOffset(newX, newY)
    end

    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            dragInput = nil
            Button:TweenSize(UDim2.fromOffset(50, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
        end
    end)
end
