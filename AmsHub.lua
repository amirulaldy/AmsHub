-- Panel Hub Script
-- Put this LocalScript inside StarterGui > ScreenGui

local player = game.Players.LocalPlayer

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PanelHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "MY GAME HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = MainFrame

-- Side Panel
local Side = Instance.new("Frame")
Side.Size = UDim2.new(0, 140, 1, -40)
Side.Position = UDim2.new(0, 0, 0, 40)
Side.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Side.BorderSizePixel = 0
Side.Parent = MainFrame

-- Content Area
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -140, 1, -40)
Content.Position = UDim2.new(0, 140, 0, 40)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Content.BorderSizePixel = 0
Content.Parent = MainFrame

-- Button Creator
local function createButton(text, posY)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Position = UDim2.new(0, 5, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.Parent = Side

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn

	return btn
end

-- Buttons
local MainBtn = createButton("Main", 10)
local SettingsBtn = createButton("Settings", 60)
local TradeBtn = createButton("Trade", 110)
local TeleportBtn = createButton("Teleport", 160)
local MiscBtn = createButton("Misc", 210)

-- Content Label
local ContentLabel = Instance.new("TextLabel")
ContentLabel.Size = UDim2.new(1, 0, 1, 0)
ContentLabel.BackgroundTransparency = 1
ContentLabel.Text = "Select a menu"
ContentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ContentLabel.Font = Enum.Font.GothamBold
ContentLabel.TextSize = 18
ContentLabel.Parent = Content

-- Button Functions
local function switchTab(name)
	ContentLabel.Text = name .. " Menu"
end

MainBtn.MouseButton1Click:Connect(function()
	switchTab("Main")
end)

SettingsBtn.MouseButton1Click:Connect(function()
	switchTab("Settings")
end)

TradeBtn.MouseButton1Click:Connect(function()
	switchTab("Trade")
end)

TeleportBtn.MouseButton1Click:Connect(function()
	switchTab("Teleport")
end)

MiscBtn.MouseButton1Click:Connect(function()
	switchTab("Misc")
end)
