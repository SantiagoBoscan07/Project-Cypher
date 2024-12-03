extends Node

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player") 
@export var arrayHeart: Array[Sprite2D]
@export var lastChance: Sprite2D
@export var lowHealthTimer: Timer
var heart
func _ready():
	get_tree().paused = true
	for heart in arrayHeart:
		AudioManager.muteMusic()
		AudioManager.playHeart()
		heart.show()
		await get_tree().create_timer(0.25).timeout
	get_tree().paused = false
	AudioManager.unmuteMusic()
	if player:
		player.health.connect("health_changed", updateHeart)
		player.health.connect("no_health", die)

func updateHeart():
	if arrayHeart.size() > 1:
		popHeart()
	else:
		lowHealthTimer.start()
		arrayHeart[0].fastShake()
		lastChance.show()

func die():
	lowHealthTimer.stop()
	popHeart()
	lastChance.hide()

func popHeart():
	arrayHeart.pop_back().hide()


func _on_low_health_timeout():
	AudioManager.playLowHealth()
