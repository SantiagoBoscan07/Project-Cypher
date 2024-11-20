extends State

@export var secondState: State 
@export var enemy: CharacterBody2D
@export var entrySpeed: int = 100
@export var entryTimer: Timer
var entryTimerTime: float

func enter():
	entryTimerTime = randf_range(0.2, 0.5)
	entryTimer.wait_time = entryTimerTime
	entryTimer.start()

func physicsUpdate(_delta):
	if enemy.upEntrance:
		enemy.position += Vector2(0, entrySpeed)  * _delta
	elif enemy.rightEntrance:
		enemy.position += Vector2(entrySpeed * -1, 0) * _delta
	elif enemy.leftEntrance:
		enemy.position += Vector2(entrySpeed, 0) * _delta
	elif enemy.cornerUpLeftEntrance:
		enemy.position += Vector2(entrySpeed, entrySpeed) * _delta
	elif enemy.cornerUpRightEntrance:
		enemy.position += Vector2(entrySpeed * -1, entrySpeed) * _delta
	elif enemy.cornerDownLeftEntrance:
		enemy.position += Vector2(entrySpeed, entrySpeed * -1) * _delta
	elif enemy.cornerDownRightEntrance:
		enemy.position += Vector2(entrySpeed * -1, entrySpeed * -1) * _delta
	enemy.move_and_slide()

func _on_entry_timer_timeout() -> void:
	stateTransition.emit(get_parent().currentState, secondState.name)
