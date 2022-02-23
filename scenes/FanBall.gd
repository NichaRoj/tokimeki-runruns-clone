extends Area2D

onready var global = get_node("/root/GlobalVariables")

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("area_entered", self, "_on_area_entered")
	connect("area_exited", self, "_on_area_exited")
	connect("visibility_changed", self, "_on_area_exited")
	
func _on_area_entered(area):
	if visible and area.name == "Camera":
		add_to_group("OnScreen")
		
func _on_area_exited(area):
	if area.name == "Camera" or not visible:
		remove_from_group("OnScreen")

func _on_body_entered(body):
	if body.is_in_group("Human"):
		pop_ball()

func pop_ball():
	$Fan.visible = true
	$Fan.sleeping = false
	$Sprite.visible = false
	remove_child($Collision)
	global.inc_running_fans()
