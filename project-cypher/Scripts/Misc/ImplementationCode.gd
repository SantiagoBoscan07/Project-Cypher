extends Node

var playerCypherArray = [1, 1, 1] #FIXME Need logic to reset cyphers to default (1, 1, 1) at beginning of scene
var playerArrayIndex = 0
@export var cypherRange = 3
var tempVal = 0

func setPlayerCypherArray(value):
	tempVal = playerCypherArray[playerArrayIndex] + value
	
	if (tempVal > cypherRange):
		playerCypherArray[playerArrayIndex] = 1
	elif (tempVal < 1):
		playerCypherArray[playerArrayIndex] = cypherRange
	else:
		playerCypherArray[playerArrayIndex] = tempVal
	print(playerCypherArray)

	
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

func playerUp():
	setPlayerCypherArray(1)
	#if (playerCypherArray[playerArrayIndex] != cypherRange):
		#playerCypherArray[playerArrayIndex] += 1
	#else	:
		#playerCypherArray[playerArrayIndex] = 1
	#print(playerArrayIndex)

func playerDown():
	setPlayerCypherArray(-1)
	#if (playerCypherArray[playerArrayIndex] != 1):
		#playerCypherArray[playerArrayIndex] -= 1
	#else:
		#playerCypherArray[playerArrayIndex] = cypherRange
	#print(playerArrayIndex)


func _unhandled_input(event: InputEvent):
	# Add check to verify the state of the game and move index accordingly
	if Input.is_action_just_pressed("moveLeft"):
		playerLeft()
	if Input.is_action_just_pressed("moveRight"):
		playerRight()
	if Input.is_action_just_pressed("moveUp"):
		playerUp()
	if Input.is_action_just_pressed("moveDown"):
		playerDown()
