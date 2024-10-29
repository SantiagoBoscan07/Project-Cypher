extends State
class_name EnemyFollow

#Reference to the enemy
@export var enemy: CharacterBody2D
#Movement speed of the enemy 
@export var moveSpeed := 30.0
#Reference to the player
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
# A variable that is storing the position of player
var playerPos
# A variable that is storing the position where the enemy is going to move
var targetPos


func Enter():
	if not player:
		print("Player not found!")


func physicsUpdate(_delta: float):
	if player:
		playerPos = player.position
		targetPos = (playerPos - enemy.position).normalized()
		if enemy.position.distance_to(playerPos) > 3:
			enemy.position += targetPos * moveSpeed * _delta
