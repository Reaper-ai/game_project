extends Node

signal cutscene0_over
var txt = "[color=red]Brokenness[/color] is not the [color=red]end[/color], but a [color=aqua]new beginning.[/color]\n\n\n– a [color=aqua]chance[/color] to [color=green]rebuild[/color], to [color=green]restart[/color], and to [color=green]rediscover.[/color]" 
var disclaimer = "[center][color=orange][b]Disclaimer :[/b] \n seizure warning! player discreation is advised.[/color][/center]"
# Called when the node enters the scene tree for the first time.
func play():
	$RichTextLabel.text = "[center]" + txt + "[/center]"
	fade_in()
	await get_tree().create_timer(2).timeout
	
	$Disclaimer.visible_ratio = 0
	$Disclaimer.text = disclaimer
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(5).timeout
	emit_signal("cutscene0_over")

func _ready():
	play()

func fade_in():
	# Create a Tween
	$RichTextLabel.modulate.a = 0 
	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween()
	# Animate the opacity from 0 to 1 over 2 seconds
	tween.tween_property($RichTextLabel, "modulate:a", 1, 5).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT) 
