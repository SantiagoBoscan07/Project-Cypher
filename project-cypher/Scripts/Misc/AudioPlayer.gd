extends Node

@onready var titleSong: AudioStreamPlayer = $TitleSong
@onready var shoot: AudioManagerNode = $Shoot
@onready var dash: AudioManagerNode = $Dash
@onready var heart: AudioManagerNode = $Heart
@onready var menuSelect: AudioManagerNode = $MenuSelect
@onready var hit: AudioManagerNode = $Hit


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
