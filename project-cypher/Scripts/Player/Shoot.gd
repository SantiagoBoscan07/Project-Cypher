extends Node
class_name Shoot

@export var shootingPosition: Marker2D
@export var player: CharacterBody2D
@export var shootingTimer: Timer
@onready var projectilePreload: PackedScene = preload("res://Scenes/Player/playerProjectile.tscn")
@export var isClone: bool = false
@export var cloneTimer: Timer
var canShoot: bool = true
var projectile

func _ready():
	if isClone:
		if cloneTimer:
			cloneTimer.start()

# If shoot button is pressed it calls the shoot function
func  _input(event):
	if Input.is_action_pressed("shoot") and canShoot and !isClone:
		shoot()

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	if !isClone:
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


func _on_clone_timer_timeout() -> void:
	shoot()
