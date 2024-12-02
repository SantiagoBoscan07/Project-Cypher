extends Control

@export var barrier: Sprite2D
@export var clones: Sprite2D
@export var storm: Sprite2D
@export var label: Label
@export var progressBar: TextureProgressBar 
@export var powerUpDuration: Timer
var isCoolingDown: bool = false

func _ready():
	barrier.hide()
	clones.hide()
	storm.hide()
	progressBar.value = 0
	label.text = "Power"
	Signals.connect("activateBarrier", barrierShow)
	Signals.connect("activateClone", clonesShow)
	Signals.connect("startStorm", stormShow)
	Signals.connect("endPowerUp", endShow)
	Signals.connect("powerUpDuration", setTime)

func _process(delta: float):
	if isCoolingDown:
		progressBar.value -= delta

func setTime(time: float):
	powerUpDuration.wait_time = time
	progressBar.max_value = time
	progressBar.value = time
	isCoolingDown = true

func barrierShow():
	label.text = "Barrier"
	barrier.show()

func clonesShow():
	label.text = "Clones"
	clones.show()

func stormShow():
	label.text = "Storm"
	storm.show()

func endShow():
	label.text = "Power"
	storm.hide()
	barrier.hide()
	clones.hide()
