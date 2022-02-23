extends Control

onready var global = get_node("/root/GlobalVariables")
onready var _start_btn = $Page1/StartButton

func _ready():
	_start_btn.connect("pressed", self, "_on_start_pressed")
	
func _on_start_pressed():
	global.has_seen_tutorial = true
	get_tree().change_scene("res://maps/WorldMap.tscn")
