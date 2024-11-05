extends Node2D
class_name SpawnerNode

@export var scene: PackedScene
var instance

func spawn(position: int, global_spawn_position: Vector2 = global_position, parent: Node2D = get_tree().current_scene) -> Node:
	assert(scene is PackedScene, "Error: The scene export was never set")
	instance = scene.instantiate()
	match position:
		0:
			instance.upEntrance = true
		1:
			instance.leftEntrance = true
		2:
			instance.rightEntrance = true
	parent.add_child(instance)
	instance.global_position = global_spawn_position
	return instance
