extends Node

# Create dictionary that stores all the states: playable and cypher state
enum states {
	playableState,
	cypherState
}

# Create a variable that stores the current state
var current_state = states.playableState

# Signal for state change
signal state_changed()

func _ready() -> void:
	Signals.connect("state_changed", change_state)

func change_state():
	# Create logic that goes from one state to another
	var alt_state = (current_state + 1) % states.size()
	
	current_state = alt_state

#func _unhandled_input(event: InputEvent) -> void:
	#if (event.is_action_pressed("decipher")):
		#change_state()
		#print("current state:" + str(current_state))
	#
