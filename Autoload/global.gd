extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_tank_entities():
	var root = get_tree().root
	assert(root.get_node("Tank") != null)
	return root.get_node("Tank").get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
