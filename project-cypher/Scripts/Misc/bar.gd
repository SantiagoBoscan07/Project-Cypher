extends Control

@export var barTimer : Timer
@export var waitTime : float = 10.0
@export var progressBar: TextureProgressBar
@export var slots: Control
@export var label: Label
var players
var enemies
var obstacles
var inputPressed : bool = false

var powerInt: int
var isFilling: bool


func _ready() -> void:
	for inputEvent in InputMap.action_get_events("decipher"):
		if inputEvent is InputEventKey:
			label.text = "Press " + inputEvent.as_text() + " To Decipher"
	label.hide()
	barTimer.wait_time = waitTime
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
	if Input.is_action_pressed("decipher") and inputPressed and !Global.isDead:
		slots.process_mode = 3
		slots.codeSetup()
		get_tree().paused = !get_tree().paused
		progressBar.value = progressBar.max_value
		inputPressed = false

func _on_decipher_bar_timer_timeout() -> void:
	isFilling = false
	label.show()
	inputPressed = true

func endPowerUp():
	progressBar.max_value = barTimer.wait_time
	progressBar.value = barTimer.wait_time
	isFilling = true
	barTimer.start()

func resumeGame():
	get_tree().paused = !get_tree().paused
	label.hide()
