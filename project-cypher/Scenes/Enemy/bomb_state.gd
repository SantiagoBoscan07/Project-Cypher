extends State

@export var shootingPosition: Marker2D
@export var speed = 200.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectileBomb.tscn")
var projectile
@export var bombTime: Timer
@export var projectilePosition: Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	print("boom")
	shoot()
	bombTime.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	#projectile.direction = (ray_cast.target_position).normalized()
#	projectile.z_index = player.z_index - 1
	projectile.direction = Vector2.DOWN
	get_tree().current_scene.add_child(projectile)


func _on_state_bomb_timer_timeout():
	stateTransition.emit(get_parent().currentState, "ShootingState")
