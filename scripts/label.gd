extends Label
@onready var label: Label = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Rocket pieces collected : " + str(Global.coins)+"/7"
