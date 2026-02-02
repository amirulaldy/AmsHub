local Modes = {}
Modes.Current = "Safe"
Modes.Running = false

function Modes:Set(mode)
	self.Current = mode
	self.Running = false
	task.wait()
	self.Running = true

	task.spawn(function()
		while self.Running and self.Current == mode do
			if mode == "Safe" then
				task.wait(1)
			elseif mode == "Risky" then
				task.wait(0.3) -- lebih agresif
			elseif mode == "Blatant" then
				task.wait(0.05) -- sangat agresif
			end
		end
	end)
end

return Modes
