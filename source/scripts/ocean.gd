extends Node

var water_node = preload("res://graphics/water_tile.png")

func _ready():
	get_tree().get_root().add_child(water_node, false)
	pass
