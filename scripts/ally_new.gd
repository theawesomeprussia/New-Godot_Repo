#-----------------------------------------------------------------------------
# Name:        Ally Movement Script (character_movement.gd)
# Purpose:     To control the movement and animation of the ally cat in the game
#
# References: 	Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------


extends CharacterBody2D

var speed = 60  
var player = null
var stop_distance = 30
var animated_sprite = null

func _ready():
	'''
	Initializes the script, called when the node is added to the scene.

	This function gets references to the player node and the AnimatedSprite2D node.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	player = get_parent().get_node("Player")
	animated_sprite = $AnimatedSprite2D

	print(animated_sprite)

func _physics_process(delta):
	'''
	Updates the character's position and animation each physics frame.

	This function moves the character towards the player if the player is
	farther than the stop distance, and updates the animation accordingly.

	Parameters
	----------
	delta : float
		The time elapsed since the last frame

	Returns
	-------
	None
	'''
	if player:
		var distance_to_player = position.distance_to(player.position)
		if distance_to_player > stop_distance:
			var direction = (player.position - position).normalized()
			position += direction * speed * delta
			update_animation(direction)
		else:
			animated_sprite.stop()

func update_animation(direction):
	'''
	Updates the animation based on the movement direction.

	This function plays the appropriate animation depending on the direction
	the character is moving in.

	Parameters
	----------
	direction : Vector2
		The normalized direction vector of the character's movement

	Returns
	-------
	None
	'''
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		if direction.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")
