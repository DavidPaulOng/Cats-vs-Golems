class_name DroppableSlot extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func add_card(card: DraggableCard) -> void:
	print("added")
	card.reparent(self)
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is DraggableCard:
		return true
	return false
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("drop data")
	var card: DraggableCard = data as DraggableCard
	add_card(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
