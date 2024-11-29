extends Label

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player") 

func _ready():
	updateText()
	player.health.connect("health_changed", updateText)
	player.connect("oneMore", lastChanceText)

func updateText():
	if player.health:
		if player.health.health < 0:
			text = str("HP: 0")
		else:
			text = "HP: " + str(player.health.health)

func lastChanceText():
	text = "Last Chance"
