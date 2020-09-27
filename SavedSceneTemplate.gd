extends Control

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/StartMenu2.tscn")

func _on_QuitButton_pressed():
	get_tree().change_scene("res://Scenes/QuitGameConfirm.tscn")
