extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	Hurt.play_music()
			
	if Global.checkpoint==0:
		body.position.x = 46
		body.position.y = -34
	else:
		if Global.checkpoint == 1:
			body.position= Vector2(663, -195)

		elif Global.checkpoint == 2:
			body.position = Vector2(968,-244)

		else:
			body.position = Vector2(1070,-437)
		
func _on_timer_timeout() -> void:
	
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Replace with function body.
