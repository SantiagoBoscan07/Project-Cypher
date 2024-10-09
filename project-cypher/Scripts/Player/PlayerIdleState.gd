extends State
class_name PlayerIdleState

@export var playerAnimationTree: AnimationTree
var movementActions = ["moveUp", "moveDown", "moveLeft", "moveRight"]

func enter():
	playerAnimationTree["parameters/conditions/idle"] = true
	playerAnimationTree["parameters/conditions/moving"] = false


func update(_delta: float):
	for action in movementActions:
		if Input.is_action_just_pressed(action):
			stateTransition.emit(get_parent().currentState, "PlayerMoveState")
