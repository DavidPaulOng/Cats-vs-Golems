class_name Tile extends Node2D

var _mouse_entered: bool = false
var occupying_unit: Node2D

func _input(event):
	# add unit to tile if not occupied
	var current_card = GameManager.currently_dragged_card 
	if event is InputEventMouseButton and not event.pressed:
		if occupying_unit == null and current_card != null and _mouse_entered == true:
			match event.button_index:
				MOUSE_BUTTON_LEFT:
					print(GameManager.energy)
					print(current_card.cat_data.energy_cost)
					if GameManager.energy >= current_card.cat_data.energy_cost:
						occupying_unit = current_card.cat_scene.instantiate()
						GameManager.energy -= current_card.cat_data.energy_cost
						add_child(occupying_unit)
					
					GameManager.currently_dragged_card = null
					GameManager.currently_dragged_unit_scene = null

func _on_area_2d_mouse_entered() -> void:
	_mouse_entered = true
	GameManager.mouse_is_on_tile = true
		
func _on_area_2d_mouse_exited() -> void:
	_mouse_entered = false
	GameManager.mouse_is_on_tile = false
