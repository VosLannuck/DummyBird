extends Node2D

const SCROLL_SPEED : float = 150.0

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta

func on_screen_exited():
	queue_free()

func _on_pipe_body_entered(body:Node2D):
	## Doo error checking in here
	if (body.is_in_group(GameManager.PLANE_GROUP) == true):
		body._die()


func _on_laser_body_entered(body):
	if(body.is_in_group(GameManager.PLANE_GROUP) == true):
		GameManager.incrementScore()
