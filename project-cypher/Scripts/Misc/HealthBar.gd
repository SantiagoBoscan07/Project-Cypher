extends Node

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player") 
@export var arrayHeart: Array[Sprite2D]
@export var lastChance: Sprite2D
var heart
func _ready():
	get_tree().paused = true
	for heart in arrayHeart:
		AudioManager.playHeart()
		heart.show()
		await get_tree().create_timer(0.25).timeout
	get_tree().paused = false
	if player:
		player.health.connect("health_changed", updateHeart)
		player.health.connect("no_health", die)

func updateHeart():
	if arrayHeart.size() > 1:
		popHeart()
	else:
		arrayHeart[0].fastShake()
		lastChance.show()

func die():
	popHeart()
	lastChance.hide()

func popHeart():
	arrayHeart.pop_back().hide()
