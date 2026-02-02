local Http = game:GetService("HttpService")
local file = "AmsHub_Config.json"

local Config = {AutoFish=false}

function Config:Load()
	if isfile(file) then
		local data = Http:JSONDecode(readfile(file))
		for i,v in pairs(data) do
			self[i] = v
		end
	end
end

function Config:Save()
	writefile(file, Http:JSONEncode(self))
end

return Config
