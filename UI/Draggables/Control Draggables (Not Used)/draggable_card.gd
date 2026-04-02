class_name DraggableCard_old extends Control

signal dragged_away(unit: DraggableCard)

@onready var card_face: Panel  = $CardFace
@onready var value_label: Label  = $CardFace/Label
@onready var sprite_2d: Sprite2D = $CardFace/Sprite2D

func get_preview() -> Control:
	if card_face.visible:
		return card_face.duplicate()
	return null

func _get_drag_data(_at_position: Vector2) -> Variant:
	var preview = get_preview()
	var control = Control.new() # Create a new control to offset the preview
	control.add_child(preview)
	preview.position = -0.5 * preview.size #offset the preview

	set_drag_preview(control)
	return self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
