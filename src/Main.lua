-- AmsHub Main (REWRITE FIXED)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local BASE = "https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/"

local UI = loadstring(game:HttpGet(BASE.."UI.lua"))()
local Config = loadstring(game:HttpGet(BASE.."Config.lua"))()
local FishIt = loadstring(game:HttpGet(BASE.."Games/FishIt.lua"))()

if game.CoreGui:FindFirstChild("AmsHub") then
	game.CoreGui.AmsHub:Destroy()
end

-- GUI ROOT
local Gui = Instance.new("ScreenGui")
Gui.Name = "AmsHub"
Gui.Parent = game.CoreGui

-- MAIN FRAME
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 420, 0, 260)
Main.Position = UDim2.new(0.5, -210, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

-- MOBILE SCALE
local scale = Instance.new("UIScale", Main)
if UIS.TouchEnabled then
	scale.Scale = 0.85
end

-- TITLE
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 36)
Title.BackgroundTransparency = 1
Title.Text = "AmsHub - Fish It"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)

-- SIDEBAR
local Side = Instance.new("Frame", Main)
Side.Position = UDim2.new(0, 0, 0, 36)
Side.Size = UDim2.new(0, 140, 1, -36)
Side.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- CONTENT
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 140, 0, 36)
Content.Size = UDim2.new(1, -140, 1, -36)
Content.BackgroundColor3 = Color3.fromRGB(20,20,20)

-- LABEL
local Label = Instance.new("TextLabel", Content)
Label.Size = UDim2.new(1, 0, 1, 0)
Label.BackgroundTransparency = 1
Label.Text = "Select Teleport"
Label.Font = Enum.Font.GothamBold
Label.TextSize = 16
Label.TextColor3 = Color3.new(1,1,1)

-- BUTTONS
local b1 = UI:Button(Side, "TP Jungle", 10)
local b2 = UI:Button(Side, "TP Ruins", 60)
local b3 = UI:Button(Side, "TP Spawn", 110)

b1.MouseButton1Click:Connect(function()
	FishIt:Teleport("Jungle")
	Label.Text = "Teleported: Jungle"
end)

b2.MouseButton1Click:Connect(function()
	FishIt:Teleport("Ruins")
	Label.Text = "Teleported: Ruins"
end)

b3.MouseButton1Click:Connect(function()
	FishIt:Teleport("Spawn")
	Label.Text = "Teleported: Spawn"
end)

-- TOGGLE RightShift (DESKTOP)
UIS.InputBegan:Connect(function(i, gp)
	if not gp and i.KeyCode == Enum.KeyCode.RightShift then
		Main.Visible = not Main.Visible
	end
end)
