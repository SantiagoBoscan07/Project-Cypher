extends CharacterBody2D

# Store values for the player that are used in other nodes
signal oneMore()
@export var playerSpeed: float = 50
@export var health: Health
@export var isClone: bool = false
@export var hurtbox: Hurtbox
var lastDirectionFacing: Vector2
var isMoving: bool = false
var isAiming: bool = false

func _ready():
	if hurtbox:
		hurtbox.hurt.connect(func(hitbox: Hitbox):
			AudioManager.playHurt()
			)

func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("pause") and !isClone:
		Signals.emit_signal("pausemenu")
		get_tree().paused = !get_tree().paused
