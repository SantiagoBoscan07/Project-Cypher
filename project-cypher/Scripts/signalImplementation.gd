extends Node
var current_state: String ="state1"

#Connect this script to the signal you created
# Create function that emits that signal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("state_changed", test)
	test2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func test():
	print("hello")

func test2(): 
	Signals.emit_signal("state_changed") 
