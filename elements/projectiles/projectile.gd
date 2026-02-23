class_name Projectile extends Node2D

@export var speed : int = 8
@export var damage :int = 10

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x += speed

func _on_area_2d_area_entered(area: Area2D) -> void:
	area.get_parent().add_health(-damage)
	queue_free()
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
