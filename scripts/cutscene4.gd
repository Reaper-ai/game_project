extends Node
signal cutscene4_over

var txt = "[color=red]22,122 hrs since the crash[/color]\n\n Axton finally managed to escape the unknown planet. \n[color=green][font_size=80]\nTHE END[/font_size][/color]"
var credits = "[center]\nGaurav Upreti\n\nJuss Patel\n\nLalrautmawia Hamar\n\n[/center]"
# Called when the node enters the scene tree for the first time.
func _ready():
	
	# scene 1
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = "[center]" + txt  + "[/center]"
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(10).timeout
	emit_signal("cutscene4_over")

	#scene2
	
	#scene3
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = credits 
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(10).timeout
