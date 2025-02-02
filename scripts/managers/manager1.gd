extends Node
func _ready():
	# Load Scene0 and add it to the scene tree
	var scene0 = get_node("CUTSCENE3")
	# Connect the scene_completed signal to the on_scene0_completed function
	scene0.connect("cutscene3_over", Callable(self, "_on_scene0_completed"))

func _on_scene0_completed():
	get_tree().change_scene_to_file("res://scenes/game3.tscn")
