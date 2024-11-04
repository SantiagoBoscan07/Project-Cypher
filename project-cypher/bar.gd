extends Control

@export var barTimer : Timer
@export var waitTime : float = 10.0
var inputPressed : bool = false
var RandomPowerUp = RandomNumberGenerator.new()
var powerInt: int

#function that starts a timer
#function if you press the decypher mode, is going to activate (for testing, just print(cypher activated))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# FIXME: Add way for timer to know when to start
	barTimer.start()

func _process(delta):
	if Input.is_action_just_pressed("decipher") and inputPressed:
		print("Cypher Activated!")
		# for showcase demo, select random number 1-3 and activate corresponding powerup
		powerInt = RandomPowerUp.randi_range(1, 3)
		match powerInt:
			1: barrier()
			2: clone()
			3: storm()
		
		inputPressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_decipher_bar_timer_timeout() -> void:
	print("Time out!")
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
