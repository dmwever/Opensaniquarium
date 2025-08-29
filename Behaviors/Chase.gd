extends Behavior
class_name Chase

@export var character: CharacterBody2D
@export var move_speed: float
@export var animationPlayer: MultispriteFishimationPlayer

var acceleration:= 1000
var goal_behavior: String
signal reach_goal

# Called when the node enters the scene tree for the first time.
func _ready():
	reach_goal.connect(on_reach_goal)

func _physics_process(delta: float) -> void:
	if character.target != null:
		chase_target(delta)
	else:
		transition.emit(self, "idle")
		

func enter():
	animationPlayer.speed_scale = 2.0

func enter_callback(behavior: String):
	goal_behavior = behavior
	animationPlayer.speed_scale = 2.0
	
func exit():
	animationPlayer.speed_scale = 1.0

func chase_target(delta):
	try_turn()
	character.velocity += (character.target.global_position - character.global_position).normalized() * acceleration * delta
	character.velocity = character.velocity.limit_length(move_speed)

 ## callback transition to [Turn]
func try_turn():
	if character.velocity.x <= 0 && !animationPlayer.facing_left():
		transition_callback.emit(self, "turn")
	if character.velocity.x > 0 && animationPlayer.facing_left():
		transition_callback.emit(self, "turn")

func on_reach_goal():
	transition_callback.emit(self, goal_behavior)
