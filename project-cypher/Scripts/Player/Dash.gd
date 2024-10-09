extends Node2D

@export var player: CharacterBody2D
@export var hurtbox: Hurtbox
@export var dashDuration: Timer
@export var dashCooldown: Timer
var canDash: bool = true
var boostSpeed
var normalSpeed

func _physics_process(delta):
	if Input.is_action_pressed("dash") and player.isMoving and canDash:
		boost()

func boost():
	dashDuration.start()
	hurtbox.is_invicible = true
	normalSpeed = player.playerSpeed
	boostSpeed = player.playerSpeed * 2
	player.playerSpeed = boostSpeed
	canDash = false


func _on_dash_duration_timeout() -> void:
	player.playerSpeed = normalSpeed
	dashCooldown.start()


func _on_dash_cooldown_timeout() -> void:
	canDash = true
