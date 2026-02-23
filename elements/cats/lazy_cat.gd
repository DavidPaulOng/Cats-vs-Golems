class_name LazyCat extends Cat

@export_group("Energy")
@export var energy: int
@export_group("Textures")
@export var lazy_texture: Texture
@export var shine_texture: Texture

@onready var sprite: Sprite2D  = $Sprite2D
@onready var _spawn_timer: Timer = $SpawnTimer
@onready var _energy_area_collision: CollisionShape2D = $CollectEnergyArea/CollisionShape2D
@onready var _zzz_particles: GPUParticles2D = $"ZZZ Particle"
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

var _mouse_entered: bool = false

func _ready():
	super()
	sprite.modulate.a = 0.75
	_spawn_timer.start(cooldown)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and _mouse_entered:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				exit_shine_mode()
				
func enter_shine_mode():
	# shine mode means you can collect energy 
	# click the cat to get energy
	_zzz_particles.modulate.a = 0
	sprite.modulate.a = 1
	sprite.texture = shine_texture
	_energy_area_collision.disabled = false
	_animation_player.current_animation = "shaking"
	_spawn_timer.stop()

func exit_shine_mode():
	# collect energy
	GameManager.energy += energy
	# cat goes to sleep to make energy
	sprite.modulate.a = 0.75
	_zzz_particles.modulate.a = 1
	sprite.texture = lazy_texture
	_energy_area_collision.disabled = true
	_animation_player.current_animation = str("")
	_spawn_timer.start(cooldown)
	
func _on_spawn_timer_timeout() -> void:
	enter_shine_mode()

func _on_collect_energy_mouse_entered() -> void:
	_mouse_entered = true

func _on_collect_energy_mouse_exited() -> void:
	_mouse_entered = false
