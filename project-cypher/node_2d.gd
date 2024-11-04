extends Node2D

#Code should inherit Array of Random Number Cypher

var CypherGenerator = RandomNumberGenerator.new()
var cypherArray: Array[int] #will hold the cypher that gets generated
var cypherDefault: Array[int] #holds array to check and make sure that cypher does not equal [1, 1, 1]
@export var arraySize: int = 3
@export var cypherSize: int = 3


func _ready():
	#generate 1 number from 1-3 3x. Store each value in array[x,y,z]
	# Instead of generating numbers in ready, they are going to be generated when the decipher button is pressed
	# Add connectivity with the bar
	for i in arraySize:
		cypherArray.append(1)
		cypherDefault.append(1)
	
	Generate_Numbers()
	while (cypherArray == cypherDefault):
		Generate_Numbers()
	print(cypherArray)



func Generate_Numbers():
	for i in arraySize:
		cypherArray[i] = CypherGenerator.randi_range(1, cypherSize)
