extends CharacterBody2D

# Store values for the player that are used in other nodes
@export var playerSpeed: int = 50
var lastDirectionFacing: Vector2
var isMoving: bool = false
@export var bullethell: PackedScene
var theta: float = 0.0
@export_range(0,2*PI) var alpha: float = 0.0

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func shoot(angle):
	var bullethell = bullethell.instantiate()
	bullethell.position = global_position
	bullethell.direction = get_vector(angle)
	get_tree().current_scene.call_deferred("add_child", bullethell)


# Testing Signal, connecting with a custom signal
func _ready():
	Signals.connect("turnOff", test)

# Once the signal is received from emitter, this text is going to be printed in the console
func test():
	print("Signal Received")


func _on_projectile_speed_timeout():
	shoot(theta)
