local Modes = {}

Modes.Current = "Safe"

function Modes:Set(mode)
    self.Current = mode
    warn("Mode set to:", mode)
end

function Modes:Run()
    if self.Current == "Safe" then
        -- legit logic
    elseif self.Current == "Risky" then
        -- high risk placeholder
    elseif self.Current == "Blatant" then
        -- blatant placeholder
    end
end

return Modes
