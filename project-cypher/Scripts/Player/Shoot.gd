extends Node
class_name Shoot

@export var shootingPosition: Marker2D
@export var player: CharacterBody2D
@export var shootingTimer: Timer
@onready var projectilePreload: PackedScene = preload("res://Scenes/Player/player_projectile.tscn")
var canShoot: bool = true
var projectile

# If shoot button is pressed it calls the shoot function
func _physics_process(delta):
	if Input.is_action_pressed("shoot") and canShoot:
		shoot()

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	shootingTimer.start()
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	if player.lastDirectionFacing == Vector2.ZERO:
		player.lastDirectionFacing = Vector2.DOWN
	projectile.direction = player.lastDirectionFacing
	projectile.z_index = player.z_index - 1
	get_tree().current_scene.add_child(projectile)
	canShoot = false

# Once the timer runs out, the player can shoot again
func _on_shooting_timer_timeout() -> void:
	canShoot = true
