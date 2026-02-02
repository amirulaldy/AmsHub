local Farm = {Enabled = false}

function Farm:Start()
	if self.Enabled then return end
	self.Enabled = true

	task.spawn(function()
		while self.Enabled do
			task.wait(1)
		end
	end)
end

function Farm:Stop()
	self.Enabled = false
end

return Farm
