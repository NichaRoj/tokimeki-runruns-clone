extends RigidBody2D

onready var _animated_sprite = $AnimatedSprite
var is_touching_floor = true
var is_touching_bottom = false
var has_passed_goal = false
var NYOOM_RANGE = 450

func _ready():
	_animated_sprite.play("default")
	
func _process(_delta):
	if not visible:
		sleeping = true
	
func _integrate_forces(state):
	# slow down at the bottom
	if is_touching_bottom:
		state.linear_velocity = Vector2(200, 0)
		state.angular_velocity = 0
		rotation = 0
		return
	
	# prevent leaning
	if rotation < 0:
		state.apply_torque_impulse(1000)
	
	# nyooom when touching the ground
	if is_touching_floor and state.linear_velocity.x < NYOOM_RANGE:
		state.apply_impulse(Vector2.UP * 10, Vector2(100, 100 * rotation))

func set_touching_floor(b):
	is_touching_floor = b

func set_touching_bottom(b):
	is_touching_bottom = b

func set_passed_goal(b):
	has_passed_goal = true
