extends CharacterBody2D

@export var health: Health
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

func die():
	call_deferred("queue_free")


func _on_enabler_screen_exited():
	call_deferred("queue_free")
