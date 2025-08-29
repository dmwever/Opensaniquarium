extends Node
class_name Feedable

@export var character: CharacterBody2D
@export var eatables: Array[String]
@export var feed_until_grow: int
@export var behavior_tree: BehaviorTree

@onready var hunger_timer: HungerTimer = $HungerTimer

var peckish_search: Timer
var foods: Array
# Called when the node enters the scene tree for the first time.
func _ready():
	hunger_timer.wait_time = 22
	hunger_timer.start()
	hunger_timer.timeout.connect(on_hunger_timeout)
	peckish_search = Timer.new()
	peckish_search.wait_time = 1
	peckish_search.autostart = false
	peckish_search.timeout.connect(on_peckish_search)
	add_child(peckish_search)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hungry() && character.target == null:
		detect_food()
	if (hunger_timer.check_hunger() == Util.HungerState.PECKISH):
		if peckish_search.is_stopped():
			peckish_search.start()
	else:
		peckish_search.stop()
		peckish_search.wait_time = 1

func can_eat(food: Eatable):
	if (eatables.has(food.food_name) && hunger_timer.check_hunger() != Util.HungerState.SATISFIED):
		return true
	return false

func feed(food_level: int):
	hunger_timer.start(hunger_timer.time_left + calculate_hunger_timer_add(food_level))
	feed_until_grow -= food_level

func calculate_hunger_timer_add(food_level: int):
	var hunger_timer_add: float = 8.0
	if food_level >=2:
		hunger_timer_add += 7
	if food_level >= 3:
		hunger_timer_add += 11
	
	var max_hunger_seconds := 14.0
	
	hunger_timer_add += (((5 + food_level) / max_hunger_seconds) * (max_hunger_seconds - hunger_timer.time_left))
	
	if hunger_timer_add > 31:
		hunger_timer_add = 31
	
	return hunger_timer_add

func detect_food():
	var food: Array
	food = Global.get_tank_entities().filter(food_filter)
	if food.size() != 0:
		character.target = closest_food_location(food)
		behavior_tree.transition_callback("chase")

func food_filter(food):
	return food is FishFood

func closest_food_location(food: Array):
	var closest_food_vector: Vector2 = Vector2.INF
	var closest_food
	for choice in food:
		if choice.global_position - character.global_position < closest_food_vector:
			closest_food_vector = choice.global_position
			closest_food = choice
	if closest_food_vector == Vector2.INF:
		return null
	return closest_food

func hungry() -> bool:
	return hunger_timer.check_hunger() == Util.HungerState.HUNGRY or hunger_timer.check_hunger() == Util.HungerState.STARVED

func on_hunger_timeout():
	character.kill()
	
func on_peckish_search():
	if character.target == null:
		detect_food()
