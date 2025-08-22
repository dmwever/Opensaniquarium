extends Node
class_name Behavior

signal transitioned
signal transitioned_callback

func enter():
	pass
	
func enter_callback(behavior_name: String):
	pass

func exit():
	pass

func update(_delta: float):
	pass

# Called when the node enters the scene tree for the first time.
func physics_update(_delta: float):
	pass
