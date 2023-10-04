extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite2D = $AnimatedSprite2D

const GRAVITY : float = 1500.0
const POWER : float = -450

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()

	if(is_on_floor() == true):
		animated_sprite2D.stop()
		set_physics_process(false)

func fly() -> void:
	if(Input.is_action_just_pressed("fly") == true) :
		velocity.y = POWER 
		animation_player.play("fly")
