extends Node2D


@export var speed = 100.0
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

# Calculates velocity
func _ready():
	velocity = direction * speed

# Changes the position of the projectile each frame 
func _process(delta):
	global_position += velocity * delta


func _on_life_time_timeout():
	queue_free()
