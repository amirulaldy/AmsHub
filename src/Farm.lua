local Farm = {}
Farm.Enabled = false

function Farm:Start()
	self.Enabled = true
	task.spawn(function()
		while self.Enabled do
			-- Contoh logic aman:
			-- auto cast / auto reel (placeholder)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
			task.wait(0.2)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
			task.wait(2)
		end
	end)
end

function Farm:Stop()
	self.Enabled = false
end

return Farm
