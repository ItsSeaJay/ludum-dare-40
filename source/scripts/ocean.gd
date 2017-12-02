extends Node

var water_tile = load("res://scenes/Water.xml")
var ocean_size = Vector2(2, 2)
var tile_size = Vector2(16, 16)

func _ready():
	#for i in range(ocean_size.x):
	#	for j in range(ocean_size.y):
	#		print("Stamp!")
	#		var instance = water_tile.instance()
	#		instance.set_pos(Vector2(i, j))
	#		add_child(water_tile, false)
	
	var instance = water_tile.instance()
	add_child(water_tile)
	pass
