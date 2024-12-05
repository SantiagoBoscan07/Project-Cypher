extends Node2D

func _ready():
	get_tree().paused = true
	TransitionScreen.fadeToNormal()
	Signals.connect("levelStart", musicStart)


func musicStart():
	AudioManager.playLevel3()
