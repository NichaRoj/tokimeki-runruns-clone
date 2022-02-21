extends Node2D

onready var global = get_node('/root/GlobalVariables')
onready var scorePanel = $Camera/ScorePanel
onready var score = $Camera/ScorePanel/VBoxContainer/Score

func _ready():
	global.reset_fan_count()
