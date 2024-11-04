extends Control

@export var barTimer : Timer
@export var waitTime : float = 10.0
var inputPressed : bool = false

#function that starts a timer
#function if you press the decypher mode, is going to activate (for testing, just print(cypher activated))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# FIXME: Add way for timer to know when to start
	barTimer.start()

func _process(delta):
	if waitTime > 0:
		#print(waitTime)
		waitTime -= delta
		
	if Input.is_action_just_pressed("decipher") and inputPressed:
		print("Cypher Activated!")
		inputPressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_decipher_bar_timer_timeout() -> void:
	print("Time out!")
	inputPressed = true