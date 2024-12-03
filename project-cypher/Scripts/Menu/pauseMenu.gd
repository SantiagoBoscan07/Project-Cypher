extends Control

@export var submenu: Control
@export var resumeButton: TextureButton

func _ready():
	hide()
	submenu.process_mode = 4
	Signals.connect("pausemenu", paused)

func paused():
	submenu.process_mode = 0
	show()
	resumeButton.grab_focus()


func _on_resume_pressed():
	AudioManager.playMenuSelect()
	hide()
	submenu.process_mode = 4
	get_tree().paused = !get_tree().paused


func _on_reload_pressed():
	AudioManager.playMenuSelect()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
