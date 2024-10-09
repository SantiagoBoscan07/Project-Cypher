extends State
class_name PlayerMoveState

@export var player: CharacterBody2D
@export var playerAnimationTree: AnimationTree
@export var marker: Marker2D
@export var playerSpeed: int = 50
@export var turnSpeed = 25
@export var acceleration = 45
@export var deceleration = 40
var direction = Vector2.ZERO
var maxSpeedChange = 0
var desiredSpeed = Vector2.ZERO


func enter():
	playerAnimationTree["parameters/conditions/idle"] = false
	playerAnimationTree["parameters/conditions/moving"] = true

func physicsUpdate(_delta: float):
	movement()
	changeDirection()
	player.move_and_slide()

func update(_delta: float):
	getInput()
	idleTransition()

func getInput():
	var horizontalDirection = Input.get_axis("moveLeft", "moveRight")
	var verticalDirection = Input.get_axis("moveUp", "moveDown")
	if player:
		direction = Vector2(horizontalDirection, verticalDirection).normalized()
		desiredSpeed = direction * playerSpeed

func movement():
	if direction != Vector2.ZERO:
		if signf(direction.x) != signf(player.velocity.x) or signf(direction.y) != signf(player.velocity.y):
			maxSpeedChange = turnSpeed
		else:
			maxSpeedChange = acceleration
	else:
		maxSpeedChange = deceleration
	player.velocity.x = move_toward(player.velocity.x, desiredSpeed.x, maxSpeedChange)
	player.velocity.y = move_toward(player.velocity.y, desiredSpeed.y, maxSpeedChange)

func changeDirection():
	playerAnimationTree["parameters/Move/blend_position"].x = desiredSpeed.x
	playerAnimationTree["parameters/Move/blend_position"].y = -desiredSpeed.y
	if direction != Vector2.ZERO:
		player.lastDirectionFacing = direction

func idleTransition():
	if !Input.is_action_pressed("moveUp") and !Input.is_action_pressed("moveDown") and !Input.is_action_pressed("moveLeft") and !Input.is_action_pressed("moveRight"):
		playerAnimationTree["parameters/Idle/blend_position"].x = player.lastDirectionFacing.x
		playerAnimationTree["parameters/Idle/blend_position"].y = -player.lastDirectionFacing.y
		stateTransition.emit(get_parent().currentState, "PlayerIdleState")
