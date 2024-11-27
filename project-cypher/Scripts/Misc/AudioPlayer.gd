extends Node

@onready var titleSong: AudioStreamPlayer = $TitleSong


func playTitleTheme():
	titleSong.play()
