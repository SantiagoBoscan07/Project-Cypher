extends Control

@export var inputSettings: Control
@export var playButton: Button
@export var optionButton: Button

func _ready():
	playButton.grab_focus()
	visible = true


func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Test/test.tscn") # this is going to change


func _on_options_pressed():
	optionButton.grab_focus()
	inputSettings.visible = true
	visible = false


func _on_back_menu_pressed() -> void:
	playButton.grab_focus()


func _on_play_game_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")
