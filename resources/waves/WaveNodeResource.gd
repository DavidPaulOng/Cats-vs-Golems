class_name WaveNode extends Resource
# A wave has multiple steps where units spawn
# each step is called a node
# a node can contain multiple Units
var wave_units
var cooldown # how long to wait before this node starts
func _init(_wave_units: Array[WaveUnit], _cooldown: float) -> void:
	wave_units = _wave_units
	cooldown = _cooldown
