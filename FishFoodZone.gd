extends StaticBody2D

const FISH_FOOD = preload("res://FishFood/fish_food.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("click"):
			var fish_food = FISH_FOOD.instantiate()
			get_parent().add_child(fish_food)
			fish_food.position = event.position
