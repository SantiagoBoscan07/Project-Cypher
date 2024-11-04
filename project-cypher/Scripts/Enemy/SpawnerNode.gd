extends Node2D
class_name SpawnerNode

@export var scene: PackedScene
@onready var projectileSpawnerDuration = $"../ProjectileSpawnerDuration"
var instance

func spawn(global_spawn_position: Vector2 = global_position, parent: Node2D = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set")
	instance = scene.instantiate()
	parent.add_child(instance)
	instance.global_position = global_spawn_position
	return instance
