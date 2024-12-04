extends Control

func _ready():
	get_tree().paused = true
	Signals.connect("endFadeNormal", startMenu)
	TransitionScreen.fadeToNormal()




func startMenu():
	get_tree().paused = false
	AudioManager.playTitleTheme()
	Signals.disconnect("endFadeNormal", startMenu)
