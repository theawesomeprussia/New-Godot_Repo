extends Node2D
var gate_number = "1"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_level_1_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "1"


func _on_level_1_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "1"



func _on_level_2_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "2"


func _on_level_2_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "2"



func _on_level_3_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = "1"
		gate_number = "3"


func _on_level_3_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = "0"
		gate_number = "3"


func change_scene():
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
