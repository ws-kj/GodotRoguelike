extends Control

onready var hp = get_parent().get_parent().get_node("Player").hp
var max_hp = hp
onready var container = $HBoxContainer
var heart = preload("res://scenes/Heart.tscn")

func _ready():
	var tmp = hp
	
	if tmp % 2 != 0:
		tmp -= 1
		while tmp > 0:
			var h = heart.instance()
			if tmp % 2 == 0:
				h.texture = load("res://assets/ui/full_heart.png")
				tmp -= 2
			container.add_child(h)
		
		var h = heart.instance()
		h.texture = load("res://assets/ui/half_heart.png")
		container.add_child(h)
	else:
		while tmp > 0:
			var h = heart.instance()
			if tmp % 2 == 0:
				h.texture = load("res://assets/ui/full_heart.png")
				tmp -= 2
				container.add_child(h)

func _process(delta):
	hp = get_parent().get_parent().get_node("Player").hp
	
	for i in range(0, container.get_child_count()):
		container.get_child(i).queue_free()
	
	var tmp = hp
	
	if tmp % 2 != 0:
		tmp -= 1
		while tmp > 0:
			var h = heart.instance()
			if tmp % 2 == 0:
				h.texture = load("res://assets/ui/full_heart.png")
				tmp -= 2
			container.add_child(h)
		
		var h = heart.instance()
		h.texture = load("res://assets/ui/half_heart.png")
		container.add_child(h)
	else:
		while tmp > 0:
			var h = heart.instance()
			if tmp % 2 == 0:
				h.texture = load("res://assets/ui/full_heart.png")
				tmp -= 2
				container.add_child(h)
		
