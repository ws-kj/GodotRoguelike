extends Node2D

export var arrow = preload("res://scenes/items/arrows/Arrow.tscn")

onready var start_position = $Sprite/StartPosition

var has_arrow = true
var arr

var check_pickup = false

func attack():
	if has_arrow:
		arr = arrow.instance()
		arr.global_position = start_position.global_position
		arr.rotation = start_position.rotation
		has_arrow = false
		get_tree().get_current_scene().add_child(arr)
		check_pickup  = false
		yield(get_tree().create_timer(1), "timeout")
		check_pickup = true


func _on_Area2D_area_entered(body):
	print(body)
	if body.get_parent() == arr and check_pickup:
		body.get_parent().deactivate(get_parent().get_parent())