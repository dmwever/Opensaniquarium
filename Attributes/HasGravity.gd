extends Node
class_name HasGravity

@export var linear_gravity_speed: float = 40.0
@export var entity: PhysicsBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if entity is RigidBody2D:
		var rigid_entity = entity as RigidBody2D
		rigid_entity.gravity_scale = 0
		rigid_entity.linear_velocity = Vector2(0, linear_gravity_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
