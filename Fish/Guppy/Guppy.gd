class_name Guppy
extends Fish

@export var growable: Growable

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

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
