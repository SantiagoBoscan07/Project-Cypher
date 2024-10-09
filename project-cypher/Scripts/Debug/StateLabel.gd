extends Label

@export var stateMachine: FiniteStateMachine

# Updates label to know which is the current state active for the player
func _process(delta: float):
	if stateMachine:
		text = str(stateMachine.currentState.name)
