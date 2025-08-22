extends Node
class_name Behavior

signal transition
signal transition_callback

func enter():
	pass
	
func enter_callback(_behavior_name: String):
	pass

func exit():
	pass

func update(_delta: float):
	pass

# Called when the node enters the scene tree for the first time.
func physics_update(_delta: float):
	pass
