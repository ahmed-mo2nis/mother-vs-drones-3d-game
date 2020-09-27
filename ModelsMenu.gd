extends Control

func _ready():
	Input.set_mouse_mode(0)

func _on_ModelsOneButton_pressed():
	get_tree().change_scene("res://Scenes/ModelsOne.tscn")

func _on_ModelsTwoButton_pressed():
	get_tree().change_scene("res://Scenes/ModelsTwo.tscn")

func _on_ModelsThreeButton_pressed():
	get_tree().change_scene("res://Scenes/ModelsThree.tscn")

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_MenuButton_pressed():
	get_tree().change_scene("res://Scenes/StartMenu2.tscn")
