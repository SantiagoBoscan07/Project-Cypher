extends State
class_name PlayerMoveState

@export var player: CharacterBody2D
@export var playerAnimationTree: AnimationTree
@export var marker: Marker2D
var maxSpeedChange = 0
var turnSpeed 
var acceleration 
var deceleration 
var direction = Vector2.ZERO

var desiredSpeed = Vector2.ZERO

# Ensures sprites are for movement
func enter():
	turnSpeed = player.playerSpeed / 2
	acceleration = player.playerSpeed - 5
	deceleration = player.playerSpeed - 10
	player.isMoving = true
	playerAnimationTree["parameters/conditions/idle"] = false
	playerAnimationTree["parameters/conditions/moving"] = true

# Calls movement and change direction
func physicsUpdate(_delta: float):
	movement()
	changeDirection()
	player.move_and_slide()

# Calls getInput and transition to idle state
func update(_delta: float):
	getInput()
	idleTransition()

# Gets input from movement buttons and gives a direction depending on the inputs provided
func getInput():
	var horizontalDirection = Input.get_axis("moveLeft", "moveRight")
	var verticalDirection = Input.get_axis("moveUp", "moveDown")
	if player:
		direction = Vector2(horizontalDirection, verticalDirection).normalized()
		desiredSpeed = direction * player.playerSpeed

# Calculates movement
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

# Keeps track of direction when moving and puts the sprite according to the right direction
func changeDirection():
	playerAnimationTree["parameters/Move/blend_position"].x = desiredSpeed.x
	playerAnimationTree["parameters/Move/blend_position"].y = -desiredSpeed.y
	if direction != Vector2.ZERO:
		player.lastDirectionFacing = direction

# If moving buttons are not pressed, switches to idle state and changes the direction of the sprite to the last direction the player faced
func idleTransition():
	if !Input.is_action_pressed("moveUp") and !Input.is_action_pressed("moveDown") and !Input.is_action_pressed("moveLeft") and !Input.is_action_pressed("moveRight"):
		playerAnimationTree["parameters/Idle/blend_position"].x = player.lastDirectionFacing.x
		playerAnimationTree["parameters/Idle/blend_position"].y = -player.lastDirectionFacing.y
		stateTransition.emit(get_parent().currentState, "PlayerIdleState")
