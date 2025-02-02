extends Area2D
@onready var coin: Area2D = $"."



func _on_body_entered(body: Node2D) -> void:
	Global.last_coin_x = coin.position.x
	Global.last_coin_y = coin.position.y
	print("i am coin")
	Global.coins+=1
	queue_free()
