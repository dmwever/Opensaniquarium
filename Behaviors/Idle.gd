extends Behavior
class_name Idle

@export var character: CharacterBody2D
@export var animationPlayer: MultispriteFishimationPlayer
@export var move_speed: float = 20.0

var move_direction: Vector2 = Vector2.ZERO
var idle_timer: Timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(idle_timer)
	idle_timer.timeout.connect(on_idle_timeout)
	idle_timer.one_shot = true
	idle_timer.autostart = true
	idle()

func enter():
	idle()

func exit():
	idle_timer.stop()

func physics_update(_delta):
	if character:
		character.velocity = character.velocity.normalized() * move_speed

func idle():
	idle_timer.wait_time = RandomNumberGenerator.new().randi_range(1, 10)
	idle_timer.start()

## Signals
func on_idle_timeout():
	transition.emit(self, "wander")
