extends Node

signal puzzle_solved 
var new_texture = preload("res://assets/visual/tiles.png")
# Called when the node enters the scene tree for the first time.

func _ready():
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("glow")


func _on_main_win():
	await get_tree().create_timer(1).timeout
	$main/Tile9.texture = new_texture
	await get_tree().create_timer(3).timeout
	emit_signal("puzzle_solved")
