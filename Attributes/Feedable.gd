extends Node
class_name Feedable

@export var character: CharacterBody2D
@export var eatables: Array[String]
@export var feed_until_grow: int

@onready var hunger_timer: HungerTimer = $HungerTimer

var foods: Array
# Called when the node enters the scene tree for the first time.
func _ready():
	hunger_timer.wait_time = 22
	hunger_timer.start()
	hunger_timer.timeout.connect(on_hunger_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func can_eat(food: Eatable):
	if (eatables.has(food.food_name)):
		return true
	return false

func feed(amount: int):
	hunger_timer.wait_time = 22
	hunger_timer.start()
	feed_until_grow -= amount

func hungry() -> bool:
	return hunger_timer.check_hunger() == Util.HungerState.HUNGRY or hunger_timer.check_hunger() == Util.HungerState.STARVED

func on_hunger_timeout():
	character.kill()
