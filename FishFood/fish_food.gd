extends RigidBody2D
class_name FishFood

@export var pellet: AnimatedSprite2D
@export var food_type: String
@export var eatable: Eatable
@export var despawn: DespawnAtBottom

# Called when the node enters the scene tree for the first time.
func _ready():
	pellet.play(food_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	pass

func _on_hurtbox_area_entered(_area):
	var eater: Node2D = _area.get_parent()
	if (eater.find_child("Feedable").can_eat(eatable)):
		SignalBus.emit_signal("be_eaten", eater, self)


func _on_body_entered(_body):
	despawn.despawning = true
