extends CanvasLayer

func _ready():
	visible = false
	Signals.connect("toggleShader", toggle)

func toggle():
	visible = !visible
