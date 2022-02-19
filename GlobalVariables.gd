extends Node

var fallen_fans = 0
var collected_fans = 0

func inc_fallen_fans():
	fallen_fans += 1
	
func inc_collected_fans():
	collected_fans += 1
	
func reset_fan_count():
	fallen_fans = 0
	collected_fans = 0
