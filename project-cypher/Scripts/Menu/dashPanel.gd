extends Control

@onready var player = get_tree().get_first_node_in_group("Player") 
@export var progressBar: TextureProgressBar
@export var cooldownTimer: Timer
@export var fillingTimer: Timer
var fillTime = 0
var isCoolingDown: bool
var isFilling: bool
var cooldownProgress = 0
var fillProgress = 0

func _ready():
	progressBar.value = 0
	Signals.dashProgress.connect(valueUpdate)
	Signals.dashCooldownProgress.connect(cooldownUpdate)

func _process(delta):
	if isCoolingDown:
		progressBar.value -= delta
	elif isFilling:
		progressBar.value += delta

func cooldownUpdate(time):
	progressBar.max_value = time
	progressBar.value = progressBar.max_value
	isCoolingDown = true
	isFilling = false

func valueUpdate(time):
	progressBar.max_value = time 
	progressBar.value = 0
	isFilling = true
	isCoolingDown = false
 
