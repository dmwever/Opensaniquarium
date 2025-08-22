extends Behavior
class_name Idle

@export var character: CharacterBody2D
@export var animationPlayer: MultispriteFishimationPlayer
@export var move_speed: float = 50.0

var move_direction: Vector2 = Vector2.ZERO
var move_multiplier: float = 1.0
var idle_timer: Timer = Timer.new()
var wander_timer: Timer = Timer.new()

func idle():
	idle_timer.wait_time = RandomNumberGenerator.new().randi_range(1, 10)
	idle_timer.start()
	move_multiplier = 0.2

func wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_timer.wait_time = randf_range(0.02, 3)
	wander_timer.start()
	move_multiplier = 1.0
	if move_direction.x < 0 && !animationPlayer.facing_left():
		transitioned_callback.emit(self, "turn")
	if move_direction.x > 0 && animationPlayer.facing_left():
		transitioned_callback.emit(self, "turn")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(idle_timer)
	add_child(wander_timer)
	idle_timer.timeout.connect(on_idle_timeout)
	idle_timer.one_shot = true
	idle_timer.autostart = true
	wander_timer.timeout.connect(on_wander_timeout)
	wander_timer.one_shot = true
	idle()

func enter():
	idle()

func enter_callback(behavior_name: String):
	if (behavior_name == "turn"):
		wander_timer.start()
		return
	idle()
	
func exit():
	wander_timer.stop()
	idle_timer.stop()

func exit_callback():
	wander_timer.stop()

func physics_update(delta):
	if character:
		character.velocity = move_direction * move_speed * move_multiplier

func on_idle_timeout():
	wander()
	
func on_wander_timeout():
	idle()
