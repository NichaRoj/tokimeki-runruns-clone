extends Area2D

onready var global = get_node("/root/GlobalVariables")

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	if body.is_in_group("Fan"):
		global.inc_collected_fans()
		body.set_passed_goal(true)
	elif body.name == "Player":
		body.set_passed_goal(true)
