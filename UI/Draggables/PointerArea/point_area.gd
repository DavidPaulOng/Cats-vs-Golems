extends Node2D

var over_tile: Tile
var cat_scene: PackedScene
var energy_cost: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
 
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not event.pressed and is_instance_valid(over_tile):
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				if GameManager.energy >= energy_cost and (not is_instance_valid(over_tile.occupying_unit)):
					over_tile.occupying_unit = cat_scene.instantiate()
					GameManager.energy -= energy_cost

func _on_area_2d_area_entered(area: Area2D) -> void:
	over_tile = area.get_parent()
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	over_tile = null
