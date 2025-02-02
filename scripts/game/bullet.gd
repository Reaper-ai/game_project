extends Area2D

@export var velocity: Vector2 = Vector2(0, -600)  # Bullet moves upwards
@export var lifespan: float = 5.0  # Bullet lifespan
signal bullet_collided_with_asteroid(asteroid)


func _ready():
	await get_tree().create_timer(lifespan).timeout
	queue_free()  

func _process(delta: float) -> void:
	position += velocity * delta  

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroid"):  


		emit_signal("bullet_collided_with_asteroid", area)
		queue_free()  
		area.queue_free()
