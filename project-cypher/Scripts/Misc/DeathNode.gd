extends Node
class_name DeathNode

@export var body: CharacterBody2D
@export var deathAnimation: PackedScene
@export var isPlayer: bool = false
var instance

func _ready():
	if isPlayer:
		body.health.health += 1
	if body.health:
		if isPlayer:
			body.health.connect("health_changed", lastChanceCheck)
		body.health.connect("no_health", die)

func lastChanceCheck():
	if body.health.health == 1:
		body.oneMore.emit()

func die():
	instance = deathAnimation.instantiate()
	instance.position = body.global_position
	get_tree().current_scene.add_child(instance)
	if isPlayer:
		Global.isDead = true
		Signals.emit_signal("turnOff")
		body.process_mode = 4
		body.hide()
		AudioManager.playDeathPlayer()
	else:
		AudioManager.playEnemyDeath()
		get_tree().call_group("Spawner", "checkEnemy")
		body.call_deferred("queue_free")
