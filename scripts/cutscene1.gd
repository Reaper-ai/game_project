extends Node

var opening = "Axton, a skilled engineer and space explorer, embarked on a journey to explore the distant planet system of Xylonia. His mission was to gather and study data on the system for potential for future habitation."
var theCrash = "En route to Xylonia, Axton's spacecraft encountered unexpected asteroid debris. Despite his best efforts, the ship suffered catastrophic damage and crash-landed on the uncharted planet"
var objective = "Axton survived the crash but found himself stranded on a hostile alien world. His ship lies in ruins, its communication equipment destroyed. With limited supplies and no way to call for help, Axton must rely on his ingenuity and resourcefulness to survive."

func scene():
	
	# opening scene 
	$RichTextLabel2.hide()
	$scene2.hide()
	$scene1.modulate = Color(1,1,1,0)
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("opening")
	$RichTextLabel.visible_ratio = 0
	$RichTextLabel.text = opening
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(12).timeout
	
	# crashing scene 
	$RichTextLabel.visible_ratio = 0
	$scene1.hide()
	$scene2.show()
	$scene2.modulate = Color(1,1,1,0)
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("thecrash")
	$RichTextLabel.text = theCrash
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text")
	await get_tree().create_timer(12).timeout
	
	#objective screen
	$scene2.hide()
	$RichTextLabel.hide()
	$RichTextLabel2.show()
	$RichTextLabel2.visible_ratio = 0
	$RichTextLabel2.text = "[center]" + objective + "[center]"
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text2")
	await get_tree().create_timer(15).timeout

func _ready():
	scene()
		
