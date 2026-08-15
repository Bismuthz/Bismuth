if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if not localPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = Players.LocalPlayer
end

local GITHUB_REPO = "https://raw.githubusercontent.com/Intellectlol/Intellect.lol/main/"
local executor = identifyexecutor and identifyexecutor() or "Unknown"

local selfKicked = false
local function kickPlayer(reason)
	if selfKicked then
		return
	end
	selfKicked = true
	localPlayer:Kick("[Intellect.lol] " .. reason)
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
	local chunk = loadstring(game:HttpGet(url))
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

for _, gameInfo in pairs(supportedGames) do
	if table.find(gameInfo.placeIDs, placeID) then
		if gameInfo.status ~= "Undetected" then
			return kickPlayer(gameInfo.gameName .. " is currently marked " .. gameInfo.status .. " -- not loading")
		end
		return load(GITHUB_REPO .. gameInfo.gitPath .. "/main.luau")
	end
end

kickPlayer("this game is unsupported (place " .. placeID .. ")")
