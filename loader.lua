-- AmsHub Loader (STABLE)

local BASE = "https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/"

local success, err = pcall(function()
	loadstring(game:HttpGet(BASE .. "Main.lua", true))()
end)

if not success then
	warn("AmsHub Loader Error:")
	warn(err)
end
