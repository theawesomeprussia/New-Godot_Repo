#-----------------------------------------------------------------------------
# Name:        Player Script
# Purpose:     Mmanages player movement, camera updates, and scene switching, 
#              with functions for player movement based on input actions, animation control, 
#              and camera activation depending on the current scene.
#
# References: 	
#				Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------

extends CharacterBody2D

const speed = 90
var current_dir = "none"

func _physics_process(delta):
	'''
	Called every physics frame to handle player movement and camera updates.

	This function calls player_movement and current_camera to manage player actions and camera adjustments.

	Parameters
	----------
	delta : float
		The time elapsed since the last physics frame

	Returns
	-------
	None
	'''
	player_movement(delta)
	current_camera()
	
func player():
	'''
	Placeholder function for player-specific functionality.

	This function currently does nothing and can be used for future player-related code.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	pass

func player_movement(delta):
	'''
	Handles player movement based on input actions.

	This function checks for directional input (up, down, left, right) and updates the player's velocity
	and animation accordingly. It uses the speed constant and delta time to calculate movement.

	Parameters
	----------
	delta : float
		The time elapsed since the last physics frame

	Returns
	-------
	None
	'''
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0

	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_anim(movement):
	'''
	Plays the appropriate animation based on the player's direction and movement state.

	This function updates the animation of the player's sprite based on the current direction and
	whether the player is moving or idle.

	Parameters
	----------
	movement : int
		Indicates whether the player is moving (1) or idle (0)

	Returns
	-------
	None
	'''
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "none":
		anim.play("Down_idle")
	
	if dir == "right":
		if movement == 1:
			anim.play("Walk_right")
		elif movement == 0:
			anim.play("Right_idle")
			
	elif dir == "left":
		if movement == 1:
			anim.play("Walk_left")
		elif movement == 0:
			anim.play("Left_idle")
			
	elif dir == "down":
		if movement == 1:
			anim.play("Walk_down")
		elif movement == 0:
			anim.play("Down_idle")
	
	if dir == "up":
		if movement == 1:
			anim.play("Walk_up")
		elif movement == 0:
			anim.play("Up_idle")


func current_camera():
	'''
	Updates the enabled state of cameras based on the current scene.

	This function checks the global current_scene variable and enables the appropriate camera
	for the current scene while disabling the others.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	if global.current_scene == "world":
		$world_camera.enabled = true
		$Level_1_camera.enabled = false
		$Level_2_camera.enabled = false
		$Level_3_camera.enabled = false
		
	elif global.current_scene == "Level_1":
		$world_camera.enabled = false
		$Level_1_camera.enabled = true
		$Level_2_camera.enabled = false
		$Level_3_camera.enabled = false
		
	elif global.current_scene == "Level_2":
		$world_camera.enabled = false
		$Level_1_camera.enabled = false
		$Level_2_camera.enabled = true
		$Level_3_camera.enabled = false

	elif global.current_scene == "Level_3":
		$world_camera.enabled = false
		$Level_1_camera.enabled = false
		$Level_2_camera.enabled = false
		$Level_3_camera.enabled = true

	else:
		$world_camera.enabled = true
		$Level_1_camera.enabled = false
		$Level_2_camera.enabled = false
		$Level_3_camera.enabled = false
	
func _ready():
	'''
	Called when the node is added to the scene.

	This function prints the current scene from the global state for debugging purposes.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	var my_variable = global.current_scene
	print(my_variable)

