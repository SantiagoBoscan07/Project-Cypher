extends Control

@export var barTimer : Timer
@export var waitTime : float = 10.0
@export var progressBar: TextureProgressBar
@export var slots: Control
var players
var enemies
var obstacles
var inputPressed : bool = false

var powerInt: int
var isFilling: bool


func _ready() -> void:
	# FIXME: Add way for timer to know when to start
	Signals.connect("endPowerUp", endPowerUp)
	Signals.connect("endCypher", resumeGame)
	progressBar.max_value = barTimer.wait_time
	progressBar.value = barTimer.wait_time
	barTimer.start()
	isFilling = true

func _process(delta):
	if isFilling:
		progressBar.value -= delta

func _unhandled_input(event: InputEvent):
	if Input.is_action_pressed("decipher") and inputPressed and !Global.isDead and !Global.isPaused:
		#print("Cypher Activated!")
#		enemies = get_tree().get_nodes_in_group("Enemy")
#		for enemy in enemies:
#			enemy.process_mode = 4
#		players = get_tree().get_nodes_in_group("Player")
#		for player in players:
#			player.process_mode = 4
#		obstacles = get_tree().get_nodes_in_group("Obstacle")
#		for obstacle in obstacles:
#			obstacle.process_mode = 4
		Engine.time_scale = 0
		Global.isPaused = true
		slots.process_mode = 0
		slots.codeSetup()
		progressBar.value = progressBar.max_value
		inputPressed = false

func _on_decipher_bar_timer_timeout() -> void:
	isFilling = false
	inputPressed = true

func endPowerUp():
	progressBar.max_value = barTimer.wait_time
	progressBar.value = barTimer.wait_time
	isFilling = true
	barTimer.start()

func resumeGame():
	Engine.time_scale = 1
	Global.isPaused = false
#	for player in players:
#		if player:
#			player.process_mode = 0
#	for enemy in enemies:
#		if enemy:
#			enemy.process_mode = 0
#	for obstacle in obstacles:
#		if obstacle:
#			obstacle.process_mode = 0
