extends CharacterBody2D

const speed = 90
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	current_camera()
	
func player():
	pass

func player_movement(delta):
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
	if global.current_scene == "world":
		$world_camera.enabled = false
		$Level_1_camera.enabled = true
	elif global.current_scene == "Level_1":
		$world_camera.enabled = false
		$Level_1_camera.enabled = true
	else:
		$world_camera.enabled = true
		$Level_1_camera.enabled = false
		


