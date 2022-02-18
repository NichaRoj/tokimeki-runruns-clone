extends Line2D

var is_released = false

func _ready():
	$LifeTimer.connect("timeout", self, "_on_life_timeout")
	$ThanosTimer.connect("timeout", self, "_on_thanos_timeout")

func _process(delta):
	if not is_released and  Input.is_action_pressed("draw"):
		add_point(get_global_mouse_position())
		
	if Input.is_action_just_released("draw"):
		is_released = true
		$LifeTimer.start()

func _on_life_timeout():
	$ThanosTimer.start()
	
func _on_thanos_timeout():
	if points.size() > 0:
		remove_point(0)
	else:
		$ThanosTimer.stop()
		get_parent().remove_child(self)
	

