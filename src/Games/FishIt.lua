local FishIt = {}

FishIt.Points = {
	Jungle = CFrame.new(1200, 20, -800),
	Ruins  = CFrame.new(-900, 20, 600),
	Spawn  = CFrame.new(0, 10, 0)
}

function FishIt:Teleport(name)
	local char = game.Players.LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local cf = self.Points[name]
		if cf then
			char.HumanoidRootPart.CFrame = cf
		end
	end
end

return FishIt
