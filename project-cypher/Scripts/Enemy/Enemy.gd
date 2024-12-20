extends CharacterBody2D

@export var health: Health
@export var hurtbox: Hurtbox
@export var flash: Flash
var upEntrance: bool = false:
	set(value):
		upEntrance = value
var leftEntrance: bool = false:
	set(value):
		leftEntrance = value
var rightEntrance: bool = false:
	set(value):
		rightEntrance = value
var cornerUpLeftEntrance: bool = false:
	set(value):
		cornerUpLeftEntrance = value
var cornerUpRightEntrance: bool = false:
	set(value):
		cornerUpRightEntrance = value
var cornerDownLeftEntrance: bool = false:
	set(value):
		cornerDownLeftEntrance = value
var cornerDownRightEntrance: bool = false:
	set(value):
		cornerDownRightEntrance = value

func _ready():
	if hurtbox:
		hurtbox.hurt.connect(func(hitbox:Hitbox):
			flash._flash()
			)


func _on_enabler_screen_exited():
	get_tree().call_group("Spawner", "checkEnemy")
	call_deferred("queue_free")
