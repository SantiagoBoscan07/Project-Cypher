extends Control

@export var submenu: Control
@export var reloadButton: TextureButton

func _ready():
	hide()
	submenu.process_mode = 4
	Signals.connect("gameOverScreen", gameOver)

func gameOver():
	submenu.process_mode = 0
	show()
	get_tree().paused = !get_tree().paused
	reloadButton.grab_focus()


func _on_restart_pressed():
	Global.isDead = false
	AudioManager.playMenuSelect()
	AudioManager.muteMusic()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	Global.isDead = false
	AudioManager.playMenuSelect()
	AudioManager.muteMusic()
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
