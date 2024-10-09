extends Node
class_name State

signal stateTransition(sourceState: State, newStateName: String)

# Entering a state
func enter():
	pass

# Exiting a state
func exit():
	pass

# Checks every frame
func update(_delta:float):
	pass

# Checks every frame and it accounts for any physics changes
func physicsUpdate(_delta:float):
	pass
