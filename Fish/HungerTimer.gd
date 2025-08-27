class_name HungerTimer
extends Timer

var peckish_check_for_food: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	peckish_check_for_food = Timer.new()
	peckish_check_for_food.wait_time = 1
	peckish_check_for_food.autostart = false
	add_child(peckish_check_for_food)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (check_hunger() == Util.HungerState.PECKISH):
		pass

func check_hunger():
	if time_left <= 0:
		return Util.HungerState.STARVED
	if time_left < 9:
		return Util.HungerState.HUNGRY
	if time_left < 15:
		return Util.HungerState.PECKISH
	return Util.HungerState.SATISFIED
