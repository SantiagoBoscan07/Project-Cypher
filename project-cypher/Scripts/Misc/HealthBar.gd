extends Node

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player") 
var arrayHeart
var heart
func _ready():
	get_tree().paused = true
	arrayHeart = get_children()
	for heart in arrayHeart:
		AudioManager.playHeart()
		heart.show()
		await get_tree().create_timer(0.25).timeout
	get_tree().paused = false
	if player:
		player.health.connect("health_changed", updateHeart)
		player.connect("oneMore", lastChance)

func updateHeart():
	if arrayHeart.size() > 1:
		arrayHeart.pop_back().hide()
	else:
		arrayHeart[0].fastShake()

func lastChance():
	pass
