extends Node2D

@export var animation: AnimationPlayer
func _ready():
	TransitionScreen.fadeToNormal()
	AudioManager.playCredits()
	animation.play("credits")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "credits":
		backToMenu()

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		backToMenu()

func backToMenu():
	AudioManager.muteMusic()
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
