extends Control

onready var global = get_node("/root/GlobalVariables")

func _ready():
	$GreenBar.value = 0
	$BlueBar.value = 0
	$GreenBar.max_value = global.all_fans
	$BlueBar.max_value = global.all_fans
	
func _process(_delta):
	$GreenBar.value = global.running_fans
	$BlueBar.value = global.running_fans - global.fallen_fans
