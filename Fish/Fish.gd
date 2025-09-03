extends CharacterBody2D
class_name Fish

@export var behavior_tree: BehaviorTree
@export var feedable: Feedable

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

var target

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity = velocity.limit_length(100)
	if feedable.hungry():
		fishimation_player.make_hungry()
		velocity = velocity * 1.2
	else:
		fishimation_player.satisfy()
	print(velocity)
	move_and_slide()

func feed(food_value):
	feedable.feed(food_value)

func kill():
	behavior_tree.transition("dead")
