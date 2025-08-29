extends Node
class_name Eatable

@export var feed_value: int
@export var food_name: String

func be_eaten(eater, food):
	eater.feed(feed_value)
	food.queue_free()
