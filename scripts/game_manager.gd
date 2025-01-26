extends Node
@onready var player: CharacterBody2D = $"../Player"
@onready var midground: TileMapLayer = $"../Tiles/Midground"

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var health_timer: Timer = $HealthTimer
var is_taking_damage: bool = false

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
	
func decrement_bubble_health():
	if bubble_health > 0:
		bubble_health -= 10
		progress_bar.value = bubble_health
		print("Bubble health: " + str(bubble_health))
		if bubble_health <= 0:
			print("dead")
	else:
		player_die()
		health_timer.stop()
	
	
func player_die():
	if player.has_method("die"):
		print("Player die")
		player.die()
		player.set_physics_process(false)
		player.set_process(false)
		await get_tree().create_timer(1.0).timeout
		Engine.time_scale = 0.5
		get_tree().reload_current_scene()
	
func get_bubble_health():
	return bubble_health

func set_bubble_health(health: int):
	bubble_health = health
	progress_bar.value = bubble_health
	
func _on_health_timer_timeout():
	if is_taking_damage:
		decrement_bubble_health()

func _on_player_body_entered(body: Node2D):
	if body.is_in_group("TileMapLayer"):
		if not is_taking_damage:
			is_taking_damage = true
			health_timer.start()
			print("Started taking damage.")

func _on_player_body_exited(body: Node2D):
	if body.is_in_group("TileMapLayer"):
		is_taking_damage = false
		health_timer.stop()
		print("Stopped taking damage.")
	
