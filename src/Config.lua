local HttpService = game:GetService("HttpService")
local file = "AmsHub_Config.json"

local Config = {
	Mode = "Safe",
	AutoFarm = false,
	AntiAFK = true
}

function Config:Save()
	if writefile then
		writefile(file, HttpService:JSONEncode(self))
	end
end

function Config:Load()
	if readfile and isfile and isfile(file) then
		local data = HttpService:JSONDecode(readfile(file))
		for k,v in pairs(data) do self[k] = v end
	end
end

Config:Load()
return Config
