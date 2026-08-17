local supportedGames = {}

supportedGames.BLOXSTRIKE = {
	placeIDs = { 114234929420007, 135434213652028, 108194354348181 },
	gitPath = "Games/Bloxstrike",

	gameName = "BloxStrike",
	status = "Undetected",

	defaultExecutorStatus = "Undetected",
	executorStatus = {
		Potassium = "Undetected",
		Volt = "Undetected",
		Synz = "Undetected",

		Madium = "Detected",
		Velocity = "Detected",
		Xeno = "Detected",
		Solara = "Detected",
		Real = "Detected",
	},
}

return supportedGames
