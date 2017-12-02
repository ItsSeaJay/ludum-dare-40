extends Node2D

var bobber = load("res://scenes/Bobber.xml")
var bobber_instance = bobber.instance()
var cast = false

func _ready():
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("fishing_rod") && !cast:
		cast()
	
	if Input.is_action_pressed("fishing_rod") && cast:
		reel()

func cast():
	bobber_instance.set_pos(get_global_mouse_pos())
	get_tree().get_root().add_child(bobber_instance, false)
	cast = true

func reel():
	get_tree().get_root().remove_child(bobber_instance)
	cast = false