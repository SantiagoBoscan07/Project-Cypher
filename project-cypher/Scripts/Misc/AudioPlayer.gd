extends Node

signal golevel1
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


var busMusic
var busSound

func _ready():
	busMusic = AudioServer.get_bus_index("Music")
	busSound = AudioServer.get_bus_index("Sound Effects")

func playTitleTheme():
	titleSong.play()

func stopTitleTheme():
	titleSong.stop()

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
	unmuteMusic()
	Global.isDead = false
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")


func _on_slots_finished():
	Signals.emit_signal("slotsSet")

func muteMusic():
	AudioServer.set_bus_mute(busMusic, true)

func unmuteMusic():
	AudioServer.set_bus_mute(busMusic, false)

func playStartGame():
	startGame.play()

func _on_start_game_finished() -> void:
	emit_signal("golevel1")
