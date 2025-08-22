extends CharacterBody2D
class_name Guppy

@onready var _hunger_timer: HungerTimer = $HungerTimer
@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer

const SPEED: float = 50.0
const MAX_SPEED: Vector2 = Vector2(50, 50)
const TOLERANCE: float = 10.0

@export var state: Util.FishAction = Util.FishAction.IDLE
var state_hold: Util.FishAction = Util.FishAction.IDLE
#var _hunger: Util.HungerState = Util.HungerState.SATISFIED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_and_slide()
	

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
