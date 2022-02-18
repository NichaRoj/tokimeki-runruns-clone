extends Camera2D

onready var player = get_node("../Player")
var current_position

func _process(delta):
	if position.x < player.position.x:
		position.x = player.position.x
