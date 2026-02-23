extends Node2D

@export var entity_scene : PackedScene
@export var spawn_interval : float
@onready var _spawn_timer : Timer = $Timer

func _ready() -> void:
	start_timer()
	
func spawn():
	var new_entity = entity_scene.instantiate()
	add_child(new_entity) #add entity as child of spawner

func _on_timer_timeout() -> void:
	spawn()

func start_timer():	
	_spawn_timer.start(spawn_interval)

func stop_timer():
	_spawn_timer.stop()
