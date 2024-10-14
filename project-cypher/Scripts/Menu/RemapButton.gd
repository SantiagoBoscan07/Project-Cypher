extends Button
class_name RemapButton

@export var action: String

# Sets toggle mode for the button
func _init():
	toggle_mode = true
	theme_type_variation = "RemapButton"

# Sets the unhandle input as false and updates the key text properly
func _ready():
	set_process_unhandled_input(false)
	updateKeyText()

# Sets the toggle state properly
func _toggled(button_pressed):
	set_process_unhandled_input(button_pressed)
	if button_pressed:
		text = "Awaiting Input"
		release_focus()
	else:
		updateKeyText()
		grab_focus()

# Takes care of events pressed
func _unhandled_input(event: InputEvent):
	if event.pressed:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		button_pressed = false

# Updates text properly
func updateKeyText():
	text = "%s" % InputMap.action_get_events(action)[0].as_text()
