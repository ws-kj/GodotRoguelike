extends Node2D

export var text = ""

onready var game_log = get_tree().get_current_scene().get_node("Player").get_node("UI").get_node("Log")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		draw_sign(text)
		

		
func draw_sign(txt):
	print(txt)
	game_log.write(txt)


func _on_Area2D_body_exited(body):
		if body.is_in_group("Player"):
			draw_sign("")