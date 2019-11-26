extends KinematicBody2D

onready var sprite = $Sprite
onready var anim = $AnimationPlayer
onready var weapon_position = $WeaponPosition

export var hp = 10



export var base_speed = 100
export var speed_multiplier = 3.5
var speed = base_speed * speed_multiplier

onready var weapon_distance = weapon_position.position.length()

var vel = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	process_movement(delta)
	process_attack()
	move_weapon()
	
func process_movement(delta):
	vel = Vector2()
	speed = base_speed * speed_multiplier
	
	if Input.is_action_pressed("move_forward"):
		vel.y -= 1
	if Input.is_action_pressed("move_backward"):
		vel.y += 1
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		sprite.scale.x = -4
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		sprite.scale.x = 4
	
	if vel != Vector2():
		anim.play("walk")
	else:
		anim.play("idle")
	
	vel = vel.normalized() * speed
	vel = move_and_slide_with_snap(vel, Vector2(4, 4))
	
func move_weapon():
	var angle = get_local_mouse_position().angle()
	weapon_position.position.x = cos(angle) * weapon_distance
	weapon_position.position.y = sin(angle) * weapon_distance
	weapon_position.rotation = angle
	
func process_attack():
	if Input.is_action_just_pressed("attack"):
		if weapon_position.get_children() != []:
			weapon_position.get_child(0).attack()