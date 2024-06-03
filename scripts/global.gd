#-----------------------------------------------------------------------------
# Name:        Global autoloaded Scene Management Script (scene_management.gd)
# Purpose:     To handle scene transitions and score management in the game
#
# References: 	
#				Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------


extends Node

var current_scene = "world"
var transition_scene = "0"
var score: int = 0

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changescenes():
	'''
	Handles the logic for changing scenes.

	This function updates the current scene based on the transition_scene value. 
	It switches between the "world" and "Level_1" scenes.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if transition_scene == "1":
		transition_scene = "0"
		if current_scene == "world":
			current_scene = "Level_1"
		else: 
			current_scene = "world"

func add_score(value: int):
	'''
	Adds a specified value to the current score.

	This function increments the player's score by the given value and prints the updated score.

	Parameters
	----------
	value : int
		The amount to add to the current score

	Returns
	-------
	None
	'''
	score += value
	print("Score updated to: ", score)

func get_score() -> int:
	'''
	Retrieves the current score.

	This function returns the player's current score.

	Parameters
	----------
	None

	Returns
	-------
	int
		The current score
	'''
	return score
