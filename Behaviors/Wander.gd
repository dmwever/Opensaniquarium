extends Behavior
class_name Wander

@export var character: CharacterBody2D
@export var animationPlayer: MultispriteFishimationPlayer
@export var move_speed: float = 50.0

var move_direction: Vector2 = Vector2.ZERO
var wander_timer: Timer = Timer.new()

func _ready():
	add_child(wander_timer)
	wander_timer.timeout.connect(on_wander_timeout)
	wander_timer.one_shot = true
	
func enter():
	wander()

func enter_callback(_previous_behavior):
	if (wander_timer.time_left == 0):
		wander()
		return
	wander_timer.start()

func exit():
	animationPlayer.speed_scale = 1.0
	wander_timer.stop()

func exit_callback():
	wander_timer.stop()
	
func physics_update(_delta):
	if character:
		character.velocity = move_direction * move_speed
	if animationPlayer:
		animationPlayer.speed_scale = 2.0

func wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_timer.wait_time = randf_range(0.02, 3)
	wander_timer.start()
	try_turn()

 ## callback transition to [Turn]
func try_turn():
	if move_direction.x < 0 && !animationPlayer.facing_left():
		transition_callback.emit(self, "turn")
	if move_direction.x > 0 && animationPlayer.facing_left():
		transition_callback.emit(self, "turn")
	
	
func on_wander_timeout():
	transition.emit(self, "idle")
