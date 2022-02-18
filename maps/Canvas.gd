extends Node2D

var pencil_colors = [Color(1, 0, 0, 1), Color(0, 1, 0, 1), Color(0, 0, 1, 1)]
var pencil_color_tracker = 0

func _process(delta):
	if Input.is_action_just_pressed("draw"):
		var pencil = preload("res://scenes/Pencil.tscn").instance()
		pencil.default_color = pencil_colors[posmod(pencil_color_tracker, 3)]
		add_child(pencil)
		pencil_color_tracker += 1
