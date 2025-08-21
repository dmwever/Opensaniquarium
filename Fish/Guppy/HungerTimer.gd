class_name HungerTimer
extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func check_hunger():
	if time_left <= 0:
		return Util.HungerState.STARVED
	if time_left < 7:
		return Util.HungerState.HUNGRY
	if time_left < 14:
		return Util.HungerState.PECKISH
	return Util.HungerState.SATISFIED
