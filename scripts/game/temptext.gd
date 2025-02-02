extends RichTextLabel
@onready var rich_text_label: RichTextLabel = $"."

@onready var timer_2: Timer = $Timer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_2.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_2_timeout() -> void:
	rich_text_label.hide()
