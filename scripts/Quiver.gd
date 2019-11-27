extends Node2D

export var arrow = preload("res://scenes/items/arrows/Arrow.tscn")

onready var start_position = $Sprite/StartPosition

var has_arrow = true
var arr

func attack():
	if has_arrow:
		arr = arrow.instance()
		arr.global_position = start_position.global_position
		arr.rotation = start_position.rotation
		has_arrow = false
		get_tree().get_current_scene().add_child(arr)
