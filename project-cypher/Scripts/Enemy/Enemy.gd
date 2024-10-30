extends CharacterBody2D

@export var health: Health

func _ready():
	if health:
		health.connect("no_health", die)

func die():
	call_deferred("queue_free")


func _on_enabler_screen_exited():
	call_deferred("queue_free")
