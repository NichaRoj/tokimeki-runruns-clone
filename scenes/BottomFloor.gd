extends StaticBody2D

func _ready():
	$TopArea.connect("body_entered", self, "_on_body_entered_top_area")
	$Boundary.connect("body_entered", self, "_on_body_entered_boundary")
	
func _on_body_entered_top_area(body):
	if body.name == "Player":
		body.set_touching_bottom(true)

func _on_body_entered_boundary(body):
	if body.is_in_group("Fan"):
		body.out_of_bound()
