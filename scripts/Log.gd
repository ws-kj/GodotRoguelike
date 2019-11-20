extends Control

onready var label = $Label
onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	label.get_v_scroll().hide()

func write(text):
	label.show()
	timer.stop()
	label.newline()
	label.add_text(text)
	timer.start()
	

func _on_Timer_timeout():
	label.hide()
	label.text = ""
