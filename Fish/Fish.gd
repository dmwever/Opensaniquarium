extends CharacterBody2D
class_name Fish

@export var behavior_tree: BehaviorTree
@export var feedable: Feedable
@export var movement_speed: float

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

var target
var movement_vector

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity.x = movement_speed * movement_vector.x * 1.1
	velocity.y = movement_speed * movement_vector.y
	if feedable.hungry():
		fishimation_player.make_hungry()
		velocity.clampf(0, 50 * 1.2)
	else:
		fishimation_player.satisfy()
		velocity.clampf(0, 50)
	move_and_slide()

func feed(food_value):
	feedable.feed(food_value)

func kill():
	behavior_tree.transition("dead")
