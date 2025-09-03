extends AnimationPlayer
class_name MultispriteFishimationPlayer

@export var swim_sprite: HungerSprite
@export var turn_sprite: HungerSprite
@export var eat_sprite: HungerSprite

@export var swim_animation: String
@export var turn_animation: String
@export var eat_animation: String

var sprites: Array[Sprite2D] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	sprites = [
		swim_sprite,
		turn_sprite,
		eat_sprite
	]
	activate_sprite(swim_sprite)
	play(swim_animation)

func activate_sprite(new_sprite: Sprite2D) -> void:
	assert(new_sprite != null)
	assert(new_sprite in sprites)
	for sprite in sprites:
		sprite.visible = sprite == new_sprite

func facing_left()-> bool:
	if !swim_sprite.flip_h:
		return true
	return false

func turn():
	activate_sprite(turn_sprite)
	play(turn_animation)
	
func end_turn():
	for sprite in sprites:
		sprite.flip_h = !sprite.flip_h
	activate_sprite(swim_sprite)
	play(swim_animation)

func eat():
	activate_sprite(eat_sprite)
	play(eat_animation)

func end_eat():
	activate_sprite(swim_sprite)
	play(swim_animation)

func make_hungry():
	for sprite in sprites:
		if sprite is HungerSprite:
			sprite.make_hungry()

func satisfy():
	for sprite in sprites:
		if sprite is HungerSprite:
			sprite.satisfy()


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == turn_animation:
		end_turn() # Replace with function body.
