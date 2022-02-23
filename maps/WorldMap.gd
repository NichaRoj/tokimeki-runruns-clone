extends Control

onready var global = get_node("/root/GlobalVariables")
onready var portal_buttons = get_tree().get_nodes_in_group("Portal")

func _ready():
	for button in portal_buttons:
		button.connect("pressed", self, "_on_portal_pressed")
	
func _on_portal_pressed():
	get_tree().change_scene("res://maps/WorldMap.tscn")
