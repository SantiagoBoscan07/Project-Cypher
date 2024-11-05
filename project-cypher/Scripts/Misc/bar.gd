extends Control

@export var barTimer : Timer
@export var waitTime : float = 10.0
@export var progressBar: TextureProgressBar
var enemies
var inputPressed : bool = false
var RandomPowerUp = RandomNumberGenerator.new()
var powerInt: int
var isFilling: bool


func _ready() -> void:
	# FIXME: Add way for timer to know when to start
	Signals.connect("endPowerUp", endPowerUp)
	progressBar.max_value = barTimer.wait_time
	progressBar.value = barTimer.wait_time
	barTimer.start()
	isFilling = true

func _process(delta):
	if isFilling:
		progressBar.value -= delta
	if Input.is_action_pressed("decipher") and inputPressed:
		#print("Cypher Activated!")
		# for showcase demo, select random number 1-3 and activate corresponding powerup
		enemies = get_tree().get_nodes_in_group("Enemy")
		for enemy in enemies:
			enemy.call_deferred("queue_free")
		powerInt = RandomPowerUp.randi_range(1, 3)
		match powerInt:
			1: barrier()
			2: clone()
			3: storm()
		progressBar.value = progressBar.max_value
		inputPressed = false

func _on_decipher_bar_timer_timeout() -> void:
	isFilling = false
	inputPressed = true

# If the button is pressed, the barrier will show up
func barrier() -> void:
	Signals.emit_signal("activateBarrier")

# If the button is pressed, the clones will show up
func clone() -> void:
	Signals.emit_signal("activateClone")

# If the button is pressed, the projectiles will show up
func storm() -> void:
	Signals.emit_signal("startStorm")

func endPowerUp():
	progressBar.max_value = barTimer.wait_time
	progressBar.value = barTimer.wait_time
	isFilling = true
	barTimer.start()
