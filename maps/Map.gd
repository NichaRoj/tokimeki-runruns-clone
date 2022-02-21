extends Node2D

onready var global = get_node('/root/GlobalVariables')

func _ready():
	global.reset_fan_count()
