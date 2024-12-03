extends Control

var playerCypherArray = [1, 1, 1] #FIXME Need logic to reset cyphers to default (1, 1, 1) at beginning of scene
var codeCypherArray
var playerArrayIndex = 0
@export var slots: Array[Sprite2D]
@export var arrows: Array[Sprite2D]
@export var cypherRange = 3
@export var codeGenerator: Node2D
@export var cypherTimer: Timer
@export var cypherTimerTime: float = 1
@export var progressBar: TextureProgressBar
var isFilling: bool = false
var RandomPowerUp = RandomNumberGenerator.new()
var powerInt
var tempVal = 0
var canCheck: bool = false

func _ready():
	hide()
	Signals.connect("slotsSet", powerUp)
	canCheck = false
	process_mode = 4

func codeSetup():
	cypherTimer.wait_time = cypherTimerTime
	progressBar.max_value = cypherTimer.wait_time
	progressBar.value = 0
	isFilling = true
	cypherTimer.start()
	show()
	resetArray()
	slotSet()
	getCode()

func getCode():
	codeCypherArray = codeGenerator.generateCode()
	canCheck = true

func resetArray():
	playerCypherArray = [1,1,1]
	playerArrayIndex = 0
	arrowBehavior(0)

func endCypher():
	#print("end cypher")
	cypherTimer.stop()
	hide()
	Signals.emit_signal("endCypher")
	process_mode = 4

func _process(delta: float):
	#print(cypherTimer.time_left)
	if isFilling:
		progressBar.value += delta
	if canCheck:
		if codeCypherArray == playerCypherArray:
			canCheck = false
			isFilling = false
			AudioManager.playSlotSet()


func powerUp():
	powerInt = RandomPowerUp.randi_range(1, 3)
	match powerInt:
		1: barrier()
		2: clone()
		3: storm()
	AudioManager.playPowerup()
	endCypher()

func slotSet():
	for slot in slots.size():
		slots[slot].frame = playerCypherArray[slot]

func arrowBehavior(playerIndex):
	for arrow in arrows.size():
		if arrow == playerIndex:
			arrows[arrow].visible = true
		else:
			arrows[arrow].visible = false

func setPlayerCypherArray(value):
	tempVal = playerCypherArray[playerArrayIndex] + value
	if (tempVal > cypherRange):
		playerCypherArray[playerArrayIndex] = 1
	elif (tempVal < 1):
		playerCypherArray[playerArrayIndex] = cypherRange
	else:
		playerCypherArray[playerArrayIndex] = tempVal
	slotSet()
	#print(playerCypherArray)
	#print("Code Array: " + str(codeCypherArray))

func getPlayerCypherArray():
	return playerCypherArray[playerArrayIndex]
	
func playerRight():
	if (playerArrayIndex < playerCypherArray.size() - 1):
		playerArrayIndex += 1
	else	:
		playerArrayIndex = 0
	arrowBehavior(playerArrayIndex)
	#print(playerArrayIndex)

func playerLeft():
	if (playerArrayIndex > 0):
		playerArrayIndex -= 1
	else:
		playerArrayIndex = playerCypherArray.size() - 1
	arrowBehavior(playerArrayIndex)
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
	if Input.is_action_just_pressed("moveLeft") and canCheck:
		playerLeft()
	if Input.is_action_just_pressed("moveRight") and canCheck:
		playerRight()
	if Input.is_action_just_pressed("moveUp") and canCheck:
		playerUp()
	if Input.is_action_just_pressed("moveDown") and canCheck:
		playerDown()

# If the button is pressed, the barrier will show up
func barrier() -> void:
	Signals.emit_signal("activateBarrier")

# If the button is pressed, the clones will show up
func clone() -> void:
	Signals.emit_signal("activateClone")

# If the button is pressed, the projectiles will show up
func storm() -> void:
	Signals.emit_signal("startStorm")


func _on_cypher_timer_timeout() -> void:
	endCypher()
	Signals.emit_signal("endPowerUp")
