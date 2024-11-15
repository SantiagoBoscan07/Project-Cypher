extends State

@export var area: Area2D
@export var moveSpeed: float = 10.0
@export var enemy: CharacterBody2D
@export var markerarr: Array[Marker2D]
@export var shufflePosTimer: Timer
var index = 0:
	set(value):
		index = value
var markerPos
var targetPos

# If the player enteres the radius, then it changes to chase state
func _on_detection_radius_area_entered(area: Area2D):
	if area.is_in_group("Detectable"):
		#print("Entered")
		changeState()

# make the logic so when it moves around in circles
func physicsUpdate(_delta: float):
	if markerarr:
		markerPos = markerarr[index].global_position
		targetPos = (markerPos - enemy.position).normalized()
		if enemy.position.distance_to(markerPos) > 5:
			enemy.position += targetPos * moveSpeed * _delta
		enemy.move_and_slide()

# change state
func changeState():
	stateTransition.emit(get_parent().currentState, "ChaseState")

# changes index of marker
func changeIndex():
	match index:
		0:
			index = 1
		1:
			index = 2
		2:
			index = 0

# after timer runs out it shuffles index
func _on_shuffle_position_timeout():
	shufflePosTimer.start()
	changeIndex()
