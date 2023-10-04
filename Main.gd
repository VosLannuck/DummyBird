extends Node2D

@export var pipes_scene : PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_pipe_l = $SpawnPipeL
@onready var spawn_pipe_u = $SpawnPipeU
@onready var spawn_pipe_timer = $SpawnPipeTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.setScore(0)
	GameManager.on_plane_died.connect(_on_plane_died)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func spawn_pipes() -> void:
	# Get random Place for pipes  
	# Spawn the pipes
	# insert the pipes into holder

	var random_y : float =  randf_range(spawn_pipe_u.position.y, spawn_pipe_l.position.y )
	var newPipes : Node = pipes_scene.instantiate()
	newPipes.position =  Vector2(spawn_pipe_l.position.x, random_y)
	pipes_holder.add_child(newPipes)

func _process(delta):
	pass

func _on_spawn_pipe_timer_timeout():
	spawn_pipes()

func stop_pipes() -> void:
	spawn_pipe_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_plane_died() -> void:
	stop_pipes()
	# GameManager.loadMainMenuScene();
