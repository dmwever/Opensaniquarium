extends Fish
class_name Guppy

@export var growable: Growable

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

signal grow_guppy

func _ready() -> void:
	grow_guppy.connect(on_guppy_grow)

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity = velocity.limit_length(70)
	if feedable.hungry():
		velocity = velocity * 1.2
		fishimation_player.make_hungry()
	else:
		fishimation_player.satisfy()
	move_and_slide()

func grow(growth_value):
	growable.grow(growth_value)

func on_guppy_grow(growth_stage) -> void:
	if growth_stage == 1: #medium
		fishimation_player.growth_tag = "_medium"
