class_name WaveData extends Resource

var Wave: Array[WaveNode]
	
func get_node(index: int):
	if Wave[index]:
		return Wave[index]	
	else:
		return null
