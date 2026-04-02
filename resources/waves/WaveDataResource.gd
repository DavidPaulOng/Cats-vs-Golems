class_name WaveData extends Resource

var wave: Array[WaveNode]
		
var golem_data = {
	"basic_golem": ResourceLoader.load("res://elements/golems/Golem.tscn")
}

func _init():
	set_wave()
	
func set_wave():
	# specify wave in each level sub-class
	pass

func get_node(index: int):
	if wave[index]:
		return wave[index]	
	else:
		return null
