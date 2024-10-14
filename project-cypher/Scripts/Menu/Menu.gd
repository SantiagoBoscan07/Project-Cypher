extends Control

@export var initial: VBoxContainer
@export var options: VBoxContainer
@export var controllers: VBoxContainer

# Makes the sure that the initial buttons are shown
func _ready():
	initial.visible = true

# When the play button is pressed, the game starts
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Test/test.tscn") # this is going to change

# When the quit button is pressed, the game closes
func _on_exit_pressed():
	get_tree().quit()

# Shows the option menu
func _on_options_pressed():
	initial.visible = false
	options.visible = true

# Shows the controller menu
func _on_controller_pressed():
	options.visible = false
	controllers.visible = true

# Shows the volume menu
func _on_volume_pressed():
	pass # Replace 

# Goes back from options menu to main menu
func _on_back_pressed():
	initial.visible = true
	options.visible = false

# Goes from controller menu to options menu
func _on_back_controller_pressed() -> void:
	controllers.visible = false
	options.visible = true
