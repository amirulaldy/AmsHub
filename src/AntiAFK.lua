local AntiAFK = {}
local vu = game:GetService("VirtualUser")

function AntiAFK:Enable()
	game.Players.LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end)
end

return AntiAFK
