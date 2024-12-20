extends Node2D

class_name ProjectileSpawner

@export var bullethell: PackedScene
@export_range(0,2*PI) var alpha: float = 0.0
@export var bulletspawner: Marker2D
@export var power_timer: Timer
@export var durationTimer: Timer
@export var body: CharacterBody2D
@export var isPlayer: bool = false

var canStorm: bool = true
var theta: float = 0.0
var speed = 100
var direction = Vector2.RIGHT

func _ready():
	if isPlayer:
		Signals.connect("startStorm", timer)
		Signals.connect("turnOff", deactivate)

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func start_storm(angle):
	var bullethell = bullethell.instantiate()
	if isPlayer:
		AudioManager.playStormPlayer()
	else:
		AudioManager.playStormEnemy()
	bullethell.position = bulletspawner.global_position
	bullethell.z_index = body.z_index - 1
	bullethell.direction = get_vector(angle)
	get_tree().current_scene.call_deferred("add_child", bullethell)

func _on_bullet_storm_duration_timeout():
	power_timer.stop()
	if isPlayer:
		AudioManager.playPowerDown()
		Signals.emit_signal("endPowerUp")

func timer():
	power_timer.start()
	if isPlayer:
		Signals.emit_signal("powerUpDuration", durationTimer.wait_time)
	durationTimer.start()

func _on_bullet_storm_cooldown_timeout():
	start_storm(theta)

func deactivate():
	power_timer.stop()
