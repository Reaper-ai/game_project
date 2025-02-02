extends Area2D

signal player_won

func _on_body_entered(body: Node2D) -> void:
	
	if Global.coins == 7:
		get_tree().change_scene_to_file("res://scenes/scene2.tscn")
