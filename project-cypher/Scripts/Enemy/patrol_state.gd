extends State

#var enemy: CharacterBody2D
#@export var move_speed := 10.0
#var player: CharacterBody2D
@export var area: Area2D
@export var moveSpeed: float = 10.0
@export var enemy: CharacterBody2D


#func _physics_process(delta):
#	move_and_slide()
	
#	if velocity.length() > 0:
#		$AnimationPlayer.play("run")
	
#	if velocity.x > 0:
#		$Sprite.flip_h = false
#	else:
#		$Sprite.flip_h = true
	#pass
	

func _on_detection_radius_area_entered(area: Area2D):
	if area.is_in_group("Detectable"):
		print("Entered")
		changeState()

# make the logic so when it moves around in circles
func physicsUpdate(_delta: float):
	pass

# change state
func changeState():
	pass
