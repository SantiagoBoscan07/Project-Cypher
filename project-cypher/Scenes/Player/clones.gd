extends Node2D
@export var cloneTimer: Timer
@export var clone1: Marker2D
@export var clone2: Marker2D
@onready var clone: PackedScene = preload("res://Scenes/Player/playerClone.tscn")
var cloneObject
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("activateClone", cloneActivate)

func cloneActivate():
	# test print
	print('hello')
	# reference two pointers
	# spawn two clones on those pointers
	cloneObject = clone.instantiate()
	cloneObject.position = clone1.global_position
	get_tree().current_scene.add_child(cloneObject)
	# start a timer
	cloneTimer.start()
# connect when the timer ends, and create a new function
# those clones dissapear when the timer runs out


func _on_clone_timer_timeout() -> void:
	print('timeout test')
	cloneTimer.stop()

	cloneObject.queue_free()
