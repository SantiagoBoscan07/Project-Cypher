extends CharacterBody2D

# Store values for the player that are used in other nodes
signal oneMore()
@export var playerSpeed: float = 50
@export var health: Health
@export var isClone: bool = false
@export var hurtbox: Hurtbox
var lastChance: bool = true
var lastDirectionFacing: Vector2
var isMoving: bool = false
var isAiming: bool = false

func _ready():
	if health:
		health.connect("no_health", die)
	if hurtbox:
		hurtbox.hurt.connect(func(hitbox: Hitbox):
			AudioManager.playHurt()
			)
func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("pause") and !isClone:
		call_deferred("test")

func die():
	if lastChance:
		health.health = 1
		oneMore.emit()
		lastChance = false
	else:
		call_deferred("test")

func test():
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
