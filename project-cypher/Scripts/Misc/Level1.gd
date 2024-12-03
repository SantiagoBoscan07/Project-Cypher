extends Node2D

func _ready():
	Signals.connect("levelStart", musicStart)


func musicStart():
	AudioManager.playLevel1()
