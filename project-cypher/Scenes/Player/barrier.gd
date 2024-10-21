extends Node2D
@export var barrierTimer: Timer
#@export var barrierBlink: Timer
@export var Hurtbox: Hurtbox
#@export var blinkAnimation: AnimationPlayer
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("activateBarrier", activateBarrier)
	turnOffSprite()

func activateBarrier():
	sprite.visible = true
	Hurtbox.isInvulnerable = true
	barrierTimer.start()

func turnOffSprite():
	sprite.visible = false

func _on_barrier_timer_timeout() -> void:
	turnOffSprite()
	Hurtbox.isInvulnerable = false
