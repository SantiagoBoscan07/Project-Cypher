extends Node2D

@export var speed = 500.0
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

# Calculates velocity
func _ready():
	velocity = direction * speed

# Changes the position of the projectile each frame 
func _process(delta):
	global_position += velocity * delta

# When the projectile leaves the screen it gets deleted
func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
