extends CharacterBody2D

#signal on_plane_died()

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite2D = $AnimatedSprite2D

const GRAVITY : float = 1500.0
const POWER : float = -450

var isDead : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	_fly()

	if(is_on_floor() == true):
		_die()
	
	move_and_slide()


func _fly() -> void:
	if(Input.is_action_just_pressed("fly") == true) :
		velocity.y = POWER 
		animation_player.play("fly")

func _die() -> void:

	if isDead == true:
		return 
	isDead = true
	animated_sprite2D.stop()
	GameManager.on_plane_died.emit()
	set_physics_process(false)