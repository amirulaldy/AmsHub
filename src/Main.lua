local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local Config = _G.AmsHub.Config
local Modes = _G.AmsHub.Modes
local TP = _G.AmsHub.Teleport

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AmsHub"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(520,320)
main.Position = UDim2.fromScale(0.5,0.5) - UDim2.fromOffset(260,160)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- Gradient
local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40,40,40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,40)
title.Text = "AmsHub"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Button helper
local function btn(text,y,callback)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.fromOffset(160,36)
    b.Position = UDim2.fromOffset(20,y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(45,45,45)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.MouseButton1Click:Connect(callback)
end

-- Buttons
btn("Safe Mode",60,function() Modes:Set("Safe") Config.Mode="Safe" Config:Save() end)
btn("Risky Mode",110,function() Modes:Set("Risky") Config.Mode="Risky" Config:Save() end)
btn("Blatant Mode",160,function() Modes:Set("Blatant") Config.Mode="Blatant" Config:Save() end)
btn("TP Jungle",220,function() TP:Go("Jungle") end)

-- Toggle RightShift
local open = true
UIS.InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode == Enum.KeyCode.RightShift then
        open = not open
        TweenService:Create(
            main,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad),
            {Position = open and UDim2.fromScale(0.5,0.5)-UDim2.fromOffset(260,160)
             or UDim2.fromScale(0.5,1.5)}
        ):Play()
    end
end)
