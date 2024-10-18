extends Node2D

@export var cloneTimer: Timer
@export var clone1: Marker2D
@export var clone2: Marker2D

@onready var clone: PackedScene = preload("res://Scenes/Player/playerClone.tscn")

var cloneObject1
var cloneObject2

func _ready() -> void:
	Signals.connect("activateClone", cloneActivate)

func cloneActivate():
	# test print
	print('Clone activated.')
	
	# reference two pointers
	# spawn two clones on those pointers
	cloneObject1 = clone.instantiate()
	cloneObject1.position = clone1.global_position
	get_tree().current_scene.add_child(cloneObject1)
	
	cloneObject2 = clone.instantiate()
	cloneObject2.position = clone2.global_position
	get_tree().current_scene.add_child(cloneObject2)
	
	# start a timer
	cloneTimer.start()
# connect when the timer ends, and create a new function
# those clones dissapear when the timer runs out


func _on_clone_timer_timeout() -> void:
	cloneTimer.stop()
	print('Clone disappeared.')

	cloneObject1.queue_free()
	cloneObject2.queue_free()
