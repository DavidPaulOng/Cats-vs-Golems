class_name Cat extends Node

@export var cat_data: Resource
@onready var _sprite = $Sprite2D
@onready var _health_label = $HealthLabel
var max_health: int
var health :int:
	get: 	
		return health
	set(new_value):
		health = clamp(new_value, 0, max_health)
		update_health_label()
		if health == 0:
			queue_free()
var attack: int
var cooldown: float 
var projectile: PackedScene

func _ready():
	max_health = cat_data.health
	health = cat_data.health
	attack = cat_data.attack
	cooldown = cat_data.cooldown
	projectile = cat_data.projectile
	update_health_label()
		
func add_health(difference: int):
	health += difference

func update_health_label():
	if not is_instance_valid(_health_label): 
		return
	_health_label.text = str(health) + "/" + str(max_health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
