extends Node

# Water
var water_tile = load("res://scenes/Water.xml")
var size = Vector2(32, 32)
var tile_size = Vector2(16, 16)

# Fish
var fish = load("res://scenes/Fish.xml")

func _ready():
	# Fill ocean with water and life	
	for x in range(size.x):
		for y in range(size.y):
			var instance = water_tile.instance()
			instance.set_pos(Vector2(x * tile_size.x, y * tile_size.y))
			add_child(instance, false)
			
			instance = fish
	pass
