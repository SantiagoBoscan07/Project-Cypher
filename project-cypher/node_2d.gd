extends Node2D

#Code should inherit Array of Random Number Cypher

var CypherGenerator = RandomNumberGenerator.new()
var cypherArray: Array[int] = [1, 1, 1] #will hold the cypher that gets generated
var cypherDefault: Array[int] = [1, 1, 1] #holds array to check and make sure that cypher does not equal [1, 1, 1]




func _ready():
	#generate 1 number from 1-3 3x. Store each value in array[x,y,z]
	# Instead of generating numbers in ready, they are going to be generated when the decipher button is pressed
	# Add connectivity with the bar
	Generate_Numbers()
	while (cypherArray == cypherDefault):
		Generate_Numbers()
	print(cypherArray)



func Generate_Numbers():
	cypherArray[0] = CypherGenerator.randi_range(1,3)
	cypherArray[1] = CypherGenerator.randi_range(1,3)
	cypherArray[2] = CypherGenerator.randi_range(1,3)
