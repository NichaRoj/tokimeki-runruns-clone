extends Area2D

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	if body.name == "Player":
		var visibleFanBalls = get_tree().get_nodes_in_group("OnScreen")
		for fanball in visibleFanBalls:
			fanball.pop_ball()
		
		$Sprite.visible = false
		remove_child($Collision)
