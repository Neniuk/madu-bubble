extends Area2D

const DEFAULT_PICKUP_BUBBLE_HEALTH_INCREMENTER: int = 25

@onready var game_manager: Node = %GameManager

func _on_body_entered(_body: Node2D) -> void:
	game_manager.increment_bubble_health(DEFAULT_PICKUP_BUBBLE_HEALTH_INCREMENTER)
	print("Bubble health: " + str(game_manager.get_bubble_health()))
	queue_free()
