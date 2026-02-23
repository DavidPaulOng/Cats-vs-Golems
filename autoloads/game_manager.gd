extends Node

signal energy_update(amount)

var energy_display

#dragging cards logic
var currently_dragged_card: ButtonDraggableCard
var currently_dragged_unit_scene: PackedScene
var mouse_is_on_tile: bool = false

var energy: int = 20:
	get:
		return energy
	set(new_value):
		energy = new_value
		energy_update.emit(new_value)
		
func _process(delta: float) -> void:
	# drag logic for currently dragged card
	if currently_dragged_card and currently_dragged_card.dragging:
		currently_dragged_card.preview.global_position = currently_dragged_card.get_global_mouse_position() - 0.5 * currently_dragged_card.size

func collect_energy(amount):
	energy += amount
