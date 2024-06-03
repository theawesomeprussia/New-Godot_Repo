#-----------------------------------------------------------------------------
# Name:        Level 1 Script
# Purpose:     To manage scene transitions in the game by detecting when a player enters or 
#			   exits transition areas and changes scenes according to the global transition state.
#
# References: 	
#				Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------

extends Node2D


func _process(delta):
	'''
	Called every frame to handle scene changes.

	This function calls change_scenes to check and handle any scene transitions.

	Parameters
	----------
	delta : float
		The time elapsed since the last frame

	Returns
	-------
	None
	'''
	change_scenes()


func _on_world_transition_1_body_entered(body):
	'''
	Handles the event when a body enters the transition area.

	This function sets the global transition_scene variable to "1" if the body has a "player" method.

	Parameters
	----------
	body : Node
		The node that entered the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "1"


func _on_world_transition_1_body_exited(body):
	'''
	Handles the event when a body exits the transition area.

	This function sets the global transition_scene variable to "0" if the body has a "player" method.

	Parameters
	----------
	body : Node
		The node that exited the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "0"

func change_scenes():
	'''
	Checks the transition state and changes scenes if necessary.

	This function changes the scene based on the value of global.transition_scene and global.current_scene. 
	If transitioning from Level_1, it changes to the world scene and updates the global state.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if global.transition_scene == "1":
		if global.current_scene == "Level_1":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			global.finish_changescenes()
			global.current_scene = "world"
		
