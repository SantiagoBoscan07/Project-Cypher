extends Node2D

@export var player: CharacterBody2D
@export var hurtbox: Hurtbox
@export var dashDuration: Timer
@export var dashCooldown: Timer
@export var dashClones: GPUParticles2D
@export var sprite: Node2D
@export var isClone: bool = false
var canDash: bool = true
var boostSpeed
var normalSpeed

# If dash button pressed, the character is moving, and dash is active, then it will activate the dash move
func _physics_process(delta):
	if Input.is_action_pressed("dash") and player.isMoving and canDash:
		boost()
	shadowCloneBehavior()

# Starts timer duration for dash, it creates clone effect, and it boost the character speed
func boost():
	dashDuration.start()
	if !isClone:
		hurtbox.isInvulnerable = true
		sprite.modulate.a = 0.5
		dashClones.emitting = true
	normalSpeed = player.playerSpeed
	boostSpeed = player.playerSpeed * 2
	player.playerSpeed = boostSpeed
	canDash = false


# Checks if the player is moving or not while the boost is active
func shadowCloneBehavior():
	if !player.isMoving and !dashDuration.is_stopped() and !isClone:
		dashClones.emitting = false
	if player.isMoving and !dashDuration.is_stopped() and !isClone:
		dashClones.emitting = true

# Once the dash is over it starts a cooldown timer
func _on_dash_duration_timeout() -> void:
	if !isClone:
		hurtbox.isInvulnerable = false
		dashClones.emitting = false
		sprite.modulate.a = 1
	player.playerSpeed = normalSpeed
	dashCooldown.start()

# Once the cooldown ends, the dash is active again
func _on_dash_cooldown_timeout() -> void:
	canDash = true
