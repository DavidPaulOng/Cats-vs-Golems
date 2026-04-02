class_name Tile extends Node2D

signal energy_update(amount)

@onready var sprite = $Sprite2D
var _mouse_entered: bool = false
var occupying_unit: Cat:
	set(new_value):
		occupying_unit = new_value
		add_child(occupying_unit)

#func _input(event):
	## add unit to tile if not occupied
	#var current_card = GameManager.currently_dragged_card
	#if event is InputEventMouseButton and not event.pressed:
		#match event.button_index:
			#MOUSE_BUTTON_LEFT:
				##print(occupying_unit, " ", current_card, " ", _mouse_entered)
				#if (not is_instance_valid(occupying_unit)) and is_instance_valid(current_card) and _mouse_entered == true:
					#if GameManager.energy >= current_card.cat_data.energy_cost:
						#occupying_unit = current_card.cat_scene.instantiate()
						##print("instantiate")
						#GameManager.energy -= current_card.cat_data.energy_cost
						#add_child(occupying_unit)
						#GameManager.currently_dragged_card = null
						#GameManager.currently_dragged_unit_scene = null
#
#
func _on_area_2d_mouse_entered() -> void:
	sprite.modulate = "#ffffff"

func _on_area_2d_mouse_exited() -> void:
	sprite.modulate = "#a3a386"
