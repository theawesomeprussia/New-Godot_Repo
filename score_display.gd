#-----------------------------------------------------------------------------
# Name:        Score Display Script
# Purpose:     Manages the display of the game's score by updating a label with
#              the current score from the global state and scaling it down, ensuring 
#              it's called every frame to reflect any score changes.
#
# References: 	
#				Godot Engine Documentation: https://docs.godotengine.org
#				Godot API Reference: https://docs.godotengine.org/en/stable/classes/index.html
#
# Author:      Shafay Umair and Jerry Guo
# Created:     3-Jun-2024
# Updated:     3-Jun-2024
#-----------------------------------------------------------------------------

extends CanvasLayer

@onready var score_label: Label = $ScoreLabel

var original_scale: Vector2

func _ready():
	'''
	Called when the node is added to the scene.

	This function initializes the original scale of the score label and updates the score display.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	original_scale = score_label.scale
	update_score()

func update_score():
	'''
	Updates the score label with the current score and scales it down.

	This function sets the text of the score label to the current score from the global state 
	and scales the label down by 30%.

	Parameters
	----------
	None

	Returns
	-------
	None
	'''
	score_label.text = "Score: " + str(global.get_score())
	score_label.scale = original_scale * Vector2(0.7, 0.7)

func _process(delta: float):
	'''
	Called every frame to update the score display.

	This function updates the score label to reflect any changes in the global score.

	Parameters
	----------
	delta : float
		The time elapsed since the last frame

	Returns
	-------
	None
	'''
	update_score()
