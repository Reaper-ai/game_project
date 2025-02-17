extends CharacterBody2D

const SPEED = 600.0  # Faster movement for better dodging
@export var bullet_scene: PackedScene  
@export var initial_shoot_delay: float = 0.5  
@export var shoot_delay_decrease: float = 0.002  
@export var min_shoot_delay: float = 0.4  
var shoot_delay: float  
var can_shoot = true  
var cam = load("res://scenes/camera_2d.tscn")

var screen_width: float
var screen_height: float
var rocket_half_width: float
var rocket_half_height: float
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var label: Label = $"../Label"
var time = 90
func _ready():

	$Sprite2D2.hide()
	var viewport_size = get_viewport_rect().size
	screen_width = viewport_size.x
	screen_height = viewport_size.y

	var rocket_size = $Sprite2D.get_texture().get_size() * scale  
	rocket_half_width = rocket_size.x / 2
	rocket_half_height = rocket_size.y / 2

	shoot_delay = initial_shoot_delay  

func _physics_process(delta: float) -> void:
	label.text = (str(time)).split(".")[0]+"s"
	time = time-delta
	var direction_x = Input.get_axis("left", "right")  
	var direction_y = Input.get_axis("up", "down")  

	velocity.x = direction_x * SPEED
	velocity.y = direction_y * SPEED

	move_and_slide()

	position.x = clamp(position.x, rocket_half_width, screen_width - rocket_half_width)
	position.y = clamp(position.y, rocket_half_height, screen_height - rocket_half_height)

	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()
	
	#if Input.is_action_just_pressed("cheat"):		
	#	$"../Timer".emit_signal("timeout")
		
func shoot():
	if bullet_scene:
		audio_stream_player_2d.play()
		var bullet = bullet_scene.instantiate()
		bullet.position = position + Vector2(0, -50)  
		bullet.velocity = Vector2(0, -600)  
		get_parent().add_child(bullet)

		can_shoot = false  
		await get_tree().create_timer(shoot_delay).timeout  
		can_shoot = true  

		shoot_delay = max(shoot_delay - shoot_delay_decrease, min_shoot_delay)
		

func playScene():
	get_tree().call_group("astroids","queue_free")
	set_physics_process(false)
	$"../AnimationPlayer".play("zone")

func _on_timer_timeout() -> void:
	playScene()
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_file("res://scenes/scene4.tscn")
