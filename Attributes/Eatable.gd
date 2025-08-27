extends Node
class_name Eatable

@export var food: Node2D
@export var feed_value: int
@export var food_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("be_eaten", be_eaten)

func be_eaten(eater):
	eater.feed(feed_value)
	food.queue_free()
