extends Area2D
class_name Hurtbox

var isInvulnerable = false:
	set (value):
		isInvulnerable = value
		for child in get_children():
			if not child is CollisionShape2D and not child is CollisionPolygon2D: continue
			child.set_deferred("disabled", isInvulnerable)

signal hurt(hitbox)
