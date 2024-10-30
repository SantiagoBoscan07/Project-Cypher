extends State

@export var shootingPosition: Marker2D
@export var speed = 200.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectileBomb.tscn")
@export var rayCast: RayCast2D
@export var bombTime: Timer
@export var stateSwitchTimer: Timer
var projectile
func enter():
	shoot()
	bombTime.start()

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	#projectile.direction = (ray_cast.target_position).normalized()
	#projectile.z_index = player.z_index - 1
	projectile.direction = (rayCast.target_position).normalized()
	get_tree().current_scene.add_child(projectile)


func _on_state_bomb_timer_timeout():
	stateSwitchTimer.start()
	stateTransition.emit(get_parent().currentState, "ShootingState")
