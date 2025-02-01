extends Label

signal skipped

func _ready():
	pass

func _process(delta):
	# if lable is visible and skip is pressed 
	if visible and Input.is_action_just_pressed("skip"):
		emit_signal("skipped")
		await get_tree().create_timer(1).timeout
