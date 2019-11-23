extends Node2D

export var texture = preload("res://assets/icons/dagger.png")
export var item_name = "dagger"

onready var inv = get_tree().get_current_scene().get_node("UI").get_node("Inventory")

func _ready():
	$Sprite.texture = texture

func _process(delta):
	for b in $Area2D.get_overlapping_bodies():
		if b.is_in_group("Player"):
			if Input.is_action_pressed("interact"):
				inv.pickup_item(item_name)
				queue_free()
