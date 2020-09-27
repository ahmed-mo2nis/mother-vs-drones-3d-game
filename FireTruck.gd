extends Area

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/fire-truck-siren.ogg")
	player.play()

func _on_fire_truck_body_entered(body):
	if body is RigidBody:
		queue_free()
