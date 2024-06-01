extends CharacterBody2D

var speed = 6
var player = null
var stop_distance = 30
var animated_sprite = null

func _ready():
	# Assume the player node is named "Player" and is a child of the current node's parent.
	player = get_parent().get_node("Player")
	# Correctly assign the AnimatedSprite node
	animated_sprite = $AnimatedSprite2D

	# Debugging print statement to ensure the node is assigned
	print(animated_sprite)

func _physics_process(delta):
	if player:
		var distance_to_player = position.distance_to(player.position)
		if distance_to_player > stop_distance:
			var direction = (player.position - position).normalized()
			position += direction * speed * delta
			update_animation(direction)
		else:
			animated_sprite.stop()

func update_animation(direction):
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		if direction.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")
