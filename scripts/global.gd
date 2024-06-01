extends Node

var current_scene = "world"
var transition_scene = "0"

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0
var player_start_posx = 0
var player_start_posy = 0

func finish_changescenes():
	if transition_scene == "1":
		transition_scene = "0"
		if current_scene == "world":
			current_scene = "Level_1"
		else: 
			current_scene = "world"
