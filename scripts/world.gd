#-----------------------------------------------------------------------------
# Name:        World Transition Management Script
# Purpose:     Manages scene transitions based on player interactions with specific
#              transition areas, updating the global transition state and gate number 
#              accordingly, and changing scenes to the appropriate level when triggered.
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
var gate_number = "1"
var score = 0

func _ready():
	'''
	Called when the node is added to the scene.

	This function currently does nothing and serves as a placeholder for future code.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	pass 


func _process(delta):
	'''
	Called every frame to handle scene transitions.

	This function checks if a scene transition is needed and changes the scene accordingly.

	Parameters
	----------
	delta : float
		The time elapsed since the last frame

	Returns
	-------
	None
	'''
	change_scene()


func _on_level_1_transition_body_entered(body):
	'''
	Handles the event when a body enters the Level 1 transition area.

	This function sets the global transition_scene variable to "1" and updates gate_number to "1" 
	when the player enters the transition area.

	Parameters
	----------
	body : Node
		The body that entered the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "1"


func _on_level_1_transition_body_exited(body):
	'''
	Handles the event when a body exits the Level 1 transition area.

	This function sets the global transition_scene variable to "0" and updates gate_number to "1" 
	when the player exits the transition area.

	Parameters
	----------
	body : Node
		The body that exited the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "1"



func _on_level_2_transition_body_entered(body):
	'''
	Handles the event when a body enters the Level 2 transition area.

	This function sets the global transition_scene variable to "1" and updates gate_number to "2" 
	when the player enters the transition area.

	Parameters
	----------
	body : Node
		The body that entered the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "2"


func _on_level_2_transition_body_exited(body):
	'''
	Handles the event when a body exits the Level 2 transition area.

	This function sets the global transition_scene variable to "0" and updates gate_number to "2" 
	when the player exits the transition area.

	Parameters
	----------
	body : Node
		The body that exited the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "2"



func _on_level_3_transition_body_entered(body):
	'''
	Handles the event when a body enters the Level 3 transition area.

	This function sets the global transition_scene variable to "1" and updates gate_number to "3" 
	when the player enters the transition area.

	Parameters
	----------
	body : Node
		The body that entered the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "3"


func _on_level_3_transition_body_exited(body):
	'''
	Handles the event when a body exits the Level 3 transition area.

	This function sets the global transition_scene variable to "0" and updates gate_number to "3" 
	when the player exits the transition area.

	Parameters
	----------
	body : Node
		The body that exited the transition area

	Returns
	-------
	None
	'''
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "3"


func change_scene():
	'''
	Changes the scene based on the current transition state and gate number.

	This function checks the global transition_scene variable and the current_scene to determine
	if a scene change is needed. It changes the scene to the appropriate level based on the gate number.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if global.transition_scene == "1":
		if global.current_scene == "world" and gate_number == "1":
			get_tree().change_scene_to_file("res://scenes/Level_1.tscn")
			global.finish_changescenes()
			global.current_scene = "Level_1"
	
	if global.transition_scene == "1":
		if global.current_scene == "world" and gate_number == "2":
			get_tree().change_scene_to_file("res://scenes/Level_2.tscn")
			global.finish_changescenes()
			global.current_scene = "Level_2"
	
	if global.transition_scene == "1":
		if global.current_scene == "world" and gate_number == "3":
			get_tree().change_scene_to_file("res://scenes/Level_3.tscn")
			global.finish_changescenes()
			global.current_scene = "Level_3"
