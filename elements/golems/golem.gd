class_name Golem extends Node2D

@export var golem_data: GolemData
@onready var _health_label = $HealthLabel
@onready var attack_position = $AttackPosition
@onready var attack_timer = $AttackTimer

var is_attacking: bool = false
var unit_attacked: Cat
var max_health: int
var health :int:
	get: 	
		return health
	set(new_value):
		health = clamp(new_value, 0, max_health)
		update_health_label()
		if health == 0:
			queue_free()
var attack :int
var speed :float
var cooldown: float 
var projectile: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	max_health = golem_data.health
	health = golem_data.health
	attack = golem_data.attack
	cooldown = golem_data.cooldown
	projectile = golem_data.projectile
	speed = golem_data.speed
	update_health_label()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_attacking:
		position.x -= speed

func add_health(difference: int):
	health += difference
	
func update_health_label():
	if not is_instance_valid(_health_label): 
		return
	_health_label.text = str(health) + "/" + str(max_health)	

func _on_attack_position_area_entered(area: Area2D) -> void:
	is_attacking = true
	unit_attacked = area.get_parent()
	attack_timer.start(cooldown)

func _on_attack_timer_timeout() -> void:
	if is_instance_valid(unit_attacked):
		unit_attacked.add_health(-attack)

func _on_attack_position_area_exited(area: Area2D) -> void:
	is_attacking = false
