extends Behavior
class_name Eat

@export var animationPlayer: MultispriteFishimationPlayer

var eat_timer: Timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(eat_timer)
	eat_timer.wait_time = 2
	eat_timer.timeout.connect(on_eat_timeout)
	eat_timer.one_shot = true

func enter():
	animationPlayer.eat()
	eat_timer.start()
	
func exit():
	pass

## Signals
func on_eat_timeout():
	transition.emit(self, "idle")
