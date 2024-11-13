extends State

@export var shootingPosition: Marker2D
@export var speed = 200.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectileBomb.tscn")
@export var rayCast: RayCast2D
@export var stateSwitchTimer: Timer
@export var animation: AnimationPlayer
var projectile

func enter():
	animation.play("bomb")

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	#projectile.direction = (ray_cast.target_position).normalized()
	#projectile.z_index = player.z_index - 1
	projectile.direction = (rayCast.target_position).normalized()
	get_tree().current_scene.add_child(projectile)


func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "bomb":
		shoot()
		animation.play("idle")
		stateSwitchTimer.start()
		stateTransition.emit(get_parent().currentState, "ShootingState")
