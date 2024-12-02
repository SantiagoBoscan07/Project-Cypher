extends Node2D
@export var barrierTimer: Timer
#@export var barrierBlink: Timer
@export var invulnerableNode: Invulnerable
#@export var blinkAnimation: AnimationPlayer
@export var sprite : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("activateBarrier", activateBarrier)
	turnOffSprite()

func activateBarrier():
	sprite.visible = true
	invulnerableNode.iFrame(barrierTimer.wait_time)
	Signals.emit_signal("powerUpDuration", barrierTimer.wait_time)
	barrierTimer.start()

func turnOffSprite():
	sprite.visible = false

func _on_barrier_timer_timeout() -> void:
	turnOffSprite()
	Signals.emit_signal("endPowerUp")
