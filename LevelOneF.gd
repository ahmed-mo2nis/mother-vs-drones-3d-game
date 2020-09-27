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
var house_one = preload("res://Scenes/houseOne.tscn")
var house_one_rubble = preload("res://Scenes/houseOneRUBBLE.tscn")
var house_two = preload("res://Scenes/houseTwo.tscn")
var house_two_rubble = preload("res://Scenes/houseTwoRUBBLE.tscn")
var house_rubble_glass = preload("res://Scenes/GlassWindow.tscn")
var female_civilian_four = preload("res://Scenes/female_civilian_four.tscn")
var female_civilian_six = preload("res://Scenes/female_civilian_six.tscn")

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByOne.hide()
	$Scenes/Explosion/GreySmoke.hide()
	$Scenes/Explosion/Fire.hide()
	$Scenes/Explosion/GreySmoke2.hide()
	$Scenes/Explosion/Fire2.hide()
	$Scenes/Corpses/female_civilian_four.hide()
	$Scenes/Corpses/female_civilian_six.hide()
	$Buildings/houseOneRUBBLE.hide()
	$Buildings/houseOneRUBBLE/GlassWindow.hide()
	$Buildings/houseTwoRUBBLE.hide()
	$Buildings/houseTwoRUBBLE/GlassWindow.hide()
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
		get_tree().change_scene("res://Scenes/LevelOneG.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(-44,27,2)
		enemy_container.add_child(a)
		
func _on_Area3_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(43,27,18)
		enemy_container.add_child(a)
		
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_houseOneArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/houseOne4.hide()
		$Buildings/houseOneRUBBLE.show()
		$Buildings/houseOneRUBBLE/GlassWindow.show()
		$Scenes/Explosion/Fire2.show()
		$Scenes/Corpses/female_civilian_four.show()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Explosion/Fire2.hide()
		$Scenes/Explosion/GreySmoke2.show()

func _on_houseTwoArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/houseTwo.hide()
		$Buildings/houseTwoRUBBLE.show()
		$Buildings/houseTwoRUBBLE/GlassWindow.show()
		$Scenes/Explosion/Fire.show()
		$Scenes/Corpses/female_civilian_six.show()
		yield(get_tree().create_timer(2),"timeout")
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

func _on_BombTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(-25,10,46)

	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-27,10,46)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(-23,10,46)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(-21,10,46)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(-19,10,46)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(-17,10,46)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(-15,10,46)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(-13,10,46)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(-11,10,48.5)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(-29,10,48.5)
