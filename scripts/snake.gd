extends Node2D

const SPEED = 60
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_down.is_colliding():
		direction = -1
	if ray_cast_up.is_colliding():
		direction = 1
	position.y += direction * SPEED * delta
