extends RigidBody2D

onready var global = get_node("/root/GlobalVariables")
onready var _animated_sprite = $AnimatedSprite
var is_touching_floor = true
var is_touching_bottom = false
var NYOOM_RANGE = 450

func _ready():
	_animated_sprite.play("default")
	
func _integrate_forces(state):
	# prevent leaning
	if rotation < 0:
		state.apply_torque_impulse(1000)
	
	# nyooom when touching the ground TODO: adjust fan physics
	if is_touching_floor and state.linear_velocity.x < NYOOM_RANGE:
		state.apply_impulse(Vector2.UP * 10, Vector2(200, 100 * rotation))

func set_touching_floor(b):
	is_touching_floor = b

func set_touching_bottom(b):
	is_touching_bottom = b

func out_of_bound():
	global.inc_fallen_fans()
	sleeping = true
