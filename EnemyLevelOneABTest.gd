extends KinematicBody

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/drone-sound.ogg")
	player.play()

func _process(delta):
	translate(Vector3(10*delta,0,0))
