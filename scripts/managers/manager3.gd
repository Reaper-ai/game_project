extends Node

func _ready():
	# Load Scene0 and add it to the scene tree
	var scene2 = $CUTSCENE2
	# Connect the scene_completed signal to the on_scene0_completed function
	scene2.connect("cutscene2_over", Callable(self, "_on_scene2_completed"))

func _on_scene2_completed():
	get_tree().change_scene_to_file("res://scenes/tile_puzzle.tscn")
