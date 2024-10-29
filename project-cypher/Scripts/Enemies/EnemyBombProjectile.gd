extends Node2D

@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectile.tscn")
@export var shootingPosition: Marker2D
var projectile
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
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2.LEFT
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2.RIGHT
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2.UP
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2.DOWN
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2(1.0, 1.0).normalized()
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2(1.0, -1.0).normalized()
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2(-1.0, 1.0).normalized()
	get_tree().current_scene.add_child(projectile)
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2(-1.0, -1.0).normalized()
	get_tree().current_scene.add_child(projectile)
