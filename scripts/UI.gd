extends CanvasLayer

var inv_open = false
onready var inv = $Inventory

func _process(delta):
	if Input.is_action_just_pressed("inv_open"):
		if inv_open:
			inv.hide()
			inv_open = false
		else:
			inv.show()
			inv_open = true
