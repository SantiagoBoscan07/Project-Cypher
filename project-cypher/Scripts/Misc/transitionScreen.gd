extends CanvasLayer

@export var animation: AnimationPlayer

func _ready():
	hide()

func fadeToBlack():
	show()
	animation.play("fadeToBlack")

func fadeToNormal():
	show()
	animation.play("fadeToNormal")

func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "fadeToBlack":
		Signals.emit_signal("endFadeBlack")
	if anim_name == "fadeToNormal":
		Signals.emit_signal("endFadeNormal")
		hide()
