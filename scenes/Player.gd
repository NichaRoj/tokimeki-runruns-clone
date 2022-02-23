extends RigidBody2D

var is_touching_floor = true
var is_touching_bottom = false
var is_resting = false
var resting_invul = false
var has_passed_goal = false
var NYOOM_RANGE = 450

func _ready():
	$AnimatedSprite.play("default")
	$RestTimer.connect("timeout", self, "_on_rest_timeout")
	$RestInvulTimer.connect("timeout", self, "_on_rest_invul_timeout")
	
func _process(_delta):
	if not visible:
		sleeping = true
	
func _integrate_forces(state):
	# stop all movement when touching rest ball
	if is_resting:
		$AnimatedSprite.play("resting")
		sleeping = true
		
		# start timer on rest and rest_invul
		if $RestTimer.time_left == 0:
			$RestTimer.start()
		if $RestInvulTimer.time_left == 0:
			$RestInvulTimer.start()
		
		return
	
	# slow down at the bottom screen
	if is_touching_bottom:
		state.linear_velocity = Vector2(200, 0)
		state.angular_velocity = 0
		rotation = 0
		return
	
	# use falling animation
	if not is_touching_floor:
		$AnimatedSprite.play("falling")
	else:
		$AnimatedSprite.play("default")
		
	# prevent leaning
	if rotation < 0:
		state.apply_torque_impulse(1000)
	
	# nyooom when touching the ground
	if is_touching_floor and state.linear_velocity.x < NYOOM_RANGE:
		state.apply_impulse(Vector2.UP * 10, Vector2(100, 100 * rotation))
		
func _on_rest_timeout():
	$AnimatedSprite.play("default")
	is_resting = false
	sleeping = false
	
func _on_rest_invul_timeout():
	resting_invul = false

func set_touching_floor(b):
	is_touching_floor = b

func set_touching_bottom(b):
	is_touching_bottom = b

func set_passed_goal(b):
	has_passed_goal = true

func set_resting(b):
	if not resting_invul:
		is_resting = true
		resting_invul = true
		
