extends Control

onready var timer = get_node("Timer")

func _ready():
	Input.set_mouse_mode(1)
	timer.set_wait_time(5)
	timer.start()
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Music/angels-falling-four.ogg")
	player.play()
	
func _input(event):
	if Input.is_action_pressed("ui_left"):
		get_tree().change_scene("res://Scenes/CutSceneEndZ.tscn")
	if Input.is_action_pressed("ui_right"):
		get_tree().change_scene("res://Scenes/CutSceneEndZB.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/CutSceneEndZB.tscn")
