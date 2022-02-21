extends Node

var all_fans = 0
var running_fans = 0
var fallen_fans = 0
var collected_fans = 0

func _ready():
	all_fans = get_tree().get_nodes_in_group("Fan").size()

func set_all_fans(n):
	all_fans = n
	print('all_fans', all_fans)

func inc_running_fans():
	running_fans += 1
	print('running_fans', running_fans)

func inc_fallen_fans():
	fallen_fans += 1
	print('fallen_fans', fallen_fans)
	
func inc_collected_fans():
	collected_fans += 1
	print('collected_fans', collected_fans)
	
func reset_fan_count():
	all_fans = get_tree().get_nodes_in_group("Fan").size()
	running_fans = 0
	fallen_fans = 0
	collected_fans = 0
