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

func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")

func die():
	if lastChance:
		health.health = 1
		oneMore.emit()
		lastChance = false
	else:
		process_mode = 4

func test():
	print("Cypher State enabled")
	process_mode = 4
