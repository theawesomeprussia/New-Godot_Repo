extends CanvasLayer

@onready var score_label: Label = $ScoreLabel

# Define a variable to keep track of the original scale
var original_scale: Vector2

func _ready():
	# Store the original scale
	original_scale = score_label.scale
	update_score()

func update_score():
	score_label.text = "Score: " + str(global.get_score())
	
	# Reduce the size by 30% of the original scale
	score_label.scale = original_scale * Vector2(0.7, 0.7)

func _process(delta: float):
	update_score()
