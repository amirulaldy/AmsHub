local Teleport = {}

Teleport.Locations = {
    Jungle = CFrame.new(0,0,0),
    Volcano = CFrame.new(100,0,100),
}

function Teleport:Go(name)
    local char = game.Players.LocalPlayer.Character
    if char and self.Locations[name] then
        char:PivotTo(self.Locations[name])
    end
end

return Teleport
