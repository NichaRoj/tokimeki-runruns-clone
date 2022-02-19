extends Camera2D

onready var player = get_node("../Player")
onready var btn_continue = $Menu/PanelContainer/VBoxContainer/Continue
onready var btn_restart = $Menu/PanelContainer/VBoxContainer/Restart
onready var btn_back = $Menu/PanelContainer/VBoxContainer/Back
var current_position

func _ready():
	btn_continue.connect("pressed", self, "_on_continue_pressed")
	btn_restart.connect("pressed", self, "_on_restart_pressed")
	btn_back.connect("pressed", self, "_on_back_pressed")

func _process(delta):
	if position.x < player.position.x:
		position.x = player.position.x

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
