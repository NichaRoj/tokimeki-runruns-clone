extends StaticBody2D

func _ready():
	$Area2D.connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	if body.name == "Player":
		body.set_touching_bottom(true)
