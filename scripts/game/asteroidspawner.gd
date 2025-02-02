extends Node2D

@export var asteroid_scene: PackedScene
@export var initial_spawn_interval: float = 1.0  
@export var spawn_rate_increase: float = 0.05  
@export var spawn_interval_min: float = 0.20  

var screen_width: float
var current_spawn_interval: float

func _ready():
	#print("Ready to start spawning!")  # Debug line
	screen_width = get_viewport_rect().size.x
	current_spawn_interval = initial_spawn_interval  
	start_spawning()

func start_spawning():
	while true:
		spawn_asteroid()
		await get_tree().create_timer(current_spawn_interval).timeout  
		increase_spawn_rate()  

func spawn_asteroid():
	if asteroid_scene:

		
		var asteroid = asteroid_scene.instantiate()  

		# Random spawn position across the screen
		var spawn_x = randf_range(0, screen_width)  
		asteroid.position = Vector2(spawn_x, -50)  

		# Random size scaling (50% to 150% of original size)
		var scale_factor = randf_range(0.5, 1.5)
		asteroid.scale = Vector2(scale_factor, scale_factor)

		# Random initial rotation
		asteroid.rotation = randf_range(0, TAU)  # TAU is 2 * PI (full circle)

		get_parent().add_child(asteroid)  

func increase_spawn_rate():
	current_spawn_interval = max(current_spawn_interval - spawn_rate_increase, spawn_interval_min)
