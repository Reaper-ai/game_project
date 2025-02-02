extends AudioStreamPlayer2D
const fx = preload("res://assets/sounds/hurt.mp3")
func _play_music(music,volume = 0.0):
	stream = music
	volume_db = volume
	play()
	

func play_music():
	_play_music(fx)
