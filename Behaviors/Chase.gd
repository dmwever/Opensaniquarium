extends Behavior
class_name Chase

@export var character: CharacterBody2D
@export var move_speed: float
@export var animationPlayer: MultispriteFishimationPlayer

var acceleration:= 250
var goal_behavior: String
signal reach_goal

# Called when the node enters the scene tree for the first time.
func _ready():
	reach_goal.connect(on_reach_goal)

func physics_update(delta: float) -> void:
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
	character.velocity = character.velocity.move_toward((character.target.global_position - character.global_position) * 100, acceleration * delta)
	#character.velocity += ((character.target.global_position - character.global_position) * Vector2(1.2, 1)).normalized() * acceleration * delta
	print (character.velocity)
	try_turn()

 ## callback transition to [Turn]
func try_turn():
	if character.velocity.x <= 0 && !animationPlayer.facing_left():
		animationPlayer.turn()
	if character.velocity.x > 0 && animationPlayer.facing_left():
		animationPlayer.turn()

func on_reach_goal():
	transition_callback.emit(self, goal_behavior)


func _on_guppy_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == animationPlayer.turn_animation:
		animationPlayer.end_turn()
