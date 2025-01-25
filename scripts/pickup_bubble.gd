extends Area2D

const DEFAULT_PICKUP_BUBBLE_SIZE_INCREMENTER: int = 25

@onready var game_manager: Node = %GameManager

func _on_body_entered(_body: Node2D) -> void:
	game_manager.increment_bubble_size(DEFAULT_PICKUP_BUBBLE_SIZE_INCREMENTER)
	print("Bubble size: " + str(game_manager.get_bubble_size()))
	queue_free()
