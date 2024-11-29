extends Node

@onready var titleSong: AudioStreamPlayer = $TitleSong
@onready var shoot: AudioManagerNode = $Shoot
@onready var dash: AudioManagerNode = $Dash
@onready var heart: AudioManagerNode = $Heart
@onready var menuSelect: AudioManagerNode = $MenuSelect
@onready var hit: AudioManagerNode = $Hit
@onready var hurt: AudioManagerNode = $Hurt
@onready var deathPlayer: AudioStreamPlayer = $DeathPlayer
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
	AudioServer.set_bus_mute(busMusic, true)
	deathPlayer.play()


func _on_death_player_finished():
	AudioServer.set_bus_mute(busMusic, false)
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
