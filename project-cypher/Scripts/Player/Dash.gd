extends Node2D
class_name Dash
@export var player: CharacterBody2D
@export var dashDuration: Timer
@export var dashCooldown: Timer
#@export var dashClones: GPUParticles2D
@export var marker: Marker2D
@export var shadowScene: PackedScene
@export var sprite: Node2D
@export var isClone: bool = false
@export var hitbox: Hitbox
@export var collision: CollisionShape2D
var canDash: bool = true
var boostSpeed
var normalSpeed
var shadow
var shadow2
var shadow3

# If dash button pressed, the character is moving, and dash is active, then it will activate the dash move
func _physics_process(delta):
	if Input.is_action_pressed("dash") and player.isMoving and canDash:
		boost()
	shadowCloneBehavior()

# Starts timer duration for dash, it creates clone effect, and it boost the character speed
func boost():
	dashDuration.start()
	normalSpeed = player.playerSpeed
	boostSpeed = player.playerSpeed * 2
	player.playerSpeed = boostSpeed
	if !isClone:
		shadow = shadowScene.instantiate()
		shadow2 = shadowScene.instantiate()
		shadow3 = shadowScene.instantiate()
		shadow.global_position = player.global_position
		shadow2.global_position = shadow.global_position
		shadow3.global_position = shadow2.global_position
		get_tree().current_scene.add_child(shadow)
		get_tree().current_scene.add_child(shadow2)
		get_tree().current_scene.add_child(shadow3)
		#dashClones.emitting = true
		hitbox.process_mode = 0
		player.set_collision_mask_value(1, false)
		Signals.emit_signal("dashProgress", dashDuration.wait_time)
	canDash = false



# Checks if the player is moving or not while the boost is active
func shadowCloneBehavior():
	if !player.isMoving and !dashDuration.is_stopped() and !isClone:
		sprite.modulate.a = 1
		shadow.visible = false
		shadow2.visible = false
		shadow3.visible = false
		#dashClones.emitting = false
	if player.isMoving and !dashDuration.is_stopped() and !isClone:
		sprite.modulate.a = 0.7
		shadow.visible = true
		shadow2.visible = true
		shadow3.visible = true
		shadow.global_position = shadow.global_position.lerp(player.global_position, 0.2)
		shadow2.global_position = shadow2.global_position.lerp(shadow.global_position, 0.2)
		shadow3.global_position = shadow3.global_position.lerp(shadow2.global_position, 0.2)
		#dashClones.emitting = true

# Once the dash is over it starts a cooldown timer
func _on_dash_duration_timeout() -> void:
	if !isClone:
		#dashClones.emitting = false
		sprite.modulate.a = 1
		shadow.call_deferred("queue_free")
		shadow2.call_deferred("queue_free")
		shadow3.call_deferred("queue_free")
		player.set_collision_mask_value(1, true)
		hitbox.process_mode = 4
		Signals.emit_signal("dashCooldownProgress", dashCooldown.wait_time)
	player.playerSpeed = normalSpeed
	dashCooldown.start()

# Once the cooldown ends, the dash is active again
func _on_dash_cooldown_timeout() -> void:
	canDash = true
