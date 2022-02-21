extends Area2D

onready var global = get_node("/root/GlobalVariables")
var fan

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("Human"):
		$Fan.visible = true
		$Fan.sleeping = false
		$Sprite.visible = false
		remove_child($Collision)
		global.inc_running_fans()
