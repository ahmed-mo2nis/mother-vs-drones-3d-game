extends Spatial

var time = 0
var period = 0.3

export var SavedScene: String = ""
var file = File.new()

var enemy_drone = preload("res://Scenes/EnemyLevelOneAATest.tscn")
var basic_bomb = preload("res://Scenes/BombTest.tscn")
onready var bomb_timer = get_node("Scenes/BombTimer")
onready var enemy_container = $Enemy

var fire = preload("res://Scenes/Fire.tscn")
var smoke = preload("res://Scenes/GreySmoke.tscn")
var sports_car = preload("res://Scenes/SportsCar.tscn")
var exploded_car = preload("res://Scenes/SportsCarEXPLODED.tscn")
var exploded_car_debris_one = preload("res://Scenes/SportEXPLODED_DebrisOne.tscn")
var exploded_car_debris_two = preload("res://Scenes/SportEXPLODED_DebrisTwo.tscn")

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByOne.hide()
	$MenuOptions/HealthIncreasedByFive.hide()
	$Scenes/Explosion/GreySmoke.hide()
	$Scenes/Explosion/Fire.hide()
	$Objects/Cars/SportsCarEXPLODED.hide()
	$Objects/Cars/SportsCarEXPLODED/SportEXPLODED_DebrisOne.hide()
	$Objects/Cars/SportsCarEXPLODED/SportEXPLODED_DebrisTwo.hide()
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	bomb_timer.set_wait_time(0.4)
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/air-raid-siren-alarm.ogg")
	player.play()

func _process(delta):
	if Input.is_key_pressed(KEY_S):
		if file.file_exists("user://Data/saved.txt"):
			var dir = Directory.new()
			dir.remove("user://Data/saved.txt")
		file.open("user://Data/saved.txt",File.WRITE)
		file.store_string(SavedScene)
		file.close()
		$MenuOptions/SavePlayConfirm.show()
		$MenuOptions/PausePlayConfirm.hide()
		$MenuOptions/QuitPlayConfirm.hide()
		$MenuOptions/RestartPlayConfirm.hide()
		
func _input(event):
	if Input.is_key_pressed(KEY_R):
		$MenuOptions/RestartPlayConfirm.show()
		$MenuOptions/PausePlayConfirm.hide()
		$MenuOptions/QuitPlayConfirm.hide()
		$MenuOptions/SavePlayConfirm.hide()
	if Input.is_key_pressed(KEY_F):
		health.current_health = 10
		get_tree().change_scene("res://Scenes/CutSceneLevelOneA.tscn")
	if Input.is_key_pressed(KEY_K):
		$MenuOptions/RestartPlayConfirm.hide()
	if Input.is_key_pressed(KEY_Q):
		$MenuOptions/QuitPlayConfirm.show()
		$MenuOptions/PausePlayConfirm.hide()
		$MenuOptions/RestartPlayConfirm.hide()
		$MenuOptions/SavePlayConfirm.hide()
	if Input.is_key_pressed(KEY_Y):
		get_tree().change_scene("res://Scenes/StartMenu2.tscn")
	if Input.is_key_pressed(KEY_N):
		$MenuOptions/QuitPlayConfirm.hide()
	if Input.is_key_pressed(KEY_P):
		get_tree().paused = true
		$MenuOptions/PausePlayConfirm.show()
		$MenuOptions/QuitPlayConfirm.hide()
		$MenuOptions/RestartPlayConfirm.hide()
		$MenuOptions/SavePlayConfirm.hide()
	if Input.is_key_pressed(KEY_C):
		get_tree().paused = false
		$MenuOptions/PausePlayConfirm.hide()
	if event is InputEventKey:
		if event.pressed:
			$MenuOptions/SavePlayConfirm.hide()
			$MenuOptions/HealthIncreasedByOne.hide()
			$MenuOptions/HealthIncreasedByFive.hide()
			
func shake_camera():
	var cam_pos = $Mother_test.get_translation()

	while time < period:
		time += get_process_delta_time()
		time = min(time, period)

		#shake the camera
		var offset = Vector3()
		offset.x = rand_range(-period, period)
		offset.y = rand_range(-period, period)
		offset.z = 0

		var new_cam_pos = cam_pos
		new_cam_pos += offset
		$Mother_test.set_translation(new_cam_pos)

		yield(get_tree(), "idle_frame")

	$Mother_test.set_translation(cam_pos)

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().change_scene("res://Scenes/LevelOneB.tscn")

func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(0,27,-5.5)
		enemy_container.add_child(a)
		
func _on_Area3_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area3_body_exited(body):
	bomb_timer.stop()

func _on_SportsCarArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/car-explosion.ogg")
		player.play()
		$Objects/Cars/SportsCarEXPLODED.show()
		$Objects/Cars/SportsCarEXPLODED/SportEXPLODED_DebrisOne.show()
		$Objects/Cars/SportsCarEXPLODED/SportEXPLODED_DebrisTwo.show()
		$Scenes/Explosion/Fire.show()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Explosion/Fire.hide()
		$Scenes/Explosion/GreySmoke.show()

func _on_Bottle_body_entered(body):
	if body.name == "Mother_test":
		health.current_health += 1
		$MenuOptions/HealthIncreasedByOne.show()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Player/woman-sighs.wav")
		player.play()

func _on_FirstAidKit_body_entered(body):
	if body.name == "Mother_test":
		health.current_health += 5
		$MenuOptions/HealthIncreasedByFive.show()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Player/woman-sighs.wav")
		player.play()

func _on_BombTimer_timeout():
		var a = basic_bomb.instance()
		enemy_container.add_child(a)
		a.transform.origin = Vector3(-3.5,10,-4.5)

		var b = basic_bomb.instance()
		b.transform.origin = Vector3(-3.5,10,-0.5)
		enemy_container.add_child(b)

		var c = basic_bomb.instance()
		c.transform.origin = Vector3(-3.5,10,3.5)
		enemy_container.add_child(c)

		var d = basic_bomb.instance()
		d.transform.origin = Vector3(-1.5,10,3.5)
		enemy_container.add_child(d)

		var e = basic_bomb.instance()
		e.transform.origin = Vector3(0.5,10,3.5)
		enemy_container.add_child(e)
		
		var f = basic_bomb.instance()
		f.transform.origin = Vector3(-5.5,10,3.5)
		enemy_container.add_child(f)
