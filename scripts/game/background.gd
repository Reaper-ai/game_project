extends ParallaxBackground

@export var scroll_speed: float = 100.0  # Background scroll speed

func _process(delta):
	scroll_offset.y += scroll_speed * delta
