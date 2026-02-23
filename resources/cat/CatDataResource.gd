class_name CatData extends Resource

@export_group("Stats")
@export var health: int 
@export var attack: int
@export var cooldown: float
@export var energy_cost: int

@export_group("Scenes and Co")
@export var projectile: PackedScene
@export var texture: Texture
