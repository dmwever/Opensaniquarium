extends Node2D
class_name Tank

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.content_scale_size = Vector2(480, 640)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_entity(entity):
	add_child(entity)

func get_entities() -> Array:
	return get_children()
