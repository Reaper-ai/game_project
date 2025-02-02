extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.position.x = 46
	body.position.y = -34
