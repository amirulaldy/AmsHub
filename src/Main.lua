local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AmsHub"
gui.ResetOnSpawn = false

local TP = _G.AmsHub.Teleport
local Farm = require(script.Parent.Farm)
local AntiAFK = require(script.Parent.AntiAFK)
local Config = _G.AmsHub.Config
local Modes = _G.AmsHub.Modes

-- Mobile scale
local scale = UIS.TouchEnabled and 0.85 or 1

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(520*scale, 320*scale)
main.Position = UDim2.fromScale(0.5,0.5) - UDim2.fromOffset(260*scale,160*scale)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- Sidebar teleport
local side = Instance.new("Frame", main)
side.Size = UDim2.fromOffset(140*scale, 260*scale)
side.Position = UDim2.fromOffset(10, 50)
side.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", side)

local y = 10
for name,_ in pairs(TP.Locations) do
	local b = Instance.new("TextButton", side)
	b.Size = UDim2.fromOffset(120*scale, 34*scale)
	b.Position = UDim2.fromOffset(10, y)
	b.Text = name
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	b.MouseButton1Click:Connect(function()
		TP:Go(name)
	end)
	y += 40
end

-- AutoFarm toggle
local farmBtn = Instance.new("TextButton", main)
farmBtn.Size = UDim2.fromOffset(160*scale, 36*scale)
farmBtn.Position = UDim2.fromOffset(180*scale, 80*scale)
farmBtn.Text = "Toggle Auto Farm"
farmBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", farmBtn)

farmBtn.MouseButton1Click:Connect(function()
	Config.AutoFarm = not Config.AutoFarm
	Config:Save()
	if Config.AutoFarm then Farm:Start() else Farm:Stop() end
end)

-- Anti AFK
if Config.AntiAFK then
	AntiAFK:Enable()
end
