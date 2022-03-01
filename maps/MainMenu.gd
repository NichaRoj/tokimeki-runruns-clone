extends Control

onready var global = get_node("/root/GlobalVariables")
onready var music_player = get_node("/root/MusicPlayer")

func _ready():
	$StartButton.connect("pressed", self, "_on_start_pressed")
	music_player.play_title_music()
	
func _on_start_pressed():
	if global.has_seen_tutorial:
		get_tree().change_scene("res://maps/WorldMap.tscn")
	else:
		get_tree().change_scene("res://maps/Tutorial.tscn")
