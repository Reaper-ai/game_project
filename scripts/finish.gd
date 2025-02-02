extends Area2D

signal player_won

func _on_body_entered(body: Node2D) -> void:
	
	if Global.coins == 7:
		emit_signal("player_won")
