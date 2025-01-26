extends Node

@onready var progress_bar: ProgressBar = $ProgressBar


const BUBBLE_INIT_HEALTH: int = 500
var bubble_health: int = 0

func _ready() -> void:
	bubble_health = BUBBLE_INIT_HEALTH
	progress_bar.value = bubble_health
	progress_bar.max_value = BUBBLE_INIT_HEALTH
	print("Bubble health: " + str(bubble_health))

func increment_bubble_health(healthIncrement: int):
	bubble_health += healthIncrement
	progress_bar.value = bubble_health
	

func get_bubble_health():
	return bubble_health

func set_bubble_health(health: int):
	bubble_health = health
	progress_bar.value = bubble_health
	
