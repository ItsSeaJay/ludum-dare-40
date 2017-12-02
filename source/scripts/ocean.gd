extends Node

var water_node = preload("res://scenes/Water.xml")

func _ready():
	var instance = water_node.instance()
	add_child(water_node)
	pass
