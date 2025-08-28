extends Node2D
class_name Tank

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_entity(entity):
	add_child(entity)

func get_entities() -> Array:
	return get_children()
