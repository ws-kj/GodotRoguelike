extends KinematicBody2D

onready var player = get_parent().get_node("Player")

onready var anim = $AnimationPlayer
onready var light = $Light2D

var fallen = false
var active = true

export var damage = 2
export var attack_speed = 0.5
export var view_range = 400

var can_attack = true

export var speed = 650
var vel = Vector2()

func _ready():
	activate()

func _physics_process(delta):
	if active:
		if not fallen:
			move()
			check_fall()
			
func check_fall():
	if abs(get_global_mouse_position().x - global_position.x) < 3 and \
		abs(get_global_mouse_position().y - global_position.y) < 3:
		fall()
		
	if abs(player.global_position.x - global_position.x) > view_range and \
		abs(player.global_position.y - global_position.y) > view_range:
			fall()
			
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
			anim.play("Inactive")
			light.hide()
			yield(get_tree().create_timer(attack_speed), "timeout")
			anim.play("Active")
			light.show()
			can_attack = true
		elif body.is_in_group("Player"):
			deactivate(body)
		elif body.is_in_group("Obstacles"):
			fall()
			
func fall():
	fallen = true
	can_attack = false
	light.hide()
	anim.play("Fallen")
	
func activate():
	active = true
	can_attack = true
	anim.play("Active")
	light.show()
	show()
	
func deactivate(player):
	active = false
	can_attack = false
	
	player.get_node("WeaponPosition").get_child(0).has_arrow = true
	light.hide()
	hide()
	queue_free()