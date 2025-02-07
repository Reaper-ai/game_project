extends Node

func _ready():
	# Load Scene0 and add it to the scene tree
	var scene1 = $CUTSCENE1
	AudioStreamPlayer2d.play_music(1)
	# Connect the scene_completed signal to the on_scene0_completed function
	scene1.connect("cutscene1_over", Callable(self, "_on_scene1_completed"))

func _on_scene1_completed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
