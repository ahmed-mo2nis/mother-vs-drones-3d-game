extends Control

onready var timer = get_node("Timer")

func _ready():
	Input.set_mouse_mode(1)
	timer.set_wait_time(2)
	timer.start()
	
func _input(event):
	if Input.is_action_pressed("ui_left"):
		get_tree().change_scene("res://Scenes/CutSceneLevelFiveS.tscn")
	if Input.is_action_pressed("ui_right"):
		get_tree().change_scene("res://Scenes/CutSceneLevelFiveU.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/CutSceneLevelFiveU.tscn")
