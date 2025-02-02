extends Node
signal cutscene4_over

var txt = "[color=red]24,122 hrs since the crash[/color]\n\n Axton finally managed to escape the unknown planet. \n[color=green][font_size=80]\nTHE END[/font_size][/color]"
var credits = "[center][font_size=50]\nGaurav Upreti\n\nJuss Patel\n\nLalruatmawia Hmar\n\n[/font_size][/center]"
# Called when the node enters the scene tree for the first time.
func _ready():
	
	# scene 1
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = "[center]" + txt  + "[/center]"
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(10).timeout
	

	#scene2
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = credits 
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(10).timeout
	
	emit_signal("cutscene4_over")
