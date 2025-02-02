extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	Hurt.play_music()
	if get_parent().name.begins_with("icicle"):
			
		if Global.coins == 0:
			body.position.x = 46
			body.position.y = -34
		else:
			body.position.x = Global.last_coin_x
			body.position.y = Global.last_coin_y
	else:
		body.get_node("CollisionShape2D").queue_free()
		Global.coins = 0
		Global.last_coin_x = 0
		Global.last_coin_y = 0
		timer.start()
		
func _on_timer_timeout() -> void:
	
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Replace with function body.
