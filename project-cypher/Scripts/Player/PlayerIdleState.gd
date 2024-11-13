extends State
class_name PlayerIdleState

@export var playerAnimationTree: AnimationTree
@export var player: CharacterBody2D
var movementActions = ["moveUp", "moveDown", "moveLeft", "moveRight"]

# Animations are set for idle
func enter():
	player.isMoving = false
	playerAnimationTree["parameters/conditions/idle"] = true
	playerAnimationTree["parameters/conditions/moving"] = false

# If any move button is pressed, then it switches to move state
func update(_delta: float):
	for action in movementActions:
		if Input.is_action_pressed(action):
			stateTransition.emit(get_parent().currentState, "PlayerMoveState")
