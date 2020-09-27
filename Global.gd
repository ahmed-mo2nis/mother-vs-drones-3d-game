extends Node

func _input(event):
	if Input.is_action_just_pressed("Left_Mouse"):
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/click.ogg")
		player.play()
