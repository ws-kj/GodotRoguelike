extends Node2D

export var max_hp = 6
var hp = max_hp
export var show_hp = true

var bar

# Called when the node enters the scene tree for the first time.
func _ready():
	if show_hp:
		bar = $HealthBar/TextureProgress
		bar.hide()
		
func take_damage(dmg):
	bar.show()
	hp -= dmg
	print(name + " took " + String(dmg) + " damage.")
	print(name + " has " + String(hp) + " hp.")
	
	if show_hp:
		bar.set_value((float(hp) / max_hp) * 100)
		
	custom_damage(dmg)
	
	if hp <= 0:
		die()
		
func die():
	print(name + " is dead.")
	queue_free()
	
func custom_damage(dmg):
	pass
	