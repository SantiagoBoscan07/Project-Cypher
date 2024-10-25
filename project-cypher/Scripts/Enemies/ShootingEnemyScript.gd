extends State

@export var shootingPosition: Marker2D
@export var speed = 500.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectile.tscn")
@export var player: CharacterBody2D
@export var ray_cast: RayCast2D
@export var ShootingTimer: Timer
var projectile

func enter():
	ShootingTimer.start()

func update(_delta):
	ray_cast.target_position = ray_cast.to_local(player.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physicsUpdate(_delta):
	pass


func _on_shooting_state_timer_timeout():
	shoot()

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = (ray_cast.target_position).normalized()
#	projectile.z_index = player.z_index - 1
	get_tree().current_scene.add_child(projectile)



func _on_state_switch_timeout():
	ShootingTimer.stop()
	stateTransition.emit(get_parent().currentState, "BombState")
