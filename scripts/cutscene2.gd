extends Node

signal cutscene2_over

var txt = "[color=red]21,988 hrs since the crash[/color]\n\n After hrs of gruelling hrs of foraging and repairing, Axton gathered all the scattered parts he could and mended them back together. The rocket is now ready for takeoff, but the control panel is still damaged."
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = "[center]" + txt  + "[center]"
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(12).timeout
	emit_signal("cutscene2_over")
