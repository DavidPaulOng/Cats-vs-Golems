class_name Level extends Node2D

@onready var _positions = $SpawnerArray/Positions
@onready var _spawner = $SpawnerArray
@onready var _game_over_screen = $CanvasLayer/GameOverScreen
@export var wave: WaveData
var wave_node_count = 0

func _ready() -> void:
	GameManager.reset_level_data()
	_ready_next_node()
	
func _ready_next_node():
	# stop if ran out of nodes
	if wave_node_count == len(wave.wave)-1:
		#_next_level()
		return
	# wait for the cooldown of the wave node
	var wave_node = wave.get_node(wave_node_count)
	await get_tree().create_timer(wave_node.cooldown).timeout
	# process the node
	_spawn_wave_node(wave_node)
	wave_node_count += 1
		
func _spawn_wave_node(node: WaveNode):
	#instantiate the enemies
	for u in node.wave_units:
		var unit = u.unit
		var amount = u.amount
		for i in range(amount):
			# spawn units in random positions
			var random_position = _positions.get_children().pick_random()
			var new_spawn = unit.instantiate()
			add_child(new_spawn)
			new_spawn.reparent(_spawner)
			new_spawn.position = random_position.position
			# wait so not everything gets spawned at once
			await get_tree().create_timer(1).timeout
			
	_ready_next_node()
	
func _next_level():
	get_tree().change_scene_to_file("res://screens/Levels/LEVEL_02.tscn")

func _on_dead_zone_area_entered(area: Area2D) -> void:
	_game_over_screen.visible = true
	#get_tree().change_scene_to_file("res://screens/game_over.tscn")
