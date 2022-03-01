extends Node2D

onready var global = get_node('/root/GlobalVariables')
onready var music_player = get_node("/root/MusicPlayer")

func _ready():
	global.reset_fan_count()
	music_player.play_run_music()
