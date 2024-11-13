extends State

@export var shootingPosition: Marker2D
@export var speed = 500.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectile.tscn")
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@export var ray_cast: RayCast2D
@export var ShootingTimer: Timer
@export var animation: AnimationPlayer
@export var stateSwitchTimer: Timer
var projectile

func enter():
	stateSwitchTimer.start()
	ShootingTimer.start()

func update(_delta):
	if player:
		ray_cast.target_position = ray_cast.to_local(player.position)


func _on_shooting_state_timer_timeout():
	ShootingTimer.start()
	animation.play("shoot")

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = (ray_cast.target_position).normalized()
#	projectile.z_index = player.z_index - 1
	get_tree().current_scene.add_child(projectile)
	animation.play("idle")


func _on_state_switch_timeout():
	ShootingTimer.stop()
	stateTransition.emit(get_parent().currentState, "BombState")


func _on_animation_animation_finished(anim_name: StringName):
	if anim_name == "shoot":
		shoot()
