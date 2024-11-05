extends Node2D

@export_category("Timer")
@export var spawnTime:float = 1.0
@export var spawnerDuration: float
@export_category("Object")
@export var objectToSpawn: PackedScene
@export_category("Location")
@export var spawnUp: bool = false
@export var spawnleft: bool = false
@export var spawnRight: bool = false
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
	if spawnUp:
		spawnerNode.spawn(0, Vector2(randf_range(30,448),0))
	elif spawnleft:
		spawnerNode.spawn(1, Vector2(0,randf_range(32,176)))
	elif spawnRight:
		spawnerNode.spawn(2, Vector2(448,randf_range(32,176)))


func _on_spawn_timer_timeout() -> void:
	if objectToSpawn:
		handleSpawn(objectToSpawn)


func _on_spawn_duration_timeout() -> void:
	spawnTimer.stop()
	if nextWave:
		nextWave.process_mode = 0
	call_deferred("queue_free")
