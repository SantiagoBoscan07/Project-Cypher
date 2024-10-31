extends Node2D

#Code should inherit Array of Random Number Cypher

var CypherGenerator = RandomNumberGenerator.new()
var cypherArray: Array[int] = [1, 1, 1] #will hold the cypher that gets generated
var cypherDefault: Array[int] = [1, 1, 1] #holds array to check and make sure that cypher does not equal [1, 1, 1]




func _enter_tree():
	#generate 1 number from 1-3 3x. Store each value in array[x,y,z]
	Generate_Numbers()
	
	while (cypherArray == cypherDefault):
		Generate_Numbers()
	
	print(cypherArray)



func Generate_Numbers():
	cypherArray[0] = CypherGenerator.randi_range(1,3)
	cypherArray[1] = CypherGenerator.randi_range(1,3)
	cypherArray[2] = CypherGenerator.randi_range(1,3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
