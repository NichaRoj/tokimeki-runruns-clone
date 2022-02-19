extends Line2D

var is_released = false

func _ready():
	$Area.connect("body_entered", self, "_on_body_entered")
	$Area.connect("body_exited", self, "_on_body_exited")
	$LifeTimer.connect("timeout", self, "_on_life_timeout")
	$ThanosTimer.connect("timeout", self, "_on_thanos_timeout")
	# The countdown starts right away cuz of-effing-course
	$LifeTimer.start()

func _process(delta):
	if not is_released and  Input.is_action_pressed("draw"):
		add_point(get_global_mouse_position())
		update_collision()
		
	if Input.is_action_just_released("draw"):
		is_released = true

func _on_life_timeout():
	$ThanosTimer.start()
	
func _on_thanos_timeout():
	if points.size() > 0:
		remove_point(0)
	else:
		$ThanosTimer.stop()
		get_parent().remove_child(self)
		
func _on_body_entered(body):
	if body.is_in_group("Human"):
		body.set_touching_floor(true)
		
func _on_body_exited(body):
	if body.is_in_group("Human"):
		body.set_touching_floor(false)

# https://kidscancode.org/godot_recipes/2d/line_collision/
func update_collision():
	if points.size() < 2:
		return
	var point_a = points[points.size() - 2]
	var point_b = points[points.size() - 1]
	
	var shape_position = (point_a + point_b) / 2
	var shape_rotation = point_a.direction_to(point_b).angle() + (PI / 2)
	var shape_height = point_a.distance_to(point_b)
	
	# Collision
	var collision = CollisionShape2D.new()
	collision.shape = CapsuleShape2D.new()
	collision.shape.height = shape_height
	collision.shape.radius = 5
	collision.position = shape_position
	collision.rotation = shape_rotation
	$Collisions.add_child(collision)
	
	# Area
	var area = CollisionShape2D.new()
	area.shape = CapsuleShape2D.new()
	area.shape.height = shape_height
	area.shape.radius = 10
	area.position = shape_position
	area.rotation = shape_rotation
	$Area.add_child(area)
