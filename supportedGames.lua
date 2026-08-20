local supportedGames = {}

supportedGames.OPERATIONONE = {
	placeIDs = { 72920620366355 },
	gitPath = "Games/Operation%20One",

	gameName = "Operation One",
	status = "Undetected",

	defaultExecutorStatus = "Undetected",
	executorStatus = {
		Potassium = "Undetected",
		Volt = "Undetected",
		Synz = "Undetected",
		Real = "Undetected",

		Madium = "Detected",
		Velocity = "Detected",
		Xeno = "Detected",
		Solara = "Detected",
	},
}

return supportedGames
