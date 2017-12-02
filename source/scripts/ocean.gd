extends Node

var water_tile = load("res://scenes/Water.xml")
var ocean_size = Vector2(2, 2)
var tile_size = Vector2(16, 16)

func _ready():
	for x in range(ocean_size.x):
		for y in range(ocean_size.y):
			print("Stamp!")
			var instance = water_tile.instance()
			instance.set_pos(Vector2(x * tile_size.x, y * tile_size.y))
			add_child(instance, false)
	pass
