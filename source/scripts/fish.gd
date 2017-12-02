extends Node2D

var ocean
var bobber = load("res://scenes/Bobber.xml")

var speed = rand_range(8, 16)

func _ready():
	ocean = get_node("../../Ocean")
	
	set_process(true)
	pass

func _process(delta):
	translate(Vector2(sin(get_rot()) * speed, cos(get_rot()) * speed) * delta)
	screen_wrap()
	
func screen_wrap():
	if (get_pos().x > ocean.get("bounds").x):
		set_pos(Vector2(0, get_pos().y))
	
	if (get_pos().x < 0):
		set_pos(Vector2(ocean.get("bounds").x, get_pos().y))
	
	if (get_pos().y > ocean.get("bounds").y):
		set_pos(Vector2(get_pos().x, 0))
	
	if (get_pos().y < 0):
		set_pos(Vector2(get_pos().x, ocean.get("bounds").y))