extends Node2D

enum states {normal, scared, curious, hooked}
var current_state = states.normal
var ocean
var bobber = load("res://scenes/Bobber.xml")
var max_speed = rand_range(8, 16)
var velocity = 0
var drag = 0.1

func _ready():
	ocean = get_node("../../Ocean")
	velocity = max_speed
	set_process(true)

func _process(delta):
	handle_state(current_state)
	screen_wrap()
	translate(Vector2(sin(get_rot()) * velocity, cos(get_rot()) * velocity) * delta)
	velocity = max(0, velocity - drag)
func _draw():
	pass

func handle_state(state):
	if current_state == states.normal:
		pass
	elif current_state == states.scared:
		pass
	elif current_state == states.curious:
		pass
	elif current_state == states.hooked:
		pass
	else:
		pass

func screen_wrap():
	if (get_pos().x > ocean.get("bounds").x):
		set_pos(Vector2(0, get_pos().y))
	
	if (get_pos().x < 0):
		set_pos(Vector2(ocean.get("bounds").x, get_pos().y))
	
	if (get_pos().y > ocean.get("bounds").y):
		set_pos(Vector2(get_pos().x, 0))
	
	if (get_pos().y < 0):
		set_pos(Vector2(get_pos().x, ocean.get("bounds").y))