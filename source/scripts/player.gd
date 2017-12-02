extends Node2D

var ocean
var camera
var bobber = load("res://scenes/Bobber.xml")
var bobber_instance

var mouse_pos

var line_cast = false

# Movement
var transform = get_transform()
var speed = 64
var torque = 4	# How far the player turns in degrees
var direction = 0

func _ready():
	ocean = get_node("../Ocean")
	camera = get_node("Camera2D")
	
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("accelerate"):
		accelerate(delta)
	
	if Input.is_action_pressed("turn_left"):
		turn_left()
	
	if Input.is_action_pressed("turn_right"):
		turn_right()
	
	if Input.is_action_pressed("fishing_rod") && line_cast == false:
		bobber_instance = bobber.instance()
		instance.set_pos(mouse_pos)
		add_child(bobber_instance, true)
		line_cast = true
	
	if Input.is_action_pressed("fishing_rod") && line_cast == false:
		remove_child(bobber_instance, true)
		line_cast = false
	
	set_rotd(direction)
	screen_wrap()
	mouse_pos = get_local_mouse_pos()

func accelerate(delta):
	translate(Vector2(sin(get_rot()) * speed, cos(get_rot()) * speed) * delta)

func turn_left():
	direction += torque

func turn_right():
	direction -= torque

func screen_wrap():
	if (get_pos().x > ocean.get("bounds").x):
		set_pos(Vector2(0, get_pos().y))
	
	if (get_pos().x < 0):
		set_pos(Vector2(ocean.get("bounds").x, get_pos().y))
	
	if (get_pos().y > ocean.get("bounds").y):
		set_pos(Vector2(get_pos().x, 0))
	
	if (get_pos().y < 0):
		set_pos(Vector2(get_pos().x, ocean.get("bounds").y))