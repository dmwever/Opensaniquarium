extends CharacterBody2D
class_name Guppy

@onready var _idle_timer: Timer = $IdleTimer
@onready var _hunger_timer: HungerTimer = $HungerTimer
@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

const SPEED: float = 50.0
const MAX_SPEED: Vector2 = Vector2(50, 50)
const TOLERANCE: float = 10.0

@export var state: Util.FishAction = Util.FishAction.IDLE
var target_position: Vector2
var state_hold: Util.FishAction = Util.FishAction.IDLE
#var _hunger: Util.HungerState = Util.HungerState.SATISFIED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	match state:
		Util.FishAction.IDLE:
			if (_idle_timer.is_stopped()):
				_idle_timer.wait_time = RandomNumberGenerator.new().randi_range(1, 10)
				_idle_timer.start()
		Util.FishAction.WANDER:
			wander()
			fishimation_player.speed_scale = 2.0
			try_end_wander()
		Util.FishAction.TURN:
			pass
	
	move_and_slide()

func _on_idle_timer_timeout():
	try_wander()

func try_wander():
	state = Util.FishAction.WANDER
	velocity = Vector2.ZERO
	set_wander()
	try_turn()

func try_end_wander():
	if (target_position - global_position).length() < TOLERANCE:
		velocity = velocity * 0.2
		state = Util.FishAction.IDLE
		fishimation_player.speed_scale = 1.0

func set_wander():
	var random: RandomNumberGenerator = RandomNumberGenerator.new()
	var current_location = global_position
	var random_travel: Vector2 = Vector2(random.randf_range(-100,100), random.randf_range(-100, 100))
	target_position = current_location + random_travel

func wander():
	var direction: Vector2 = (target_position - global_position).normalized()
	velocity = direction * SPEED

func is_moving_left() -> bool:
	return target_position.x < global_position.x

func try_turn():
	if (fishimation_player.check_turn()):
		turn()

func turn():
	state_hold = state;
	state = Util.FishAction.TURN
	fishimation_player.turn()

func end_turn():
	state = state_hold
	fishimation_player.end_turn()


func _on_guppy_animation_player_animation_finished(anim_name):
	if (anim_name == fishimation_player.turn_animation):
		end_turn()
