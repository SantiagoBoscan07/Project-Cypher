extends CharacterBody2D

# Store values for the player that are used in other nodes
@export var playerSpeed: int = 50
var lastDirectionFacing: Vector2
var isMoving: bool = false
