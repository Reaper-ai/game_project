extends Node2D

const SPEED = 130
var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		animated_sprite_2d.flip_h = true
		direction = -1
	if ray_cast_left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1	
	position.x += direction*SPEED*delta
