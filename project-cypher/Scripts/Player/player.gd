extends CharacterBody2D

# Store values for the player that are used in other nodes
signal oneMore()
@export var playerSpeed: int = 50
@export var health: Health
var lastChance: bool = true
var lastDirectionFacing: Vector2
var isMoving: bool = false

func _ready():
	if health:
		health.connect("no_health", die)



func die():
	if lastChance:
		health.health = 1
		oneMore.emit()
		lastChance = false
	else:
		process_mode = 4
