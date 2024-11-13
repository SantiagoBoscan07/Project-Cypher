extends State

@export var projectileSpawner: ProjectileSpawner
@export var animation: AnimationPlayer
func enter():
	animation.play("shoot")
	projectileSpawner.timer()


func _on_duration_timer_timeout() -> void:
	stateTransition.emit(get_parent().currentState, "MoveState")
