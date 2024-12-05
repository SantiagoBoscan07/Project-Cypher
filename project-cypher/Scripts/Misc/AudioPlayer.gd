extends Node

@onready var titleSong: AudioStreamPlayer = $TitleSong
@onready var shoot: AudioManagerNode = $Shoot
@onready var dash: AudioManagerNode = $Dash
@onready var heart: AudioManagerNode = $Heart
@onready var menuSelect: AudioManagerNode = $MenuSelect
@onready var hit: AudioManagerNode = $Hit
@onready var hurt: AudioManagerNode = $Hurt
@onready var deathPlayer: AudioStreamPlayer = $DeathPlayer
@onready var lowHealth: AudioManagerNode = $LowHealth
@onready var slots: AudioManagerNode = $Slots
@onready var startGame: AudioManagerNode = $StartGame
@onready var meow: AudioManagerNode = $Meow
@onready var bomb: AudioManagerNode = $Bomb
@onready var stormPlayer: AudioManagerNode = $StormPlayer
@onready var stormEnemy: AudioManagerNode = $StormEnemy
@onready var powerup: AudioManagerNode = $Powerup
@onready var powerdown: AudioManagerNode = $Powerdown
@onready var enemyDeath: AudioManagerNode = $EnemyDeath
@onready var level1: AudioStreamPlayer = $Level1
@onready var transition: AudioManagerNode = $Transition
@onready var levelComplete: AudioManagerNode = $LevelComplete
@onready var level2: AudioStreamPlayer = $Level2



var busMusic
var busSound

func _ready():
	busMusic = AudioServer.get_bus_index("Music")
	busSound = AudioServer.get_bus_index("Sound Effects")

func playTitleTheme():
	titleSong.play()

func playShoot():
	shoot.play_with_variance()

func playDash():
	dash.play_with_variance()

func playHeart():
	heart.play_with_variance()

func playMenuSelect():
	menuSelect.play_with_variance()

func playHit():
	hit.play_with_variance()

func playHurt():
	hurt.play_with_variance()

func playDeathPlayer():
	muteMusic()
	deathPlayer.play()

func playLowHealth():
	lowHealth.play_with_variance()

func playSlotSet():
	slots.play_with_variance()

func _on_death_player_finished():
	Signals.emit_signal("gameOverScreen")


func _on_slots_finished():
	Signals.emit_signal("slotsSet")

func muteMusic():
	var sounds = get_children()
	for sound in sounds:
		if sound.get_bus() == "Music" and sound.is_playing():
			sound.stop()

func playStartGame():
	startGame.play()

func playMeow():
	meow.play_with_variance()

func playBomb():
	bomb.play_with_variance()

func playStormPlayer():
	stormPlayer.play_with_variance()

func playStormEnemy():
	stormEnemy.play_with_variance()

func playPowerup():
	powerup.play_with_variance()

func playPowerDown():
	powerdown.play_with_variance()

func playEnemyDeath():
	enemyDeath.play_with_variance()

func playLevel1():
	level1.play()

func playTransition():
	transition.play_with_variance()

func playLevelComplete():
	levelComplete.play_with_variance()

func playLevel2():
	level2.play()
