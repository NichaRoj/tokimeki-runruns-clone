extends Node2D

onready var global = get_node('/root/GlobalVariables')

func _ready():
	global.reset_fan_count()
	
	var num_fans = get_tree().get_nodes_in_group("Fan").size()
	global.set_all_fans(num_fans)
