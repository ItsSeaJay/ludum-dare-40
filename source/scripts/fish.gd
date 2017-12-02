extends Node2D

enum states {normal, scared, curious, hooked}
var current_state = states.normal
var ocean
var bobber = load("res://scenes/Bobber.xml")
var max_speed = rand_range(8, 16)
var drag = 0.1
var velocity
var torque = 1
var direction = 0

func _ready():
	ocean = get_node("../../Ocean")
	set_process(true)

func _process(delta):
	handle_state(current_state, delta)
	screen_wrap()
	
	velocity = max(0, velocity - drag)
	
	set_rotd(direction)
func _draw():
	pass

func handle_state(state, delta):
	if current_state == states.normal:
		velocity = max_speed
		swim(delta)
		pass
	elif current_state == states.scared:
		pass
	elif current_state == states.curious:
		pass
	elif current_state == states.hooked:
		pass
	else:
		pass

func swim(delta):
	translate(Vector2(sin(get_rot()) * velocity, cos(get_rot()) * velocity) * delta)

func turn_left(amount):
	direction += amount
	pass

func turn_right(amount):
	direction -= amount
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