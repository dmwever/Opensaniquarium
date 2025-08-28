extends Node
class_name DespawnAtBottom

@export var sprite: Node
@export var entity: Node2D

var despawning: bool = false
var vanish: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if despawning:
		vanish -= delta * 1.5
		sprite.modulate = Color(1,1,1,vanish)
		if vanish <= 0:
			entity.queue_free()
