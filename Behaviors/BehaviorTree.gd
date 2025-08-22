extends Node
class_name BehaviorTree

@export var initial_behavior: Behavior

var current_behavior: Behavior
var behaviors: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Behavior:
			behaviors[child.name.to_lower()] = child
			child.transition.connect(on_child_transition)
			child.transition_callback.connect(on_child_transition_callback)
	
	if initial_behavior:
		initial_behavior.enter()
		current_behavior = initial_behavior

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_behavior:
		current_behavior.update(delta)

func _physics_process(delta):
	if current_behavior:
		current_behavior.physics_update(delta)

func transition(new_behavior_name):
	current_behavior.transition.emit(current_behavior, new_behavior_name)

#transition that ends current behavior and enters new behavior
func on_child_transition(behavior, new_behavior_name):
	if behavior != current_behavior:
		return
	
	var new_behavior = behaviors.get(new_behavior_name.to_lower())
	if !new_behavior:
		return
	
	if current_behavior:
		current_behavior.exit()
	
	current_behavior = new_behavior
	
	new_behavior.enter()

#transition that preserves current behavior and returns to it
func on_child_transition_callback(behavior, new_behavior_name):
	if behavior != current_behavior:
		return
	
	var new_behavior = behaviors.get(new_behavior_name.to_lower())
	if !new_behavior:
		return
	
	if current_behavior:
		current_behavior.exit_callback()
	
	current_behavior = new_behavior
	
	var old_behavior_name = behaviors.find_key(behavior)
	new_behavior.enter_callback(old_behavior_name)
