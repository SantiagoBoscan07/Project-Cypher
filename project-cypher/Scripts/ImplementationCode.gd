extends Node

var playerCypherArray = [1, 2, 3]
var playerArrayIndex = 0

func setPlayerCypherArray(value):
	playerCypherArray[playerArrayIndex] = value
func getPlayerCypherArray():
	return playerCypherArray[playerArrayIndex]
	
func playerRight():
	if (playerArrayIndex < playerCypherArray.size() - 1):
		playerArrayIndex += 1
	else	:
		playerArrayIndex = 0
	
	print(playerArrayIndex)
func playerLeft():
	if (playerArrayIndex > 0):
		playerArrayIndex -= 1
	else:
		playerArrayIndex = playerCypherArray.size() - 1
