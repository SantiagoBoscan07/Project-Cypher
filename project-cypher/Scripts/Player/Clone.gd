extends Node2D

@export var cloneTimer: Timer
@export var clone1Marker: Marker2D
@export var clone2Marker: Marker2D

@onready var clone: PackedScene = preload("res://Scenes/Player/playerClone.tscn")

var cloneObject1
var cloneObject2

func _ready() -> void:
	Signals.connect("activateClone", cloneActivate)

func cloneActivate():
	#print('Clone activated.')
	cloneObject1 = clone.instantiate()
	cloneObject1.position = clone1Marker.global_position
	get_tree().current_scene.add_child(cloneObject1)
	cloneObject2 = clone.instantiate()
	cloneObject2.position = clone2Marker.global_position
	get_tree().current_scene.add_child(cloneObject2)
	cloneTimer.start()

func _on_clone_timer_timeout() -> void:
	cloneTimer.stop()
	#print('Clone disappeared.')
	cloneObject1.queue_free()
	cloneObject2.queue_free()
