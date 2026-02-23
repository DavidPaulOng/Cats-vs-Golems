class_name GolemData extends Resource

@export_group("Stats")
@export var health: int 
@export var attack: int
@export var cooldown: float
@export var speed: float

@export_group("Scenes and Co")
@export var projectile: PackedScene
@export var texture: Texture
