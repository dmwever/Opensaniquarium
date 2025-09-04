extends Node
class_name Growable

@export var stage_growths: Array[int]

var stage_number: int
var growth_need: int

func _ready() -> void:
	stage_number = 0
	#growth_need = stage_growths[stage_number]

func grow(growth_amount) -> void:
	growth_need -= growth_amount
	if growth_need <= 0:
		grow_entity()

func grow_entity() -> void:
	pass
	#growth_need = stage_growths[++stage_number]
