extends Label

@export var stateMachine: FiniteStateMachine

func _process(delta: float):
	if stateMachine:
		text = str(stateMachine.currentState.name)
