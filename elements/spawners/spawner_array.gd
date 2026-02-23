extends Node2D

@export var wave: WaveData
@onready var _positions = $Positions
var wave_node_count = 0

func _ready() -> void:
	_ready_next_node()
	
func _ready_next_node():
	# stop if ran out of nodes
	if wave_node_count == len(wave.Wave):
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
			new_spawn.position = random_position.position
			add_child(new_spawn)
			# wait so not everything gets spawned at once
			await get_tree().create_timer(1).timeout
			
	_ready_next_node()
	
		
		
