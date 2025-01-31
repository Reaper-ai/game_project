extends Node

var opening = "Axton, a skilled engineer and space explorer, embarked on a journey to explore the distant planet system of Xylonia. His mission was to gather and study data on the system for potential for future habitation."
var theCrash = "En route to Xylonia, Axton's spacecraft encountered unexpected asteroid debris. Despite his best efforts, the ship suffered catastrophic damage and crash-landed on the uncharted planet"
var objective = "Axton survived the crash but found himself stranded on a hostile alien world. His ship lies in ruins, its communication equipment destroyed. With limited supplies and no way to call for help, Axton must rely on his ingenuity and resourcefulness to survive."
const TIME : int = 1
# Called when the node enters the scene tree for the first time.

func scene1():
	$Label.hide()
	$scene1.modulate = Color(1,1,1,0)
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("opening")
	$RichTextLabel1.visible_ratio = 0
	$RichTextLabel1.text = opening
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("text") 
	await get_tree().create_timer(5).timeout
	$Label.show()
	
	

func _process_input():
	pass
		

func _ready():
	scene1()
	
	
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
