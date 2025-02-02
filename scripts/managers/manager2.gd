extends Node
func _ready():
	# Load Scene0 and add it to the scene tree
	var scene1 = $Game
	#scene1.play()
	# Connect the scene_completed signal to the on_scene0_completed function
	scene1.connect("player_won", Callable(self, "_on_game1_completed"))

func _on_game1_completed():
	get_tree().change_scene_to_file("res://scenes/scene2.tscn")
