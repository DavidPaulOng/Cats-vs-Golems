class_name Level_02 extends WaveData

@export var _golem_basic_scene: PackedScene:
	set(new_value):
		_golem_basic_scene = new_value
		set_wave()

func set_wave() -> void:
	Wave = [
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 1), 
		], 2),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
		], 30),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
		], 45),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
		], 25),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
		], 25),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 1), 
		], 15),
	]
