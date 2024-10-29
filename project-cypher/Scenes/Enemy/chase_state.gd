extends State
class_name EnemyFollow

#Refrence to the enemy
@export var enemy: CharacterBody2D
#Movement speed of the enemy 
@export var move_speed := 100.0
@export var player: CharacterBody2D
#Refrence to the player
@export var desiredSpeed: Vector2
@export var maxSpeedChange: float

func Enter():
#	player = get_tree().get_first_node_in_group("Player")
#	if not player:
#		print("Player not found!")
	pass

func physicsUpdate(_delta: float):
	enemy.velocity.x = move_toward(enemy.position.x,player.global_position.x, 1)
	enemy.velocity.y = move_toward(enemy.position.y, player.global_position.y, 1)
	enemy.move_and_slide()


func Physics_Update(delta: float):
	#var direction = player.global_position - enemy.global_position
	
	#if direction.length() > 25:
	#	enemy.velocity = direction.normalized() * move_speed
	#else:
	#	enemy.velocity = Vector2()
	pass
