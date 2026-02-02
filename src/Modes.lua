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
				-- legit logic
			elseif mode == "Risky" then
				-- high frequency / unsafe placeholder
			elseif mode == "Blatant" then
				-- extreme placeholder
			end
			task.wait(1)
		end
	end)
end

return Modes
