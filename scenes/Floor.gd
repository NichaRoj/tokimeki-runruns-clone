extends StaticBody2D

func _ready():
	get_node("Area2D").connect("body_entered", self, "_on_body_entered")
	get_node("Area2D").connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body):
	print("entered")
	if body.is_in_group("Human"):
		body.set_touching_floor(true)
		
func _on_body_exited(body):
	print("exited")
	if body.is_in_group("Human"):
		body.set_touching_floor(false)
