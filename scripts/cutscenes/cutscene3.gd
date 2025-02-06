extends Node

signal cutscene3_over

var txt = "[color=red]22,108 hrs since the crash[/color]\n\n 'main system online' Axton heard a machine voice,his eyes lit up so did the ship's internal lightings. He can finally leave this planet and go back home. without any delay he performs the last check and turns on the engines.\n\n [color=green]T-200,199....3,2,1\n\n TAKE OFF[/color]"
var objective = "[color=red]22,122 hrs since the crash[/color]\n\n While travelling through Axton suddenly encountered a swarm of astroids heading towards it, however his shields are still on repair, help Axton survive till the sheilds come back online."
# Called when the node enters the scene tree for the first time.
func _ready():
	# scene 1
	#AudioStreamPlayer2d.play_music(1)
	$Sprite2D.hide()
	$RichTextLabel2.hide()
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = "[center]" + txt  + "[/center]"
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(10).timeout
	AudioStreamPlayer2d.stop_music()
	await get_tree().create_timer(3).timeout
	# scene 2
	$RichTextLabel.visible_ratio = 0
	#$RichTextLabel.add_theme_font_size_override("font_size", 1)
	$RichTextLabel.visible_ratio = 1
	await get_tree().create_timer(3).timeout
	AudioStreamPlayer2d.play_music(2)
	$RichTextLabel.text = "[center]\n\n\n[color=red]BUT[/color][/center]"
	$AnimationPlayer.play("but")
	await get_tree().create_timer(5).timeout	
	
	# scene 3
	$RichTextLabel.hide()
	$Sprite2D.show()
	$AnimationPlayer.play("warning")
	await get_tree().create_timer(3).timeout	
	$AnimationPlayer.pause()
	
	# scene 4 
	$Sprite2D.hide()
	$RichTextLabel.show()
	$RichTextLabel.visible_ratio=0
	$RichTextLabel.add_theme_font_size_override("normal_font_size",30)
	$RichTextLabel.text = "[center]" + objective + "[/center]" 
	await get_tree().create_timer(2).timeout	
	$AnimationPlayer.play("text")
	await get_tree().create_timer(13).timeout	
	
	emit_signal("cutscene3_over")
