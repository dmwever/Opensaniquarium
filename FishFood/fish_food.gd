extends RigidBody2D

@export var pellet: AnimatedSprite2D
@export var food_type: String

var despawning: bool = false
var vanish: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pellet.play(food_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if despawning:
		vanish -= _delta * 1.5
		pellet.modulate = Color(1,1,1,vanish)
		if vanish <= 0:
			queue_free()


func _on_hurtbox_area_entered(_area):
	queue_free()


func _on_body_entered(_body):
	despawning = true
