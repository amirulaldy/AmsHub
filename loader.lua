local base = "https://raw.githubusercontent.com/amirulaldy/AmsHub/main/src/"

local function req(file)
    return loadstring(game:HttpGet(base .. file))()
end

_G.AmsHub = {
    Config = req("Config.lua"),
    Modes = req("Modes.lua"),
    Teleport = req("Teleport.lua")
}

req("Main.lua")
