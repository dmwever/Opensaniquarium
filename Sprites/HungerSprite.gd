extends Sprite2D
class_name HungerSprite

@export var hunger_sprite_img: Texture2D
@export var satisfied_sprite_img: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = satisfied_sprite_img

func make_hungry():
	texture = hunger_sprite_img

func satisfy():
	texture = satisfied_sprite_img
