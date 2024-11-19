extends Node2D

func ready():
	process_mode = 4

func endLevel():
	call_deferred("goMenu")

func goMenu():
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
