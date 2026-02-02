_G.AmsHub = {}

local base = "https://raw.githubusercontent.com/amirulaldy/REPO/main/AmsHub/"

local function load(name)
	return loadstring(game:HttpGet(base .. name .. ".lua"))()
end

_G.AmsHub.Config   = load("Config")
_G.AmsHub.Teleport = load("Teleport")
_G.AmsHub.Farm     = load("Farm")
_G.AmsHub.AntiAFK  = load("AntiAFK")
_G.AmsHub.Modes    = load("Modes")

load("Main")
