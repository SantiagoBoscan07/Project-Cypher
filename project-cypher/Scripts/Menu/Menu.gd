extends Control

@export var inputSettings: Control
@export var playButton: TextureButton
@export var menuSelect: VBoxContainer
@export var levelSelect: BoxContainer
@export var optionButton: TextureButton
@export var level1Button: TextureButton

func _ready():
	AudioManager.connect("golevel1", goLevel1)
	playButton.grab_focus()
	visible = true


func _on_play_game_pressed():
	AudioManager.playMenuSelect()
	menuSelect.hide()
	levelSelect.show()
	level1Button.grab_focus()
	#AudioManager.stopTitleTheme()
	#AudioManager.playStartGame()


func goLevel1():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")

func _on_options_pressed():
	AudioManager.playMenuSelect()
	optionButton.grab_focus()
	inputSettings.visible = true
	visible = false


func _on_back_menu_pressed():
	AudioManager.playMenuSelect()
	playButton.grab_focus()


func _on_back_pressed() -> void:
	AudioManager.playMenuSelect()
	levelSelect.hide()
	menuSelect.show()
	playButton.grab_focus()
