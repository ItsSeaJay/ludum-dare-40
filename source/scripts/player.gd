extends Node2D

var transform = get_transform()
var speed = 0.33
var torque = 3	# How far the player turns in degrees
var direction = 0;

func _ready():
	set_process(true)
	pass

func _process(delta):
	if Input.is_action_pressed("accelerate"):
		accelerate()
	
	if Input.is_action_pressed("turn_left"):
		turn_left()
	
	if Input.is_action_pressed("turn_right"):
		turn_right()
	
	set_rotd(direction)

func accelerate():
	translate(Vector2(speed, 0))

func turn_left():
	direction += torque

func turn_right():
	direction -= torque