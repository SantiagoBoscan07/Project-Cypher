extends Node2D

@export var animation: AnimationPlayer

func _ready():
	animation.play("death")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		call_deferred("queue_free")
