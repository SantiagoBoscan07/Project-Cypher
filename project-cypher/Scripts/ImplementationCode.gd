extends Node

var cypherarray = [1, 2, 3]

func setCypherArray(index, value):
	cypherarray[index] = value
func getCypherArray(index):
	return cypherarray[index]
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
