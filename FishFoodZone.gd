class_name FishFoodZone
extends StaticBody2D

const FISH_FOOD = preload("res://FishFood/fish_food.tscn")

@export var tank: Tank
@export var inventory: TankInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("click"):
		if inventory.has_special_food():
			pass
		elif inventory.has_food():
			var fish_food = FISH_FOOD.instantiate()
			inventory.add_child(fish_food)
			fish_food.position = event.position
