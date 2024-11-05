extends CharacterBody2D

@export var health: Health
@export var hurtbox: Hurtbox
@export var flash: Flash
var upEntrance: bool = false:
	set(value):
		upEntrance = value
var leftEntrance: bool = false:
	set(value):
		leftEntrance = value
var rightEntrance: bool = false:
	set(value):
		rightEntrance = value

func _ready():
	if health:
		health.connect("no_health", die)
	if hurtbox:
		hurtbox.hurt.connect(func(hitbox:Hitbox):
			flash._flash()
			)

func die():
	call_deferred("queue_free")


func _on_enabler_screen_exited():
	call_deferred("queue_free")
