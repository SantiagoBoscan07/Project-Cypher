extends State
@export var player: CharacterBody2D
@export var desiredSpeed: Vector2
@export var maxSpeedChange: float=20.0
@export var enemy: CharacterBody2D
var playerposition
# what the enemy is going to do when they enter the state
func enter():
	print("Here something will happen when the state is loaded")
func update(_delta):
	if player:
		playerposition=player.position
# what is happening with the enemy every frame
func physicsUpdate(_delta):
	var speed: float = 20.0
	enemy.velocity.x = move_toward(player.velocity.x, desiredSpeed.x, maxSpeedChange)
	enemy.velocity.y = move_toward(player.velocity.y, desiredSpeed.y, maxSpeedChange)
	enemy.move_and_slide()
	# update the position of the enemy so that it moves towards the player

# what the enemy is going to do when they exit the state
func exit():
	# make sure that the enemy does not move anymore when it transitions to the shooting state
	pass

# whenever the move timer runsout, you're transitioning to the shoot state
func _on_move_timer_timeout():
	pass # Replace with function body.
