class_name WaveUnit extends Resource
# A unit and the amount to be spawned in a single WaveNode
var unit
var amount
func _init(_unit:PackedScene, _amount: float):
	unit = _unit
	amount = _amount
