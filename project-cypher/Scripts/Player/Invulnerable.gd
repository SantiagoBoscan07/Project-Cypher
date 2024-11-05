extends Node
class_name Invulnerable

@export var hurtbox: Hurtbox
@export var flash: Flash
@export var iFrameTimer: Timer
var isIframeActive: bool = false
var initialTime: float

func _ready():
	initialTime = iFrameTimer.wait_time
	hurtbox.hurt.connect(func(hitbox:Hitbox):
		iFrame(initialTime)
		)
	Signals.connect("dashProgress", iFrame)

func iFrame(time: float):
	if !isIframeActive:
		iFrameTimer.wait_time = time
		iFrameTimer.start()
		hurtbox.isInvulnerable = true
		flash._flash()
		isIframeActive = true


func _on_i_frame_duration_timeout():
	isIframeActive = false
	hurtbox.isInvulnerable = false
	flash._reset()
