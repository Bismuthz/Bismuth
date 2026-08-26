local supportedGames = {}

supportedGames.OPERATIONONE = {
	placeIDs = { 72920620366355 },
	gitPath = "Games/Operation One",

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
		Delta = "Detected",
	},
}

supportedGames.VAGRANT = {
	placeIDs = { 100283815455755 },
	gitPath = "Games/Vagrant Survival",

	gameName = "Vagrant Survival",
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
		Delta = "Detected",
	},
}

supportedGames.TOWN = {
	placeIDs = { 4991214437 },
	gitPath = "Games/Town",

	gameName = "Town",
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
		Delta = "Detected",
	},
}

return supportedGames
