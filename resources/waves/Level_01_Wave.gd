class_name Level_01 extends WaveData

func set_wave() -> void:
	wave = [
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 1), 
			WaveUnit.new(golem_data["basic_golem"], 1), 
		], 1),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
		], 1),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
			WaveUnit.new(golem_data["basic_golem"], 1)
		], 1),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
			WaveUnit.new(golem_data["basic_golem"], 1)
		], 1),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
			WaveUnit.new(golem_data["basic_golem"], 1)
		], 1),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 1), 
		], 1),
	]
