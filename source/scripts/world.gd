extends Node

var scene = load("res://scenes/Water.xml")

func _ready():
	var node = scene.instance()
	add_child(node)
	print("Testing")
	pass
