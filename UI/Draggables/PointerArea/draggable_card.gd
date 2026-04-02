class_name DraggableCard extends Control

@export var cat_data: CatData
@export var cat_scene: PackedScene
@onready var _texture_rect: TextureRect = $PanelContainer2/MarginContainer/TextureRect
@onready var _label: Label = $PanelContainer/CenterContainer/HBoxContainer/Label
@onready var point_area = ResourceLoader.load("res://UI/Draggables/PointerArea/point_area.tscn")
var _mouse_entered: bool = false
var dragging: bool = false
var point_area_instance
var preview: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_texture_rect.texture = cat_data.texture
	_label.text = str(cat_data.energy_cost)

func _process(delta: float) -> void:
	if is_instance_valid(preview):
		preview.global_position = get_global_mouse_position() - 0.5 * _texture_rect.size

func _input(event) -> void:
	if event is InputEventMouseButton and event.pressed and _mouse_entered:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				dragging = true
				point_area_instance = point_area.instantiate()
				point_area_instance.cat_scene = cat_scene
				point_area_instance.energy_cost = cat_data.energy_cost
				preview = _texture_rect.duplicate()
				preview.modulate.a = 0.5
				add_child(preview)
				add_child(point_area_instance)
				
	if event is InputEventMouseButton and not event.pressed and is_instance_valid(point_area_instance):
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				point_area_instance.queue_free()
				preview.queue_free()

func _on_button_mouse_entered() -> void:
	_mouse_entered = true

func _on_button_mouse_exited() -> void:
	_mouse_entered = false
