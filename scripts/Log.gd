extends Control

onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func write(text, wait=false):
	label.text = text
	if wait:
		yield(get_tree().create_timer(5), "timeout")
		label.text = ""