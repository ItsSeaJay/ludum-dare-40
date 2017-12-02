extends Node2D

var screen = 0

func _ready():
	set_process(true)
	
	var screen_size = OS.get_screen_size(screen)
	var window_size = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)
	pass

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
	if Input.is_key_pressed(KEY_F5):
		get_tree().reload_current_scene()