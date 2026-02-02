local FishIt = {}

FishIt.Places = {
	["Spawn"] = CFrame.new(0,10,0),
	["Ancient Jungle"] = CFrame.new(1200,15,-800),
	["Ancient Ruins"] = CFrame.new(-900,20,600),
	["Secret Spot"] = CFrame.new(3000,50,2000)
}

function FishIt:Teleport(name)
	local char = game.Players.LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = self.Places[name]
	end
end

return FishIt
