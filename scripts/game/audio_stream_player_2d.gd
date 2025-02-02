extends AudioStreamPlayer2D

const level_music1 = preload("res://assets/sounds/dramatic.mp3")
const level_music2 = preload("res://assets/sounds/scary.mp3")
const level_music3 = preload("res://assets/sounds/ending.mp3")
func _play_music(music,volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func _stop_music():
	for i in range(20):
		await get_tree().create_timer(0.3125).timeout
		volume_db -= 2

func play_music(type):
	if type == 1:
		_play_music(level_music1)
	elif type == 2:
		_play_music(level_music2)
	elif type == 3:
		_play_music(level_music3)

func stop_music():
	_stop_music()
