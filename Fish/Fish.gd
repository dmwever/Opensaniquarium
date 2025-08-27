extends CharacterBody2D
class_name Fish

@export var behavior_tree: BehaviorTree
@export var feedable: Feedable

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

var hunger: Util.HungerState = Util.HungerState.SATISFIED
var target

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_and_slide()
	detect_food()
	if feedable.hungry():
		fishimation_player.make_hungry()
	else:
		fishimation_player.satisfy()

func detect_food():
	var food: Array
	food = get_parent().get_entities().filter(food_filter)
	if food.size() != 0:
		target = closest_food_location(food)
		behavior_tree.transition("chase")

func food_filter(food):
	return food is FishFood

func closest_food_location(food: Array):
	var closest_food_vector: Vector2 = Vector2.INF
	var closest_food
	for choice in food:
		if choice.global_position - global_position < closest_food_vector:
			closest_food_vector = choice.global_position
			closest_food = choice
	if closest_food_vector == Vector2.INF:
		return null
	return closest_food

func feed(food_value):
	feedable.feed(food_value)

func kill():
	behavior_tree.transition("dead")
