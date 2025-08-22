extends CharacterBody2D
class_name Fish

@export var behavior_tree: BehaviorTree

@onready var fishimation_player: MultispriteFishimationPlayer = $GuppyAnimationPlayer
@onready var hunger_timer: HungerTimer = $HungerTimer

var hunger: Util.HungerState = Util.HungerState.SATISFIED

func _ready():
	hunger_timer.wait_time = 22
	hunger_timer.start()
	hunger_timer.timeout.connect(on_hunger_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_and_slide()



func on_hunger_timeout():
	behavior_tree.transition("dead")
