extends State
class_name PlayerIdleState

@export var playerAnimationTree: AnimationPlayer
var movementActions = ["moveUp", "moveDown", "moveLeft", "moveRight"]

func enter():
	playerAnimationTree.play("idleDown")

func update(_delta: float):
	for action in movementActions:
		if Input.is_action_just_pressed(action):
			stateTransition.emit(get_parent().currentState, "PlayerMoveState")
