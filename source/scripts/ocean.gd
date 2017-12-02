extends Node

var water_node = preload("res://scenes/Water.xml")

func _ready():
	var instance = water_node.instance()
	instance.set_pos(Vector2(0, 0))
	get_tree().get_root().get_child(0).add_child(instance)
	pass
