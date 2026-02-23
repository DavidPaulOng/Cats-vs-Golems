class_name ButtonDraggableCard extends PanelContainer

@export var cat_data: CatData
@export var cat_scene: PackedScene
@onready var _texture_rect: TextureRect = $TextureRect
var _mouse_entered: bool = false
var preview: TextureRect
var dragging: bool = false

func _ready():
	_texture_rect.texture = cat_data.texture

func _input(event) -> void:
	if event is InputEventMouseButton and event.pressed and _mouse_entered:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				dragging = true
				preview = _texture_rect.duplicate()
				GameManager.currently_dragged_card = self
				GameManager.currently_dragged_unit_scene = cat_scene
				add_child(preview)
				
	if event is InputEventMouseButton and not event.pressed and dragging:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				dragging = false
				if not GameManager.mouse_is_on_tile:
					GameManager.currently_dragged_card = null
					GameManager.currently_dragged_unit_scene = null
				preview.queue_free()
	
	
func _on_button_mouse_entered() -> void:
	_mouse_entered = true

func _on_button_mouse_exited() -> void:
	_mouse_entered = false
