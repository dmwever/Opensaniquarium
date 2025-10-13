extends Node
class_name Growable

@export var fishimation_player: MultispriteFishimationPlayer

var stage_number: int = 0
var stage_growths: Array[GrowthStage]

func _ready() -> void:
	stage_number = 0
	for child in get_children():
		if child is GrowthStage:
			stage_growths.append(child)
			child.growth_event.connect(on_growth_event)

func grow(growth_amount: int) -> void:
	stage_growths[stage_number].grow(growth_amount)

func on_growth_event(growth_tag: String):
	fishimation_player.tag_animations(growth_tag)
	stage_number += 1
	if stage_number == stage_growths.size():
		get_parent().remove_child(self)
