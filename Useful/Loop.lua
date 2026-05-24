--  Multiple Toggle GUI with Loop👑
-- Never Delete 🔶
--====================

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local toggled = false
local calls = {}

-- GUI root
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 260, 0, 190)
Main.Position = UDim2.new(0, 20, 0, 150)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 24)
Main.BorderSizePixel = 0

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(60, 60, 65)

-- Top Bar (Drag Area)
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "Agent Remote Loop"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left -- ✅ correct
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(220,220,220)

-- Toggle Button
local Toggle = Instance.new("TextButton", Main)
Toggle.Size = UDim2.new(0, 70, 0, 26)
Toggle.Position = UDim2.new(1, -80, 0, 38)
Toggle.Text = "OFF"
Toggle.Font = Enum.Font.SourceSansBold
Toggle.TextSize = 14
Toggle.BackgroundColor3 = Color3.fromRGB(50,50,55)
Toggle.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

-- Call Box
-- Call Box
local CallBox = Instance.new("TextBox", Main)
CallBox.Size = UDim2.new(1, -20, 0, 70)
CallBox.Position = UDim2.new(0, 10, 0, 72)
CallBox.PlaceholderText = "Paste SimpleSpy call here"
CallBox.TextWrapped = true
CallBox.TextYAlignment = Enum.TextYAlignment.Top -- ✅ FIXED
CallBox.ClearTextOnFocus = false
CallBox.Font = Enum.Font.Code
CallBox.TextSize = 13
CallBox.BackgroundColor3 = Color3.fromRGB(28,28,32)
CallBox.TextColor3 = Color3.fromRGB(230,230,230)
CallBox.BorderSizePixel = 0
Instance.new("UICorner", CallBox).CornerRadius = UDim.new(0, 8)

-- Add Button
local Add = Instance.new("TextButton", Main)
Add.Size = UDim2.new(0.5, -15, 0, 28)
Add.Position = UDim2.new(0, 10, 1, -38)
Add.Text = "Add"
Add.Font = Enum.Font.SourceSansBold
Add.TextSize = 14
Add.BackgroundColor3 = Color3.fromRGB(0,120,200)
Add.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Add).CornerRadius = UDim.new(0, 6)

-- Clear Button
local Clear = Instance.new("TextButton", Main)
Clear.Size = UDim2.new(0.5, -15, 0, 28)
Clear.Position = UDim2.new(0.5, 5, 1, -38)
Clear.Text = "Clear"
Clear.Font = Enum.Font.SourceSansBold
Clear.TextSize = 14
Clear.BackgroundColor3 = Color3.fromRGB(160,50,50)
Clear.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Clear).CornerRadius = UDim.new(0, 6)

-- Toggle Logic
Toggle.MouseButton1Click:Connect(function()
	toggled = not toggled
	Toggle.Text = toggled and "ON" or "OFF"
	Toggle.BackgroundColor3 = toggled
		and Color3.fromRGB(0,170,0)
		or Color3.fromRGB(50,50,55)
end)

-- Add Call
Add.MouseButton1Click:Connect(function()
	local txt = CallBox.Text
	if txt == "" then return end

	local fn = loadstring(txt)
	if fn then
		table.insert(calls, fn)
	end

	CallBox.Text = ""
end)

-- Clear Calls
Clear.MouseButton1Click:Connect(function()
	table.clear(calls)
end)

-- Loop Executor
RunService.Heartbeat:Connect(function()
	if not toggled then return end
	for _, fn in ipairs(calls) do
		pcall(fn)
	end
end)

-- Smooth Drag (TopBar only)
do
	local dragging, dragStart, startPos

	TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			Main.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end
-- 🧲 Floating Minimize Button (Agent UX)

local UIS = game:GetService("UserInputService")

-- Floating Button
local FloatBtn = Instance.new("TextButton")
FloatBtn.Size = UDim2.new(0, 44, 0, 44)
FloatBtn.Position = UDim2.new(0, 10, 0.5, -22)
FloatBtn.BackgroundColor3 = Color3.fromRGB(35,35,40)
FloatBtn.Text = "≡"
FloatBtn.TextSize = 22
FloatBtn.Font = Enum.Font.SourceSansBold
FloatBtn.TextColor3 = Color3.fromRGB(230,230,230)
FloatBtn.Parent = ScreenGui
FloatBtn.ZIndex = 10
FloatBtn.AutoButtonColor = true

Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", FloatBtn).Color = Color3.fromRGB(70,70,75)

-- Toggle visibility
local minimized = false
FloatBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	Main.Visible = not minimized
end)

-- Drag Floating Button
do
	local dragging, dragStart, startPos

	FloatBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = FloatBtn.Position
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			FloatBtn.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end
