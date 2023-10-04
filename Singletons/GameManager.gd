extends Node

signal on_plane_died
signal on_score_update
const PLANE_GROUP : String  = "plane"

var _score : int 
var _highScore : int


var game_scene : PackedScene = preload("res://Scenes//main.tscn")
var main_menu_scene : PackedScene = preload("res://Scenes//main_menu.tscn")

func loadGameScene() -> void :
	get_tree().change_scene_to_packed(game_scene)

func loadMainMenuScene() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)

func getHighScore() -> int :
	return _highScore

func getScore() -> int:
	return _score

func setScore( score : int) -> void :
	_score = score
	if(_score > _highScore):
		_highScore = _score
	on_score_update.emit()
	print("sc: %s hc:%s" % [_score, _highScore])

func incrementScore() -> void:
	setScore(_score + 1)