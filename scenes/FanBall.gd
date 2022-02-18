extends Area2D

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("Human"):
		var fan = preload("res://scenes/Fan.tscn").instance()
		fan.position = self.position
		get_parent().add_child(fan)
		get_parent().remove_child(self)
