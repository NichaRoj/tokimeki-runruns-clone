extends Control

onready var global = get_node("/root/GlobalVariables")
onready var music_player = get_node("/root/MusicPlayer")

func _ready():
	music_player.play_map_music()
