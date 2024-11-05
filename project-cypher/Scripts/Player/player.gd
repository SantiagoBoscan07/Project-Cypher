extends CharacterBody2D

# Store values for the player that are used in other nodes
signal oneMore()
@export var playerSpeed: int = 50
@export var health: Health
@export var flash: Flash
@export var hurtbox: Hurtbox
@export var iframeTimer: Timer
var lastChance: bool = true
var lastDirectionFacing: Vector2
var isMoving: bool = false

func _ready():
	if health:
		health.connect("no_health", die)
	if hurtbox:
		hurtbox.hurt.connect(func(hitbox:Hitbox):
			iframeActivate()
			)

func iframeActivate():
	iframeTimer.start()
	flash._flash() 
	hurtbox.isInvulnerable = true


func die():
	if lastChance:
		health.health = 1
		oneMore.emit()
		lastChance = false
	else:
		process_mode = 4


func _on_i_frame_duration_timeout() -> void:
	flash._reset()
	hurtbox.isInvulnerable = false
