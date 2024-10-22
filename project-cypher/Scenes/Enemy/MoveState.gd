extends State

# what the enemy is going to do when they enter the state
func enter():
	print("Here something will happen when the state is loaded")

# what is happening with the enemy every frame
func physicsUpdate(_delta):
	# update the position of the enemy so that it moves towards the player
	pass

# what the enemy is going to do when they exit the state
func exit():
	# make sure that the enemy does not move anymore when it transitions to the shooting state
	pass

# whenever the move timer runsout, you're transitioning to the shoot state
func _on_move_timer_timeout():
	pass # Replace with function body.
