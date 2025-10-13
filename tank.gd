class_name Tank
extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.content_scale_size = Vector2(480, 640)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_fish_food() -> Array:
	return get_children().filter(func(node): return node is FishFood)
