extends State

@export var shootingPosition: Marker2D
@export var speed = 500.0
@onready var projectilePreload: PackedScene = preload("res://Scenes/Enemy/EnemyProjectile.tscn")
var projectile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_tree():
	pass

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shooting_state_timer_timeout():
	shoot()

# Loads the projectile scene and creates an instantiate in the scene
func shoot():
	projectile = projectilePreload.instantiate()
	projectile.position = shootingPosition.global_position
	projectile.direction = Vector2.DOWN
#	projectile.z_index = player.z_index - 1
	get_tree().current_scene.add_child(projectile)
	
