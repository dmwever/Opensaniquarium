extends RigidBody2D

@export var pellet: AnimatedSprite2D
@export var food_type: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pellet.play(food_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass


func _on_hurtbox_area_entered(_area):
	queue_free()
