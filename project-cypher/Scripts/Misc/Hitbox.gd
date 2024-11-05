extends Area2D
class_name Hitbox

@export var damage = 1
@export var isProjectile: bool = false

signal hit_hurtbox(hurtbox)

func _ready():
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: Hurtbox):
	if not hurtbox is Hurtbox: return
	
	if hurtbox.isInvulnerable: return
	
	hit_hurtbox.emit(hurtbox)
	hurtbox.hurt.emit(self)
	if isProjectile:
		owner.call_deferred("queue_free")
