class_name Orange extends Cat

@onready var _attack_timer : Timer = $AttackTimer

func _ready():
	super() 
	start_timer() # start attack cooldown

func start_timer():
	_attack_timer.start(cooldown)
	
func stop_timer():
	_attack_timer.stop()

func shoot():
	var new_projectile = projectile.instantiate()
	add_child(new_projectile)
	pass
	
func _on_attack_timer_timeout() -> void:
	shoot()
