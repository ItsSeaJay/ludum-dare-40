extends Node2D

enum states { normal, scared, curious, hooked, pause }
var current_state = states.normal
var ocean
var bobber = load("res://scenes/Bobber.xml")
var max_speed = rand_range(8, 16)
var drag = 0.128
var velocity
var torque = rand_range(1, 2)
var angle = 0
var direction
var fov = 60
# AI
var swim_timer = 0
var max_swim_time = rand_range(4, 8)
enum turn { none, left, right }
var turn_direction = turn.none
var turn_timer = 0
var max_turn_time = rand_range(0, 16)
var reset_timer = 0
var max_reset_timer = rand_range(.128, 1)
var player

func _ready():
	ocean = get_node("../../Ocean")
	player = get_node("../../Player")
	set_process(true)
	turn_timer = max_turn_time

func _process(delta):
	handle_state(current_state, delta)
	screen_wrap()
	
	velocity = max(0, velocity - drag)
	
	update_rotation()

func _draw():
	pass

func handle_state(state, delta):
	if current_state == states.normal:
		# Swim forward, watch out for danger
		velocity = max_speed
		swim(delta)
		swim_timer = max(0, swim_timer - delta)
		turn_randomly(delta)
		
		if player_visible(fov):
			print("Player Spotted!")
		pass
	elif current_state == states.scared:
		# Flee from danger
		pass
	elif current_state == states.curious:
		# Drawn towards the player's lure
		pass
	elif current_state == states.hooked:
		# Immobilised, ready to be caught by the player
		pass
	else:
		pass

func player_visible(fov):
	var difference = pos_angle_difference(get_pos(), player.get_pos())
	
	if difference > -fov && difference < fov:
		print("Player Sighted")
		pass
	pass

func update_rotation():
	set_rotd(angle)
	direction = Vector2(sin(angle), cos(angle))

func swim(delta):
	translate(Vector2(sin(get_rot()) * velocity, cos(get_rot()) * velocity) * delta)

func turn_randomly(delta):
	if swim_timer <= 0:
		# Choose turn direction
		if turn_direction == turn.none:
			turn_direction = randomise_turn_direction()
			reset_timer = max_reset_timer
		
		# Turn in that direction
		if turn_direction == turn.left:
			turn_left(torque)
		elif turn_direction == turn.right:
			turn_right(torque)
		
		# Wait for direction reset
		if turn_direction != turn.none:
			reset_timer = max(0, reset_timer - delta)
			
			if (reset_timer <= 0):
				swim_timer = max_swim_time
				turn_direction = turn.none
			pass

func randomise_turn_direction():
	var go = randi() % 2
	
	if go == 1:
		return turn.left
	else:
		return turn.right
	pass

func turn_left(amount):
	angle += amount
	pass

func turn_right(amount):
	angle -= amount
	pass

func pos_angle_difference(first, second):
	return acos(cosine(first, second))
	pass

func cosine(first, second):
	return (dot_product(first, second)) / (dot_product(magnitude(first), magnitude(second)))
	pass

func dot_product(first, second):
	return (first.x * first.y) + (second.x * second.y)
	pass

func magnitude(vector):
	return sqrt((sqr(vector)) + (sqr(vector)))
	pass

func sqr(value):
	return value * value
	pass

func screen_wrap():
	if (get_pos().x > ocean.get("bounds").x):
		set_pos(Vector2(0, get_pos().y))
	
	if (get_pos().x < 0):
		set_pos(Vector2(ocean.get("bounds").x, get_pos().y))
	
	if (get_pos().y > ocean.get("bounds").y):
		set_pos(Vector2(get_pos().x, 0))
	
	if (get_pos().y < 0):
		set_pos(Vector2(get_pos().x, ocean.get("bounds").y))