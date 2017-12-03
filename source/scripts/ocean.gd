extends Node

# Water
var water_tile = load("res://scenes/Water.xml")
var size = Vector2(8, 8)
var tile_size = Vector2(16, 16)
var bounds = Vector2(size.x * tile_size.x, size.y * tile_size.y)

# Fish
var fish = load("res://scenes/Fish.xml")
const fish_population = 1

func _ready():
	# Fill ocean with water and life	
	for x in range(size.x):
		for y in range(size.y):
			var instance = water_tile.instance()
			instance.set_pos(Vector2(x * tile_size.x, y * tile_size.y))
			add_child(instance, false)
	
	for i in range(fish_population):
		var instance = fish.instance()
		var fish_pos = Vector2(rand_range(0, size.x * tile_size.x), rand_range(0, size.y * tile_size.y))
		instance.set_pos(Vector2(fish_pos))
		instance.set_rot(rand_range(0, PI * 2))
		
		add_child(instance, false)
	pass
