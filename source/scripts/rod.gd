extends Node2D

var bobber = load("res://scenes/Bobber.xml")
var bobber_instance = bobber.instance()
var cast = false
var pressed = false

const max_slack = 128

func _ready():
	set_process(true)
	pass

func _process(delta):
	update()
	
	if Input.is_action_pressed("fishing_rod") && !pressed:
		if cast:
			reel()
		else:
			cast()
		pressed = true
	elif !Input.is_action_pressed("fishing_rod") && pressed:
		pressed = false
	
	if cast:
		var line_slack = distance(bobber_instance.get_pos(), get_global_pos())
		if line_slack >= max_slack:
			reel()

func _draw():
	var inv = get_global_transform().inverse()
	draw_set_transform(inv.get_origin(), inv.get_rotation(), inv.get_scale())
	
	if cast:
		draw_line(get_global_pos(), bobber_instance.get_global_pos(), Color(0, 0, 0), 1)

func cast():
	bobber_instance.set_pos(get_global_mouse_pos())
	get_tree().get_root().get_node("World").add_child(bobber_instance, false)
	cast = true

func reel():
	get_tree().get_root().get_node("World").remove_child(bobber_instance)
	cast = false

func sqr(value):
	return value * value

func distance(first_pos, second_pos):
	return sqrt(sqr(first_pos.x - second_pos.x) + sqr(first_pos.y - second_pos.y))