-- AmsHub Main UI (FINAL)
-- Bubble Minimize + Mobile Scale + Save Config

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local Config = _G.AmsHub.Config
local Modes = _G.AmsHub.Modes
local TP = _G.AmsHub.Teleport

-- ================= SCALE (MOBILE FRIENDLY) =================
local isMobile = UIS.TouchEnabled
local SCALE = isMobile and 0.85 or 1

local function scaleUDim2(x, y)
	return UDim2.fromOffset(x * SCALE, y * SCALE)
end

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "AmsHub"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- ================= MAIN FRAME =================
local main = Instance.new("Frame", gui)
main.Size = scaleUDim2(520, 320)
main.Position = UDim2.fromScale(0.5,0.5) - scaleUDim2(260,160)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,40)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}

-- ================= TITLE =================
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.fromOffset(12,0)
title.BackgroundTransparency = 1
title.Text = "AmsHub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Left

-- ================= TOP BUTTONS =================
local function topBtn(text, x, color)
	local b = Instance.new("TextButton", main)
	b.Size = scaleUDim2(30,24)
	b.Position = UDim2.fromOffset(x * SCALE, 8)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = color
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
	return b
end

local minimizeBtn = topBtn("-", 520-70, Color3.fromRGB(70,70,70))
local closeBtn    = topBtn("X", 520-35, Color3.fromRGB(130,40,40))

-- ================= BUTTON HELPER =================
local function button(text, y, callback)
	local b = Instance.new("TextButton", main)
	b.Size = scaleUDim2(180,36)
	b.Position = scaleUDim2(20,y)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.BorderSizePixel = 0
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
	b.MouseButton1Click:Connect(callback)
	return b
end

-- ================= FEATURE TOGGLES =================
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

button("Teleport Menu", 230, function()
	TP:OpenMenu()
end)

-- ================= STATES =================
local open = true
local minimized = false
local closed = false
local normalPos = main.Position

-- ================= BUBBLE ICON =================
local bubble = Instance.new("TextButton", gui)
bubble.Size = scaleUDim2(56,56)
bubble.Position = UDim2.fromScale(0.05,0.8)
bubble.Text = "🫧"
bubble.TextSize = 28
bubble.Visible = false
bubble.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", bubble).CornerRadius = UDim.new(1,0)

bubble.MouseButton1Click:Connect(function()
	bubble.Visible = false
	main.Visible = true
	TweenService:Create(main, TweenInfo.new(0.3),
		{Position = normalPos}
	):Play()
end)

-- ================= MINIMIZE =================
minimizeBtn.MouseButton1Click:Connect(function()
	if closed then return end
	minimized = true
	main.Visible = false
	bubble.Visible = true
end)

-- ================= CLOSE =================
closeBtn.MouseButton1Click:Connect(function()
	closed = true
	gui:Destroy()
end)

-- ================= RIGHT SHIFT TOGGLE =================
UIS.InputBegan:Connect(function(input, gp)
	if gp or closed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		open = not open
		gui.Enabled = open
	end
end)

-- ================= AUTO LOAD CONFIG =================
if Config.Mode then
	Modes:Set(Config.Mode)
end
