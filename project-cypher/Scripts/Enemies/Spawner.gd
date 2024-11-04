extends Node2D

@export_category("Timer")
@export var spawnTime:float
@export var spawnerDuration: float
@export_category("Object")
@export var objectToSpawn: PackedScene
@export_category("Location")
@export var location: Marker2D
@export_category("Wave Manager")
@export var nextWave: Node2D
@export var spawnTimer: Timer
@export var spawnerDurationTimer: Timer
@export var spawnerNode: SpawnerNode

func _ready():
	spawnTimer.wait_time = spawnTime
	spawnerDurationTimer.wait_time = spawnerDuration
	spawnerDurationTimer.start()
	spawnTimer.start()

func handleSpawn(object: PackedScene):
	spawnerNode.scene = object
	spawnerNode.spawn(location.position)
