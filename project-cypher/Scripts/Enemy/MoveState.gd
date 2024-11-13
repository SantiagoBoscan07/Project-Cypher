extends State

@export var moveSpeed: float=5.0
@export var enemy: CharacterBody2D
@export var moveTimer: Timer
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@export var animation: AnimationPlayer
var playerPos
var targetPos

# what the enemy is going to do when they enter the state
func enter():
	animation.play("idle")
	moveTimer.start()
# what is happening with the enemy every frame
func physicsUpdate(_delta):
	if player:
		playerPos = player.position
		targetPos = (playerPos - enemy.position).normalized()
		if enemy.position.distance_to(playerPos) > 3:
			enemy.position += targetPos * moveSpeed * _delta
			enemy.move_and_slide()
	# update the position of the enemy so that it moves towards the player

# what the enemy is going to do when they exit the state
func exit():
	# make sure that the enemy does not move anymore when it transitions to the shooting state
	pass

# whenever the move timer runsout, you're transitioning to the shoot state
func _on_move_timer_timeout():
	stateTransition.emit(get_parent().currentState, "ShootState")
