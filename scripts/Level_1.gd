extends Node2D


func _process(delta):
	change_scenes()


func _on_world_transition_1_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = "1"


func _on_world_transition_1_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = "0"

func change_scenes():
	if global.transition_scene == "1":
		if global.current_scene == "Level_1":
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			global.finish_changescenes()
			global.current_scene = "world"
		
