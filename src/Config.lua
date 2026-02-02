local Config = {
	FirstRun = true
}

function Config:Load()
	-- Mobile executor sering tidak support filesystem
end

function Config:Save()
end

return Config
