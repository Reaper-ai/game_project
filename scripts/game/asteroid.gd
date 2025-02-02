extends Area2D

@export var speed: float = 200.0
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer

func _process(delta):
	position.y += speed * delta  # Move downward

	# Destroy asteroid when it leaves the screen
	if position.y > get_viewport_rect().size.y:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("rocket"):
		audio_stream_player_2d.play()  # Play sound
		timer.start(0.3)  # Start the timer with a 1-second delay
		timer.set_meta("body", body)
		timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	elif body.is_in_group("bullet"):
		body.queue_free()  # Destroy bullet
		queue_free()  # Destroy asteroid
 # Replace with function body.
func _on_bullet_collided_with_asteroid(bullet):
	queue_free()  # Destroy the asteroid when the bullet hits it


func _on_timer_timeout() -> void:
	var body = timer.get_meta("body")  # Retrieve the body from the timer's metadata
	body.queue_free()  # Destroy the rocket
	queue_free()  # Destroy the asteroid
	get_tree().change_scene_to_file("res://scenes/game3.tscn")
