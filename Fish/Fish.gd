extends CharacterBody2D
class_name Fish

@export var behavior_tree: BehaviorTree
@export var feedable: Feedable

var target

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

func feed(food_value):
	feedable.feed(food_value)
	behavior_tree.transition("eat")

func kill():
	behavior_tree.transition("dead")
