extends Node

const BUBBLE_INIT_SIZE: int = 500
var bubble_size: int = 0

func _ready() -> void:
	bubble_size = BUBBLE_INIT_SIZE
	print("Bubble size: " + str(bubble_size))

func increment_bubble_size(sizeIncrement: int):
	bubble_size += sizeIncrement

func get_bubble_size():
	return bubble_size
