extends Label

func ready():
	if Stats.last_scorer == "P1":
		self.text = "PLAYER 1 SCORED!"
	elif Stats.last_scorer == "P2":
		self.text = "PLAYER 2 SCORED!"
	else:
		self.text = "PRESS ANY BUTTON TO START"
