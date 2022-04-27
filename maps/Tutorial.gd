extends Control

onready var global = get_node("/root/GlobalVariables")

func _ready():
	$StartButton.connect("pressed", self, "_on_start_pressed")
	
func _on_start_pressed():
	global.has_seen_tutorial = true
	get_tree().change_scene("res://maps/WorldMap.tscn")
