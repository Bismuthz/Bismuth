if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if not localPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = Players.LocalPlayer
end

local GITHUB_REPO = "https://raw.githubusercontent.com/Bismuthz/Bismuth/main/"
local executor = identifyexecutor and identifyexecutor() or "Unknown"

local selfKicked = false
local function kickPlayer(reason)
	if selfKicked then
		return
	end
	selfKicked = true
	localPlayer:Kick("[Bismuth] " .. reason)
end

local REQUIRED = {
	loadstring = loadstring,
	cloneref = cloneref,
	newcclosure = newcclosure,
	clonefunction = clonefunction,
	getupvalues = getupvalues,
	setreadonly = setreadonly,
	setthreadidentity = setthreadidentity,
	getthreadidentity = getthreadidentity,
	isrbxactive = isrbxactive,
	["debug.info"] = debug and debug.info,
	["debug.setupvalue"] = debug and debug.setupvalue,

	getrawmetatable = getrawmetatable,
	iscclosure = iscclosure,
	islclosure = islclosure,
	isexecutorclosure = isexecutorclosure,

	run_on_actor = run_on_actor,
	getactors = getactors,
	create_comm_channel = create_comm_channel,
	get_comm_channel = get_comm_channel,

	writefile = writefile,
	readfile = readfile,
	isfile = isfile,
	delfile = delfile,
	makefolder = makefolder,
}

local missing = {}

for name, value in pairs(REQUIRED) do
	if type(value) ~= "function" then
		table.insert(missing, name)
	end
end

if not (Drawing and type(Drawing.new) == "function") then
	table.insert(missing, "Drawing")
end

if #missing > 0 then
	table.sort(missing)
	return kickPlayer(executor .. " is missing " .. #missing .. " required alias(es): " .. table.concat(missing, ", "))
end

local function load(url, ...)
	url = string.gsub(url, " ", "%%20")

	local body = game:HttpGet(url)
	if type(body) ~= "string" or #body == 0 then
		return kickPlayer("empty response from " .. url)
	end

	local chunk = loadstring(body)
	if not chunk then
		return kickPlayer("syntax error in " .. url)
	end
	return chunk(...)
end

local placeID = game.PlaceId
local supportedGames = load(GITHUB_REPO .. "supportedGames.lua")

if not supportedGames then
	return kickPlayer("supportedGames.lua returned nothing")
end

local function statusForExecutor(gameInfo)
	local name = string.lower(executor)
	local marked = gameInfo.executorStatus

	if marked then
		for key, status in pairs(marked) do
			local lowerKey = string.lower(key)
			if string.sub(name, 1, #lowerKey) == lowerKey then
				return status
			end
		end
	end

	return gameInfo.defaultExecutorStatus or "Undetected"
end

for _, gameInfo in pairs(supportedGames) do
	if table.find(gameInfo.placeIDs, placeID) then
		if gameInfo.status ~= "Undetected" then
			return kickPlayer(gameInfo.gameName .. " is currently marked " .. gameInfo.status .. "Get a better executor goofball")
		end

		local executorStatus = statusForExecutor(gameInfo)

		if executorStatus ~= "Undetected" then
			return kickPlayer(executor .. " is currently marked " .. executorStatus .. " for " .. gameInfo.gameName .. "Get a better executor goofball")
		end

		return load(GITHUB_REPO .. gameInfo.gitPath .. "/main.luau")
	end
end

kickPlayer("this game is unsupported (place " .. placeID .. ")")
