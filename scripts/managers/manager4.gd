extends Node

func _ready():
	# Load Scene0 and add it to the scene tree
	var scene1 = $Game
	# Connect the scene_completed signal to the on_scene0_completed function
	scene1.connect("puzzle_solved", Callable(self, "_on_game2_completed"))

func _on_game2_completed():
	get_tree().change_scene_to_file("res://scenes/scene3.tscn")
