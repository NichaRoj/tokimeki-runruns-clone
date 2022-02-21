extends Camera2D

onready var global = get_node("/root/GlobalVariables")
onready var goal = get_node("../Goal")
onready var player = get_node("../Player")
onready var btn_continue = $Menu/VBoxContainer/Continue
onready var btn_restart = $Menu/VBoxContainer/Restart
onready var btn_back = $Menu/VBoxContainer/Back
onready var score_btn_restart = $ScorePanel/VBoxContainer/HBoxContainer/Restart
onready var score_btn_back = $ScorePanel/VBoxContainer/HBoxContainer/Back


func _ready():
	btn_continue.connect("pressed", self, "_on_continue_pressed")
	btn_restart.connect("pressed", self, "_on_restart_pressed")
	btn_back.connect("pressed", self, "_on_back_pressed")
	
	score_btn_restart.connect("pressed", self, "_on_restart_pressed")
	score_btn_back.connect("pressed", self, "_on_back_pressed")

func _process(delta):
	if position.x < player.position.x and position.x < goal.position.x:
		position.x = player.position.x
		
	if player.has_passed_goal and global.running_fans == global.collected_fans + global.fallen_fans:
		get_tree().paused = true
		$ScorePanel/VBoxContainer/Score.text = String(global.collected_fans) + '/' + String(global.all_fans)
		$ScorePanel.visible = true

func _input(event):
	if event.is_action_released("open_menu"):
		get_tree().paused = true
		$Menu.visible = true

func _on_continue_pressed():
	get_tree().paused = false
	$Menu.visible = false
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	
func _on_back_pressed():
	pass
