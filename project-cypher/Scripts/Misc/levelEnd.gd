extends CanvasLayer
@export var label: Label

func _ready():
	for inputEvent in InputMap.action_get_events("shoot"):
		if inputEvent is InputEventKey:
			label.text = "Press " + inputEvent.as_text() + " To Continue"
	Signals.connect("endLevel", ending)

func ending():
	get_tree().paused = true
	show()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("shoot") and visible:
		get_tree().paused = !get_tree().paused
		get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
