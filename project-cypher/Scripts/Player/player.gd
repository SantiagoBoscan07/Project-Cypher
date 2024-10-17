extends CharacterBody2D

# Store values for the player that are used in other nodes
@export var playerSpeed: int = 50
var lastDirectionFacing: Vector2
var isMoving: bool = false



# Testing Signal, connecting with a custom signal
func _ready():
	Signals.connect("turnOff", test)

# Once the signal is received from emitter, this text is going to be printed in the console
func test():
	print("Signal Received")



	
