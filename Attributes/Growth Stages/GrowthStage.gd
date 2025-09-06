extends Node
class_name GrowthStage

@export var growth_need: int
@export var growth_tag: String

signal growth_event

func grow(amount: int) -> bool:
	growth_need -= amount
	if growth_need <= 0:
		grow_entity()
		return true
	return false

func grow_entity() -> void:
	#add attributes
	#unlock purchases
	growth_event.emit(growth_tag)
	pass
	#growth_need = stage_growths[++stage_number]
