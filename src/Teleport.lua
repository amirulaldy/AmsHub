local Teleport = {}
local plr = game.Players.LocalPlayer

Teleport.Locations = {
	Jungle        = CFrame.new(120, 12, -340),
	Ocean         = CFrame.new(-560, 10, 220),
	Volcano       = CFrame.new(980, 28, 410),
	CrystalCave  = CFrame.new(1420, 18, 760),
	AncientRuins = CFrame.new(1750, 22, -120),
}

function Teleport:Go(name)
	local char = plr.Character
	if char and self.Locations[name] then
		char:PivotTo(self.Locations[name])
	end
end

return Teleport
