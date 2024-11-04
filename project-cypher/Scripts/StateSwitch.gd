extends Node
var current_state: String ="state1"

# Create dictionary that stores all the states

# Create a variable that stores the current state



func _ready() -> void:
	Signals.connect("state_changed", test)
	test2()

func test():
	# Create logic that goes from one state to another
	print("hello")

func test2(): 
	Signals.emit_signal("state_changed") 
