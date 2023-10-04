extends Node2D

const SCROLL_SPEED : float = 150.0

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta

func on_screen_exited():
	queue_free()

