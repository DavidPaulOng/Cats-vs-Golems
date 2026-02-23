class_name Energy extends Node2D

signal collected(amount)
var mouse_entered:bool = false
var energy_amount: int = 30

func _ready() -> void:
	collected.connect(GameManager.collect_energy)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and mouse_entered:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				collected.emit(energy_amount)
				queue_free()

func _on_area_2d_mouse_entered() -> void:
	mouse_entered = true

func _on_area_2d_mouse_exited() -> void:
	mouse_entered = false
