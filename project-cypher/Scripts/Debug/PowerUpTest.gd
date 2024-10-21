extends Control

# If the button is pressed, the barrier will show up
func _on_barrier_pressed() -> void:
	Signals.emit_signal("activateBarrier")

# If the button is pressed, the clones will show up
func _on_clone_pressed() -> void:
	Signals.emit_signal("activateClone")

# If the button is pressed, the projectiles will show up
func _on_projectiles_pressed() -> void:
	Signals.emit_signal("startStorm")
