extends Control

@export var musicSlider: HSlider
@export var soundSlider: HSlider
var busMusic: int
var busSound: int

func _ready():
	busMusic = AudioServer.get_bus_index("Music")
	busSound = AudioServer.get_bus_index("Sound Effects")
	musicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(busMusic))
	soundSlider.value = db_to_linear(AudioServer.get_bus_volume_db(busSound))

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busMusic, linear_to_db(value))


func _on_sound_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(busSound, linear_to_db(value))
