extends Node
class_name PositionClamp

@export var body: CharacterBody2D
@export var margin = 32

var left_border = 0
var right_border = 448
var bottom_border = 238
var top_border = 0

func _process(delta):
	if body:
		body.global_position.x = clamp(body.global_position.x, left_border + margin, right_border - margin)
		body.global_position.y = clamp(body.global_position.y, top_border + margin, bottom_border - margin)
