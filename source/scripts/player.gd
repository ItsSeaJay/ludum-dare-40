extends Node2D

# Movement
var transform = get_transform()
var speed = 64
var torque = 4	# How far the player turns in degrees
var direction = 0

func _ready():
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("accelerate"):
		accelerate(delta)
	
	if Input.is_action_pressed("turn_left"):
		turn_left()
	
	if Input.is_action_pressed("turn_right"):
		turn_right()
	
	set_rotd(direction)

func accelerate(delta):
	translate(Vector2(sin(get_rot()) * speed, cos(get_rot()) * speed) * delta)

func turn_left():
	direction += torque

func turn_right():
	direction -= torque