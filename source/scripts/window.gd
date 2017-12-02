extends Node2D

var screen = 0

func _ready():
	var screen_size = OS.get_screen_size(screen)
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)
	pass
