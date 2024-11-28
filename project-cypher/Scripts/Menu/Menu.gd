extends Control

@export var inputSettings: Control
@export var playButton: TextureButton
@export var optionButton: TextureButton

func _ready():
	playButton.grab_focus()
	visible = true


func _on_play_game_pressed():
	AudioManager.playMenuSelect()
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")


func _on_options_pressed():
	AudioManager.playMenuSelect()
	optionButton.grab_focus()
	inputSettings.visible = true
	visible = false


func _on_back_menu_pressed():
	AudioManager.playMenuSelect()
	playButton.grab_focus()
