extends Node2D

export var texture = preload("res://assets/icons/quiver_basic.png")
export var item_name = "quiver"

onready var inv = get_tree().get_current_scene().get_node("UI").get_node("Inventory")
onready var game_log = get_tree().get_current_scene().get_node("UI").get_node("Log")

func _ready():
	$Sprite.texture = texture

func _process(delta):
	for b in $Area2D.get_overlapping_bodies():
		if b.is_in_group("Player"):
			if Input.is_action_pressed("interact"):
				inv.pickup_item(item_name)
				game_log.write("Picked up " + item_name)
				queue_free()
