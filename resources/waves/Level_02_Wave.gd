class_name Level_02 extends WaveData

func set_wave() -> void:
	wave = [
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 1), 
		], 2),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
		], 30),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
		], 45),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
		], 25),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 3), 
		], 25),
		WaveNode.new([
			WaveUnit.new(golem_data["basic_golem"], 1), 
		], 15),
	]
