extends AnimationPlayer
class_name MultispriteFishimationPlayer

@onready var swim_sprite: Sprite2D = $"../Swim"
@onready var turn_sprite: Sprite2D = $"../Turn"
@onready var fish: Guppy = $".."

var swim_animation: String = "swim"
var turn_animation: String = "turn"

var sprites: Array[Sprite2D] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	sprites = [
		swim_sprite,
		turn_sprite
	]
	activate_sprite("../Swim")
	play(swim_animation)

func activate_sprite(nodePath: NodePath) -> void:
	var node = get_node(nodePath)
	assert(node != null)
	assert(node in sprites)
	for sprite in sprites:
		sprite.visible = sprite == node

func check_turn()-> bool:
	if ((fish.is_moving_left() && swim_sprite.flip_h)
	|| (!fish.is_moving_left() && !swim_sprite.flip_h)):
		return true
	return false

func turn():
	activate_sprite("../Turn")
	play(turn_animation)
	
func end_turn():
	for sprite in sprites:
		sprite.flip_h = !sprite.flip_h
	activate_sprite("../Swim")
	play(swim_animation)
