extends Node
class_name Hurt

@export var health: Health

@export var hurtbox: Hurtbox

func _ready() -> void:
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		health.health -= hitbox.damage
)
