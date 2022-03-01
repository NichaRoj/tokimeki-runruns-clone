extends AudioStreamPlayer

onready var title_music = preload("res://assets/sound/POL-watch-and-learn-short.wav")
onready var map_music = preload("res://assets/sound/POL-summer-deal-short.wav")
onready var run_music = preload("res://assets/sound/POL-hello-sunshine-short.wav")

func _ready():
	play()

func play_title_music():
	stream = title_music
	play()
	
func play_map_music():
	stream = map_music
	play()
	
func play_run_music():
	stream = run_music
	play()
