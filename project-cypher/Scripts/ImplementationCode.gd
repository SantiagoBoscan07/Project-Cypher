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
	#print(playerArrayIndex)

func playerLeft():
	if (playerArrayIndex > 0):
		playerArrayIndex -= 1
	else:
		playerArrayIndex = playerCypherArray.size() - 1
	#print(playerArrayIndex)

func _unhandled_input(event: InputEvent):
	# Add check to verify the state of the game and move index accordingly
	if Input.is_action_just_pressed("moveLeft"):
		playerLeft()
	if Input.is_action_just_pressed("moveRight"):
		playerRight()
