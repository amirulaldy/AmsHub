-- AmsHub Main UI
-- Executor & GitHub Ready

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local Config = _G.AmsHub.Config
local Modes = _G.AmsHub.Modes
local TP = _G.AmsHub.Teleport

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "AmsHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.fromOffset(520, 320)
main.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(260, 160)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Gradient
local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,40)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}

-- ================= TITLE =================
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -80, 0, 40)
title.Position = UDim2.fromOffset(12, 0)
title.BackgroundTransparency = 1
title.Text = "AmsHub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Left

-- ================= TOP BUTTONS =================
local function topBtn(text, x, color)
	local b = Instance.new("TextButton", main)
	b.Size = UDim2.fromOffset(30, 24)
	b.Position = UDim2.fromOffset(x, 8)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = color
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
	return b
end

local minimizeBtn = topBtn("-", 520-70, Color3.fromRGB(60,60,60))
local closeBtn    = topBtn("X", 520-35, Color3.fromRGB(130,40,40))

-- ================= BUTTON HELPER =================
local function button(text, y, callback)
	local b = Instance.new("TextButton", main)
	b.Size = UDim2.fromOffset(160, 36)
	b.Position = UDim2.fromOffset(20, y)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
	b.MouseButton1Click:Connect(callback)
end

-- ================= BUTTONS =================
button("Safe Mode", 70, function()
	Modes:Set("Safe")
	Config.Mode = "Safe"
	Config:Save()
end)

button("Risky Mode", 120, function()
	Modes:Set("Risky")
	Config.Mode = "Risky"
	Config:Save()
end)

button("Blatant Mode", 170, function()
	Modes:Set("Blatant")
	Config.Mode = "Blatant"
	Config:Save()
end)

button("TP Jungle", 220, function()
	TP:Go("Jungle")
end)

-- ================= STATES =================
local open = true
local minimized = false
local closed = false
local normalSize = main.Size

-- ================= MINIMIZE =================
minimizeBtn.MouseButton1Click:Connect(function()
	if closed then return end
	minimized = not minimized

	TweenService:Create(
		main,
		TweenInfo.new(0.3, Enum.EasingStyle.Quad),
		{Size = minimized and UDim2.fromOffset(520, 40) or normalSize}
	):Play()
end)

-- ================= CLOSE =================
closeBtn.MouseButton1Click:Connect(function()
	closed = true
	gui:Destroy()
end)

-- ================= TOGGLE RightShift =================
UIS.InputBegan:Connect(function(input, gp)
	if gp or closed then return end

	if input.KeyCode == Enum.KeyCode.RightShift then
		open = not open

		if open then
			gui.Enabled = true
			TweenService:Create(
				main,
				TweenInfo.new(0.3),
				{Position = UDim2.fromScale(0.5,0.5) - UDim2.fromOffset(260,160)}
			):Play()
		else
			TweenService:Create(
				main,
				TweenInfo.new(0.3),
				{Position = UDim2.fromScale(0.5,1.5)}
			):Play()
		end
	end
end)
