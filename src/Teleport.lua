local Teleport = {}
local plr = game.Players.LocalPlayer

Teleport.Locations = {
	Jungle = CFrame.new(0,10,0),
	Ocean = CFrame.new(500,10,200),
	Volcano = CFrame.new(1000,20,400),
	CrystalCave = CFrame.new(1500,15,700),
}

function Teleport:Go(name)
	local char = plr.Character
	if char and self.Locations[name] then
		char:PivotTo(self.Locations[name])
	end
end

function Teleport:OpenMenu()
	for name,_ in pairs(self.Locations) do
		warn("Teleport available:", name)
	end
end

return Teleport
