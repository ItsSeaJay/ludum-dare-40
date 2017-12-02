extends Node

var direction = 90
var velocity = 16

func _ready():
	set_process(true)
	pass

func _process(delta):
	set_rotd(direction)
	swim(delta)
	pass

func swim(delta):
	translate(Vector2(sin(get_rot()) * velocity, cos(get_rot()) * velocity) * delta)