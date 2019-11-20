extends Node2D

export var damage = 2
export var attack_speed = 0.2

onready var anim = $AnimationPlayer
onready var area = $DamageArea

var can_attack = true
var attacking = false
var hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")

func attack():
	if can_attack:
		can_attack = false
		attacking = true
		hit = false

		anim.play("attack")
		yield(get_tree().create_timer(attack_speed), "timeout")
		
		can_attack = true
		attacking = false

func _physics_process(delta):
	for a in area.get_overlapping_bodies():
		if attacking and a.is_in_group("Enemies") and !hit:
			hit = true
			a.take_damage(damage)
			break
