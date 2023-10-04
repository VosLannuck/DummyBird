extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer

var isSpaceAvailable : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_plane_died.connect(_showGameOver)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if isSpaceAvailable == true:
		if Input.is_action_pressed("fly") == true:
			GameManager.loadMainMenuScene()

func _showGameOver() -> void:
	show()
	timer.start()

func _showPressSpace() -> void:
	game_over_label.hide()
	press_space_label.show()
	isSpaceAvailable = true

func _on_timer_timeout():
	_showPressSpace()
