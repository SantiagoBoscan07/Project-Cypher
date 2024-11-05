extends State

@export var projectileSpawner: ProjectileSpawner

func enter():
	projectileSpawner.timer()


func _on_duration_timer_timeout() -> void:
	stateTransition.emit(get_parent().currentState, "MoveState")
