class_name Level_01 extends WaveData

@export var _golem_basic_scene: PackedScene
@export var _not_golem_basic_scene: PackedScene:
	set(new_value):
		_not_golem_basic_scene = new_value
		set_wave()

func set_wave() -> void:
	Wave = [
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 1), 
			WaveUnit.new(_not_golem_basic_scene, 1), 
		], 20),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
		], 30),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
			WaveUnit.new(_not_golem_basic_scene, 1)
		], 45),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
			WaveUnit.new(_not_golem_basic_scene, 1)
		], 25),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 3), 
			WaveUnit.new(_not_golem_basic_scene, 1)
		], 25),
		WaveNode.new([
			WaveUnit.new(_golem_basic_scene, 1), 
		], 15),
	]
