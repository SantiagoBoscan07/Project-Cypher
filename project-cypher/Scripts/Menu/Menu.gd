extends Control

@export var inputSettings: Control
@export var playButton: TextureButton
@export var menuSelect: VBoxContainer
@export var levelSelect: BoxContainer
@export var optionButton: TextureButton
@export var level1Button: TextureButton

func _ready():
	playButton.grab_focus()
	visible = true


func _on_play_game_pressed():
	AudioManager.playMenuSelect()
	menuSelect.hide()
	levelSelect.show()
	level1Button.grab_focus()


func _on_options_pressed():
	AudioManager.playMenuSelect()
	optionButton.grab_focus()
	inputSettings.visible = true
	visible = false


func _on_back_menu_pressed():
	AudioManager.playMenuSelect()
	playButton.grab_focus()


func _on_back_pressed():
	AudioManager.playMenuSelect()
	levelSelect.hide()
	menuSelect.show()
	playButton.grab_focus()


func _on_level_1_pressed():
	AudioManager.muteMusic()
	AudioManager.playStartGame()
	TransitionScreen.fadeToBlack()
	Signals.connect("endFadeBlack", startLevel1)


func startLevel1():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")


func _on_shader_toggle_pressed():
	Signals.emit_signal("toggleShader")
