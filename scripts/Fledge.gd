extends "res://scripts/Enemy.gd"

export var speed = 400

var path = []

var player_seen = false
var player
var d
onready var pos = get_parent().global_position.origin
onready var nav = get_parent().get_parent()

func generate_nav():
	print(nav.get_simple_path(pos, player.global_position.origin, true))
	#print(nav.get_node("Floor").find_path(pos, player.global_position))


func _on_ViewArea_body_entered(body):
	if body.is_in_group("Player"):
		player_seen = true
		player = body
		
		generate_nav()
