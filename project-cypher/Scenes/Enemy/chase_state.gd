extends State
class_name EnemyFollow

var enemy: CharacterBody2D
@export var move_speed := 20.0
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
