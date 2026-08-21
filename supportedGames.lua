local supportedGames = {}

supportedGames.BLOXSTRIKE = {
	placeIDs = { 114234929420007, 135434213652028, 108194354348181 },
	gitPath = "Games/Bloxstrike",

	gameName = "BloxStrike",
	status = "Undetected",

	defaultExecutorStatus = "Down",
	executorStatus = {
		Potassium = "Down",
		Volt = "Down",
		Synz = "Down",
		Madium = "Down",
		Velocity = "Down",
		Xeno = "Down",
		Solara = "Down",
		Real = "Down",
	},
}

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


supportedGames.VAGRANT = {
	placeIDs = { 100283815455755 },
	gitPath = "Games/Vagrant%20Survival",

	gameName = "Vagrant Survival",
	status = "Undetected",

	defaultExecutorStatus = "Undetected",
	executorStatus = {
		Potassium = "Undetected",
		Volt = "Undetected",
		Synz = "Undetected",
		Real = "Undetected",

		Madium = "Undetecte",
		Velocity = "Detected",
		Xeno = "Detected",
		Solara = "Detected",
	},
}

return supportedGames
