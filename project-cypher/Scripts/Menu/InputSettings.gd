extends Control

@export var gameOptions: Control
@export var actionList: VBoxContainer
@onready var inputButtonScene = preload("res://Scenes/Menu/inputButton.tscn")

var inputConfig
var isRemapping = false
var actionToRemap = null
var remappingButton = null

var inputActions: Dictionary = {
	"moveUp": "Move Up",
	"moveLeft": "Move Left",
	"moveDown": "Move Down",
	"moveRight": "Move Right",
	"shoot": "Shoot",
	"dash": "Dash",
	"shuffle": "Shuffle",
	"decipher": "Decipher",
	"moveSlotLeft": "Move Slot Left",
	"moveSlotRight": "Move Slot Right",
	"pause": "Pause"
}

func _ready():
	createActionList()

func _enter_tree() -> void:
	load_()

func createActionList():
	var button
	var actionLabel
	var inputLabel
	var events
	InputMap.load_from_project_settings()
	for item in actionList.get_children():
		item.queue_free()
	for action in inputActions:
		button = inputButtonScene.instantiate()
		actionLabel = button.find_child("LabelAction")
		inputLabel = button.find_child("LabelInput")
		actionLabel.text = inputActions[action]
		events = InputMap.action_get_events(action)
		if events.size()  > 0:
			inputLabel.text = events[0].as_text().trim_suffix(" (Physical)")
		else:
			inputLabel.text = ""
		actionList.add_child(button)
		button.pressed.connect(_on_input_pressed.bind(button, action))

func _on_input_pressed(button, action):
	if !isRemapping:
		isRemapping = true
		actionToRemap = action
		remappingButton = button
		button.find_child("LabelInput").text = "Press Key To Bind..."

func _input(event):
	if isRemapping:
		if (
			event is InputEventKey # Here I can add Controller later
		):
			InputMap.action_erase_events(actionToRemap)
			InputMap.action_add_event(actionToRemap, event)
			updateActionList(remappingButton, event)
			_save()
			isRemapping = false
			actionToRemap = null
			remappingButton = null

func updateActionList(button, event):
	button.find_child("LabelInput").text = event.as_text().trim_suffix(" (Physical)")

func load_():
	inputConfig = load("res://Resources/mapInputResource.tres")
	if not inputConfig:
		inputConfig = Config.new()
	for action in inputConfig.input_map:
		InputMap.action_erase_events(action)
		for input_event in inputConfig.input_map[action]:
			InputMap.action_add_event(action, input_event)

func _save():
	for action in InputMap.get_actions():
		inputConfig.input_map[action] = InputMap.action_get_events(action)
	ResourceSaver.save(inputConfig, "res://Resources/mapConfig.tres")


func _on_default_button_pressed():
	createActionList()


func _on_back_menu_pressed() -> void:
	gameOptions.visible = true
	visible = false
