extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	if animated_sprite:
		play_idle_animation()
	else:
		print("Error")
	connect("body_entered", _on_body_entered)


func play_idle_animation():
	if animated_sprite:
		if not animated_sprite.is_playing() or animated_sprite.animation != "Idle":
			animated_sprite.play("Idle")
	else:
		print("Error")

func _on_body_entered(body: Node) -> void:
	if body.has_method("player"):
		global.add_score(1)
		queue_free()


