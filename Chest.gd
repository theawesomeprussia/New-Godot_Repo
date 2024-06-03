#-----------------------------------------------------------------------------
# Name:        Chest Collection Script (area2d_animation.gd)
# Purpose:     To handle the animation and collision detection of an Area2D node for scoring system
#
# References: 	
#				Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------


extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	'''
	Initializes the script, called when the node is added to the scene.

	This function checks if the animated sprite is available and starts the idle animation. 
	It also connects the "body_entered" signal to the _on_body_entered function.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if animated_sprite:
		play_idle_animation()
	else:
		print("Error")
	connect("body_entered", _on_body_entered)


func play_idle_animation():
	'''
	Plays the idle animation if it's not already playing.

	This function ensures that the idle animation is played if it's not already active.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if animated_sprite:
		if not animated_sprite.is_playing() or animated_sprite.animation != "Idle":
			animated_sprite.play("Idle")
	else:
		print("Error")

func _on_body_entered(body: Node) -> void:
	'''
	Handles the event when a body enters the area.

	This function checks if the body has a "player" method, adds score if true, 
	and queues the node for deletion.

	Parameters
	----------
	body : Node
		The node that entered the area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.add_score(10)
		queue_free()


