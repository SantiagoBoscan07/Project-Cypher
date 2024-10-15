extends Control

@export var inputSettings: Control

func _ready():
	visible = true


func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Test/test.tscn") # this is going to change


func _on_options_pressed():
	inputSettings.visible = true
	visible = false
