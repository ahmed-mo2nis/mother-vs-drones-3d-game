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
var house_three = preload("res://Scenes/houseThree.tscn")
var house_three_rubble = preload("res://Scenes/houseThreeRUBBLE.tscn")
var house_four = preload("res://Scenes/houseFour.tscn")
var house_four_rubble = preload("res://Scenes/houseFourRUBBLE.tscn")
var house_rubble_glass = preload("res://Scenes/GlassWindow.tscn")
var female_civilian_two = preload("res://Scenes/female_civilian_two.tscn")
var male_civilian_one = preload("res://Scenes/male_civilian_one.tscn")
var male_civilian_four = preload("res://Scenes/civilian_male_four.tscn")
var male_civilian_five = preload("res://Scenes/civilian_male_five.tscn")

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
	$Scenes/Explosion/GreySmoke2.hide()
	$Scenes/Explosion/GreySmoke3.hide()
	$Scenes/Explosion/Fire.hide()
	$Scenes/Explosion/Fire2.hide()
	$Scenes/Explosion/Fire3.hide()
	$Scenes/Corpses/female_civilian_two.hide()
	$Scenes/Corpses/male_civilian_one.hide()
	$Scenes/Corpses/civilian_male_four.hide()
	$Scenes/Corpses/civilian_male_five.hide()
	$Buildings/houseThreeRUBBLE.hide()
	$Buildings/houseThreeRUBBLE/GlassWindow.hide()
	$Buildings/houseThreeRUBBLE2.hide()
	$Buildings/houseThreeRUBBLE2/GlassWindow.hide()
	$Buildings/houseFourRUBBLE.hide()
	$Buildings/houseFourRUBBLE/GlassWindow.hide()
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
		get_tree().change_scene("res://Scenes/LevelOneH.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(46.5,27,21.5)
		enemy_container.add_child(a)

func _on_Area3_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(46.5,27,-5.5)
		enemy_container.add_child(a)

func _on_Area4_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(-46.5,27,5.5)
		enemy_container.add_child(a)

func _on_Area5_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()
		
func _on_houseThreeArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/houseThree.hide()
		$Buildings/houseThreeRUBBLE.show()
		$Buildings/houseThreeRUBBLE/GlassWindow.show()
		$Scenes/Explosion/Fire3.show()
		$Scenes/Corpses/civilian_male_four.show()
		$Scenes/Corpses/civilian_male_five.show()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Explosion/Fire3.hide()
		$Scenes/Explosion/GreySmoke3.show()

func _on_houseThree2Area_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/houseThree2.hide()
		$Buildings/houseThreeRUBBLE2.show()
		$Buildings/houseThreeRUBBLE2/GlassWindow.show()
		$Scenes/Explosion/Fire2.show()
		$Scenes/Corpses/female_civilian_two.show()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Explosion/Fire2.hide()
		$Scenes/Explosion/GreySmoke2.show()

func _on_houseFour2Area_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/houseFour2.hide()
		$Buildings/houseFourRUBBLE.show()
		$Buildings/houseFourRUBBLE/GlassWindow.show()
		$Scenes/Explosion/Fire.show()
		$Scenes/Corpses/male_civilian_one.show()
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
	a.transform.origin = Vector3(-2,10,43)

	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-4,10,43)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(-6,10,43)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(-8,10,43)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(-10,10,45)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(0,10,43)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(2,10,43)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(4,10,43)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(6,10,43)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(8,10,43)
	
	var k = basic_bomb.instance()
	enemy_container.add_child(k)
	k.transform.origin = Vector3(10,10,43)
	
	var l = basic_bomb.instance()
	enemy_container.add_child(l)
	l.transform.origin = Vector3(12,10,45)
