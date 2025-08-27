extends Behavior
class_name Chase

@export var character: CharacterBody2D
@export var move_speed: float

var target
var goal_behavior: String
signal reach_goal

# Called when the node enters the scene tree for the first time.
func _ready():
	reach_goal.connect(on_reach_goal)

func enter():
	chase_target()

func enter_callback(behavior: String):
	goal_behavior = behavior

func chase_target():
	target = character.target
	character.velocity = (target.global_position - character.global_position).normalized() * move_speed
	
func on_reach_goal():
	transition_callback.emit(self, goal_behavior)
