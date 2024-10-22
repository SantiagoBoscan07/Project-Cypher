extends CharacterBody2D

# Store values for the player that are used in other nodes
@export var playerSpeed: int = 50
@export var health: Health
var lastDirectionFacing: Vector2
var isMoving: bool = false

func _ready():
	if health:
		health.connect("no_health", die)

func die():
	queue_free()
