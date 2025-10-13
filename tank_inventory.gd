class_name TankInventory
extends Node

@export var money: int
@export var food_level: int
@export var food_limit: int

var special_food

func has_special_food() -> bool:
	if special_food != null:
		return true
	return false

func has_food() -> bool:
	return get_children().size() < food_limit
