local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer

local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/UI.lua"))()
local Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/Config.lua"))()
local FishIt = loadstring(game:HttpGet("https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/Games/FishIt.lua"))()

Config:Load()

if game.CoreGui:FindFirstChild("AmsHub") then
	game.CoreGui.AmsHub:Destroy()
end

-- GUI
local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "AmsHub"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,540,0,330)
Main.Position = UDim2.new(0.5,-270,1,0)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

UI:Gradient(Main, Color3.fromRGB(0,170,255), Color3.fromRGB(120,0,255))

-- OPEN TWEEN
TweenService:Create(
	Main,
	TweenInfo.new(0.4, Enum.EasingStyle.Quint),
	{Position = UDim2.new(0.5,-270,0.5,-165)}
):Play()

-- SIDEBAR
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0,150,1,0)
Side.BackgroundTransparency = 1

local Tele1 = UI:Button(Side,"TP Jungle",10)
local Tele2 = UI:Button(Side,"TP Ruins",60)
local Tele3 = UI:Button(Side,"TP Secret",110)

Tele1.MouseButton1Click:Connect(function()
	FishIt:Teleport("Ancient Jungle")
end)

Tele2.MouseButton1Click:Connect(function()
	FishIt:Teleport("Ancient Ruins")
end)

Tele3.MouseButton1Click:Connect(function()
	FishIt:Teleport("Secret Spot")
end)

-- TOGGLE RightShift + TWEEN
local open = true
UIS.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode.RightShift then
		open = not open
		TweenService:Create(
			Main,
			TweenInfo.new(0.35),
			{Position = open and UDim2.new(0.5,-270,0.5,-165) or UDim2.new(0.5,-270,1,0)}
		):Play()
	end
end)
