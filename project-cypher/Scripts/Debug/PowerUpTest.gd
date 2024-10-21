extends Control

# If the button is pressed, the barrier will show up
func _on_barrier_pressed() -> void:
	Signals.emit_signal("activateBarrier")

# If the button is pressed, the clones will show up
func _on_clone_pressed() -> void:
	pass # Replace with function body.

# If the button is pressed, the projectiles will show up
func _on_projectiles_pressed() -> void:
	Signals.emit_signal("startStorm")

# Turn Off Any Power-Up
func _on_turn_off_pressed() -> void:
	Signals.emit_signal("turnOff")
