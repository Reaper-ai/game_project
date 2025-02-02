extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ran = [0,16].pick_random()
	region_rect.position.x = 48
	region_rect.position.y = ran
	region_rect.size.x =16
	region_rect.size.y=16
