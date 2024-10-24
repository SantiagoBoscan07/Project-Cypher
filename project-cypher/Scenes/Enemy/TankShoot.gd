extends State

func enter():
	Signals.emit_signal("enemyStorm")


func _on_duration_timer_timeout() -> void:
	stateTransition.emit(get_parent().currentState, "MoveState")
