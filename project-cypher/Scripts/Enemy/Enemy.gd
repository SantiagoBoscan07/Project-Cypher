extends CharacterBody2D

@export var health: Health

func _ready():
	if health:
		health.connect("no_health", die)

func die():
	call_deferred("queue_free")
