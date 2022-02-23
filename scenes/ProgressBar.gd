extends Control

onready var global = get_node("/root/GlobalVariables")

	
func _process(_delta):
	$GreenBar.max_value = global.all_fans
	$BlueBar.max_value = global.all_fans
	
	$GreenBar.value = global.running_fans
	$BlueBar.value = global.running_fans - global.fallen_fans
