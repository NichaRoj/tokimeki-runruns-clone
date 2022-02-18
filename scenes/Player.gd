extends RigidBody2D

onready var _animated_sprite = $AnimatedSprite
var is_touching_floor = true
var NYOOM_RANGE = 100

func _ready():
	_animated_sprite.play("default")
	bounce = 0.2
	friction = 0
	
func _integrate_forces(state):
	# prevent shaking
	if state.angular_velocity < 1 and state.angular_velocity > -1:
		state.angular_velocity = 0
	
	# nyooom when touching the ground
	if is_touching_floor and state.linear_velocity.x < NYOOM_RANGE and state.linear_velocity.x > -1 * NYOOM_RANGE and state.linear_velocity.y < NYOOM_RANGE and state.linear_velocity.y > -1 * NYOOM_RANGE:
		set_linear_velocity(Vector2(500, 0))
	
func set_touching_floor(b):
	is_touching_floor = b
	print("Touching", b)
