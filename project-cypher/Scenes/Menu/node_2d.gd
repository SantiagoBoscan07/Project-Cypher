extends Node2D

@export var barTimer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("endPowerUp", endPowerUp)

func endPowerUp():
	barTimer.start()
	
