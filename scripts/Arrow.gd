extends KinematicBody2D

onready var player = get_parent().get_node("Player")

export var fallen = false
export var active = true
export var damage = 2

export var attack_speed = 0.5

var can_attack = true

export var speed = 400
var vel = Vector2()

func _physics_process(delta):
	if active:
		if not fallen:
			move()
			
func move():
	vel = Vector2()
	look_at(get_global_mouse_position())
	vel = Vector2(speed, 0).rotated(rotation)
	vel = move_and_slide(vel)
		
func _on_Area2D_body_entered(body):
	if active:
		if body.is_in_group("Enemies") and can_attack:
			body.take_damage(damage)
			can_attack = false
			yield(get_tree().create_timer(attack_speed), "timeout")
			can_attack = true
		if body.is_in_group("Player"):
			deactivate()
		if body.is_in_group("Obstacles"):
			fall()
			
func fall():
	fallen = true
	can_attack = false
	
func activate():
	active = true
	can_attack = true
	show()
	
func deactivate():
	active = false
	can_attack = false
	hide()