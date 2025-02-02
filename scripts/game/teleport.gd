extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Global.SPEED=0.0
	body.position.x = 65
	body.position.y = -34
	Global.SPEED = 120.0
