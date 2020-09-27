extends Control

onready var timer = get_node("Timer")

func _ready():
	Input.set_mouse_mode(1)
	timer.set_wait_time(1)
	timer.start()
	
func _input(event):
	if Input.is_action_pressed("ui_left"):
		get_tree().change_scene("res://Scenes/CutSceneEndG.tscn")
	if Input.is_action_pressed("ui_right"):
		get_tree().change_scene("res://Scenes/CutSceneEndI.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/CutSceneEndI.tscn")
