extends Node2D

@export var cloneTimer: Timer
@export var clone1Marker: Marker2D
@export var clone2Marker: Marker2D

@onready var clone: PackedScene = preload("res://Scenes/Player/playerClone.tscn")

var cloneObject1
var cloneObject2

func _ready() -> void:
	Signals.connect("activateClone", cloneActivate)
	Signals.connect("turnOff", deactivate)

func cloneActivate():
	#print('Clone activated.')
	cloneObject1 = clone.instantiate()
	cloneObject1.position = clone1Marker.global_position
	get_tree().current_scene.add_child(cloneObject1)
	cloneObject2 = clone.instantiate()
	cloneObject2.position = clone2Marker.global_position
	get_tree().current_scene.add_child(cloneObject2)
	Signals.emit_signal("powerUpDuration", cloneTimer.wait_time)
	cloneTimer.start()

func _on_clone_timer_timeout() -> void:
	cloneTimer.stop()
	#print('Clone disappeared.')
	cloneObject1.queue_free()
	cloneObject2.queue_free()
	AudioManager.playPowerDown()
	Signals.emit_signal("endPowerUp")

func deactivate():
	cloneTimer.stop()
	if cloneObject1 != null and cloneObject2 != null:
		cloneObject1.queue_free()
		cloneObject2.queue_free()
