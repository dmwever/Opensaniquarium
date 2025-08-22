extends Behavior
class_name Turn

@export var animationPlayer: MultispriteFishimationPlayer

var previous_behavior: String

func enter_callback(behavior: String):
	previous_behavior = behavior;

func exit():
	animationPlayer.end_turn()

func exit_callback():
	animationPlayer.end_turn()
	
func physics_update(_delta):
	animationPlayer.turn()

func _on_guppy_animation_player_animation_finished(anim_name):
	if anim_name == animationPlayer.turn_animation:
		transitioned_callback.emit(self, previous_behavior)
