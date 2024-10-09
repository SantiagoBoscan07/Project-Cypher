extends Node
class_name FiniteStateMachine

# Store the states in a dictionary and uses their name as a key
var states: Dictionary = {}
# Variable that stores the current activte state
var currentState: State
# Initial state that we are setting in the editor
@export var initialState: State

# Function that fills the dictionary depending on the states that are child of the state machine
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.stateTransition.connect(changeState)
	if initialState:
		initialState.enter()
		currentState = initialState

# Function that changes from the old state to a new one
func changeState(sourceState: State, newStateName: String):
	if sourceState != currentState:
		print("Invalid changeState trying from: " + sourceState.name + " but currently in: " + currentState.name)
		return
	var newState = states.get(newStateName.to_lower())
	if !newState:
		print("New state is empty")
		return
	if currentState:
		currentState.exit()
	newState.enter()
	currentState = newState

# Force transition from any state to a specific state, use carefully!
func forceChangeState(newStateName: String):
	var newState = states.get(newStateName.to_lower())
	if !newState:
		print(newState + " does not exist in the dictionary of states")
		return
	if currentState == newState:
		print("State is same, aborting")
		return
	if currentState:
		var exitCallable = Callable(currentState, "Exit")
		exitCallable.call_deferred()
	newState.enter()
	currentState = newState

# Every frame it checks if there is a current state, and if so, it runs the update function
func _process(delta):
	if currentState:
		currentState.update(delta)

# Every frame it checks if there is a current state, and if so, it runs physics process
func _physics_process(delta: float):
	if currentState:
		currentState.physicsUpdate(delta)
