extends RigidBody

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()

func _on_SarinBomb_body_entered(body):
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	if body is Spatial:
		queue_free()
		health.current_health -= 1
	if body is KinematicBody:
		health.current_health -= 3

	if health.current_health == 0:
		get_tree().change_scene("res://Scenes/CutSceneDeath.tscn")
		health.current_health = 10
