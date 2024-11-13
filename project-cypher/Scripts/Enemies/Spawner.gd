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
@export var nextWave: Array[Node2D]
@export var spawnTimer: Timer
@export var spawnerDurationTimer: Timer
@export var spawnerNode: SpawnerNode
@export var isFirst: bool
@export var isSubet: bool = false
@export var spawnerSubset: Array[Node2D]
var enemyCount: int = 0:
	set(value):
		enemyCount = value
var isFinished: bool = false

func _ready():
	spawnTimer.wait_time = spawnTime
	spawnerDurationTimer.wait_time = spawnerDuration
	enemyCounter()
	if !isFirst:
		process_mode = 4
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

func checkEnemy():
	if isFinished:
		return
	enemyCount = enemyCount - 1
	#print(name)
	#print(enemyCount)
	if enemyCount <= 0:
		isFinished = true
		if nextWave:
			for wave in nextWave:
				wave.process_mode = 0
				wave.add_to_group("Spawner")
				wave.add_to_group("Enemy")
			call_deferred("queue_free")

func enemyCounter():
	if isSubet:
		for wave in spawnerSubset:
			enemyCount += wave.enemyCount
			#print(enemyCount)
	else:
		enemyCount = spawnerDuration / spawnTime
	#print(enemyCount)

func _on_spawn_timer_timeout() -> void:
	if objectToSpawn:
		handleSpawn(objectToSpawn)


func _on_spawn_duration_timeout() -> void:
	spawnTimer.stop()
	#if nextWave:
		#nextWave.process_mode = 0
	#call_deferred("queue_free")
