extends Area2D
class_name Hurtbox

var is_invicible = false:
	set (value):
		is_invicible = value
		for child in get_children():
			if not child is CollisionShape2D and not child is CollisionPolygon2D: continue
			child.set_deferred("disabled", is_invicible)

signal hurt(hitbox)
