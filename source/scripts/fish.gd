extends Node2D

var speed = rand_range(8, 16)

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(Vector2(sin(get_rot()) * speed, cos(get_rot()) * speed) * delta)