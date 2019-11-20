extends Node2D

export var max_hp = 1
var hp = max_hp
export var show_hp = true

export var pub_name = ""

var bar

onready var game_log = get_tree().get_current_scene().get_node("Player").get_node("UI").get_node("Log")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if show_hp:
		bar = $HealthBar/TextureProgress
		bar.hide()


func take_damage(dmg):
	bar.show()
	hp -= dmg
	game_log.write(pub_name + " took " + String(dmg) + " damage.")
	
	if show_hp:
		bar.set_value((float(hp) / max_hp) * 100)
		
	custom_damage(dmg)
	
	if hp <= 0:
		die()
		
func die():
	game_log.write(pub_name + " is dead.")
	queue_free()
	
func custom_damage(dmg):
	pass
	