extends Node2D

@export_category("Timer")
@export var spawnTime:float = 1.0
@export var spawnerDuration: float
@export_category("Object")
@export var objectToSpawn: PackedScene
@export_category("Location")
@export var marker: Marker2D
@export_category("Entry State [Only Mark One]")
@export var spawnUp: bool = false
@export var spawnleft: bool = false
@export var spawnRight: bool = false
@export var cornerUpLeft: bool = false
@export var cornerUpRight: bool = false
@export var cornerDownLeft: bool = false
@export var cornerDownRight: bool = false
@export_category("Wave Manager")
@export var nextWave: Array[Node2D]
@export var spawnTimer: Timer
@export var spawnerDurationTimer: Timer
@export var spawnerNode: SpawnerNode
@export var isFirst: bool
@export var isLast: bool
@export var isSubet: bool = false
@export var isCountable: bool = false
@export var spawnerSubset: Array[Node2D]
var entrance
var enemyCount: int = 0:
	set(value):
		enemyCount = value
var isFinished: bool = false

# Set the spawn time and duration of spawner
# Gets count of enemies in wave
# Activates only first spawner, others are activated when first is done
# Starts timer for spawner time and duration
func _ready():
	spawnTimer.wait_time = spawnTime
	spawnerDurationTimer.wait_time = spawnerDuration
	enemyCounter()
	if !isFirst:
		process_mode = 4
	spawnerDurationTimer.start()
	spawnTimer.start()

# Handles Position where enemies spawn
func handleSpawn(object: PackedScene):
	spawnerNode.scene = object
	if spawnUp:
		entrance = 0
	elif spawnleft:
		entrance = 1
	elif spawnRight:
		entrance = 2
	elif cornerUpLeft:
		entrance = 3
	elif cornerUpRight:
		entrance = 4
	elif cornerDownLeft:
		entrance = 5
	elif cornerDownRight:
		entrance = 6
	if marker:
		spawnerNode.spawn(entrance, marker.global_position)
	else:
		print("Marker has not been set")

# Checks how many enemies left on the wave before moving to next wave
func checkEnemy():
	if isFinished:
		return
	if isCountable:
		enemyCount = enemyCount - 1
	#print(name)
	#print(enemyCount)
	if enemyCount <= 0:
		isFinished = true
		if nextWave and !isLast:
			for wave in nextWave:
				wave.process_mode = 0
				wave.add_to_group("Spawner")
				wave.add_to_group("Enemy")
		elif nextWave and isLast:
			for wave in nextWave:
				wave.endLevel()
			call_deferred("queue_free")

# Counts how many enemies does the wave have
func enemyCounter():
	if isSubet:
		for wave in spawnerSubset:
			enemyCount += wave.enemyCount
			#print(enemyCount)
	else:
		enemyCount = spawnerDuration / spawnTime
	#print(enemyCount)

# After the timer for spawn time runs out, it spawns en enemy
func _on_spawn_timer_timeout():
	if objectToSpawn:
		handleSpawn(objectToSpawn)

# After the duration of the wave, it stops spawning enemies
func _on_spawn_duration_timeout():
	spawnTimer.stop()
	#if nextWave:
		#nextWave.process_mode = 0
	#call_deferred("queue_free")
