extends CanvasLayer

@export var label: Label
@export var label2: Label
var moveUp
var moveDown
var moveLeft
var moveRight
var shoot
var dash
var decipher

func _ready():
	for inputEvent in InputMap.action_get_events("shoot"):
		if inputEvent is InputEventKey:
			label2.text = "Press " + inputEvent.as_text() + " To Continue"
	updateText()

func updateText():
	for inputEvent in InputMap.action_get_events("moveUp"):
		if inputEvent is InputEventKey:
			moveUp = "Move Up: " + inputEvent.as_text() + "\n"
	for inputEvent in InputMap.action_get_events("moveDown"):
		if inputEvent is InputEventKey:
			moveDown = "Move Down: " + inputEvent.as_text() + "\n"
	for inputEvent in InputMap.action_get_events("moveLeft"):
		if inputEvent is InputEventKey:
			moveLeft = "Move Left: " + inputEvent.as_text() + "\n"
	for inputEvent in InputMap.action_get_events("moveRight"):
		if inputEvent is InputEventKey:
			moveRight = "Move Right: " + inputEvent.as_text() + "\n \n"
	for inputEvent in InputMap.action_get_events("shoot"):
		if inputEvent is InputEventKey:
			shoot = "Shoot: " + inputEvent.as_text() + "\n"
	for inputEvent in InputMap.action_get_events("dash"):
		if inputEvent is InputEventKey:
			dash = "Dash: " + inputEvent.as_text() + "\n"
	for inputEvent in InputMap.action_get_events("decipher"):
		if inputEvent is InputEventKey:
			decipher = "Decipher: " + inputEvent.as_text() + "\n"
	label.text = moveUp + moveDown + moveLeft + moveRight + shoot + dash + decipher

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("shoot") and visible:
		get_tree().paused = false
		hide()
