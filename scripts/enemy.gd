extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	if body == player:
		player = null
		player_chase = false
