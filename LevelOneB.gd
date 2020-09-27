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
var fire_truck = preload("res://Scenes/FireTruck.tscn")
var fire_truck_exploded = preload("res://Scenes/FireTruckEXPLODED.tscn")
var fire_truck_exploded_debris_one = preload("res://Scenes/FireTruckDebrisOne.tscn")
var fire_truck_exploded_debris_two = preload("res://Scenes/FireTruckDebrisTwo.tscn")
var fire_truck_exploded_debris_three = preload("res://Scenes/FireTruckDebrisThree.tscn")
var fire_truck_exploded_glass = preload("res://Scenes/GlassWindow.tscn")

var fireman_one_working = preload("res://Scenes/firemanOne_working.tscn")
var fireman_one_dead = preload("res://Scenes/firemanOne_dead.tscn")
var fireman_hose = preload("res://Scenes/firemanHose.tscn")
var fireman_helmet = preload("res://Scenes/Helmet.tscn")
var fireman_two_driving = preload("res://Scenes/firemanTwo_driving.tscn")
var fireman_two_dead = preload("res://Scenes/firemanTwo_dead.tscn")

var water = preload("res://Scenes/Water.tscn")

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
	$Scenes/Corpses/firemanOne_dead.hide()
	$Scenes/Corpses/firemanTwo_dead.hide()
	$Scenes/Corpses/Helmet.hide()
	$Objects/Cars/fire_truckEXPLODED.hide()
	$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_one.hide()
	$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_two.hide()
	$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_three.hide()
	$Objects/Cars/fire_truckEXPLODED/GlassWindow.hide()
	$Objects/Cars/fire_truckEXPLODED/GlassWindow2.hide()
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
		get_tree().change_scene("res://Scenes/LevelOneC.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(-4,27,-8)
		enemy_container.add_child(a)
		
func _on_Area3_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area3_body_exited(body):
	bomb_timer.stop()
	
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area4_body_exited(body):
	bomb_timer.stop()

func _on_Area5_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area5_body_exited(body):
	bomb_timer.stop()
	
func _on_FireTruckArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/car-explosion.ogg")
		player.play()
		$Objects/Cars/fire_truckEXPLODED.show()
		$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_one.show()
		$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_two.show()
		$Objects/Cars/fire_truckEXPLODED/fire_truck_debris_three.show()
		$Objects/Cars/fire_truckEXPLODED/GlassWindow.show()
		$Objects/Cars/fire_truckEXPLODED/GlassWindow2.show()
		$Scenes/Explosion/Fire.show()
		$Scenes/People/firemanOne_working.hide()
		$Scenes/People/firemanTwo_driving.hide()
		$Objects/Cars/hose.hide()
		$Scenes/Water/Water.hide()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Corpses/firemanOne_dead.show()
		$Scenes/Corpses/firemanTwo_dead.show()
		$Scenes/Corpses/Helmet.show()
		$Scenes/Explosion/Fire.hide()
		$Scenes/Explosion/GreySmoke.show()

func _on_AreaBack_body_entered(body):
	if body is KinematicBody:
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
	a.transform.origin = Vector3(0,10,-4.5)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(22,10,10)
	
	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(-31,10,7)
	
	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(0,10,-0.5)
