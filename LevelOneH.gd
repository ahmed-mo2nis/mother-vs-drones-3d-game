extends Spatial

var time = 0
var period = 0.3

export var SavedScene: String = ""
var file = File.new()

var enemy_drone = preload("res://Scenes/EnemyLevelOneAATest.tscn")
var basic_bomb = preload("res://Scenes/BombTest.tscn")
onready var enemy_container = $Enemy

var fire = preload("res://Scenes/Fire.tscn")
var smoke = preload("res://Scenes/GreySmoke.tscn")
var mosque = preload("res://Scenes/Mosque.tscn")
var mosque_rubble = preload("res://Scenes/MosqueRUBBLE.tscn")
var church = preload("res://Scenes/Church.tscn")
var church_rubble = preload("res://Scenes/ChurchRUBBLE.tscn")
var glass = preload("res://Scenes/GlassWindow.tscn")
var cafe_interior = preload("res://Scenes/CafeInterior.tscn")
var cafe_interior_rubble = preload("res://Scenes/CafeInteriorRUBBLE.tscn")
var cafe_front = preload("res://Scenes/CafeFront.tscn")
var cafe_front_rubble = preload("res://Scenes/CafeFrontRUBBLE.tscn")
var female_civilian_ten = preload("res://Scenes/female_civilian_ten.tscn")
var male_civilian_five = preload("res://Scenes/male_civilian_five.tscn")
var civilian_female_one = preload("res://Scenes/civilian_female_one.tscn")
var civilian_male_fifteen = preload("res://Scenes/civilian_male_fifteen.tscn")
var civilian_male_ten = preload("res://Scenes/civilian_male_ten.tscn")
var civilian_male_twelve = preload("res://Scenes/civilian_male_twelve.tscn")
var civilian_male_twentythree = preload("res://Scenes/civilian_male_twentythree.tscn")
var blood = preload("res://Scenes/Blood.tscn")

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByOne.hide()
	$Scenes/Explosion/GreySmoke.hide()
	$Scenes/Explosion/GreySmoke2.hide()
	$Scenes/Explosion/GreySmoke3.hide()
	$Scenes/Explosion/Fire.hide()
	$Scenes/Explosion/Fire2.hide()
	$Scenes/Explosion/Fire3.hide()
	$Scenes/Corpses/female_civilian_ten.hide()
	$Scenes/Corpses/male_civilian_five.hide()
	$Scenes/Corpses/civilian_female_one.hide()
	$Scenes/Corpses/civilian_male_fifteen.hide()
	$Scenes/Corpses/civilian_male_ten.hide()
	$Scenes/Corpses/civilian_male_twelve.hide()
	$Scenes/Corpses/civilian_male_twentythree.hide()
	$Scenes/Blood/Blood.hide()
	$Buildings/MosqueRUBBLE.hide()
	$Buildings/ChurchRUBBLE.hide()
	$Buildings/CafeInteriorRUBBLE.hide()
	$Buildings/CafeFrontRUBBLE.hide()
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
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
		get_tree().change_scene("res://Scenes/LevelOneI.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(-19,27,-11.5)
		enemy_container.add_child(a)

func _on_Area3_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(10,27,24)
		enemy_container.add_child(a)
		
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		var a = basic_bomb.instance()
		a.transform.origin = Vector3(-47,27,47.5)
		enemy_container.add_child(a)
		
func _on_MosqueArea_body_entered(body):
	if body.name == "BombTest":
		shake_camera()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/MosqueRUBBLE.show()
		$Objects/Windows/GlassWindow7.hide()
		$Objects/Windows/GlassWindow14.hide()
		$Objects/Windows/GlassWindow8.hide()
		$Objects/Windows/GlassWindow13.hide()
		$Objects/Windows/GlassWindow9.hide()
		$Objects/Windows/GlassWindow12.hide()
		$Objects/Windows/GlassWindow10.hide()
		$Objects/Windows/GlassWindow11.hide()
		$Scenes/Explosion/Fire.show()
		$Scenes/Corpses/civilian_female_one.show()
		$Scenes/Corpses/civilian_male_ten.show()
		$Scenes/Blood/Blood.show()
		yield(get_tree().create_timer(2),"timeout")
		$Scenes/Explosion/Fire.hide()
		$Scenes/Explosion/GreySmoke.show()
		
func _on_ChurchArea_body_entered(body):
	if body.name == "BombTest":
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/ChurchRUBBLE.show()
		$Objects/Windows/GlassWindow.hide()
		$Objects/Windows/GlassWindow2.hide()
		$Objects/Windows/GlassWindow3.hide()
		$Objects/Windows/GlassWindow4.hide()
		$Objects/Windows/GlassWindow5.hide()
		$Objects/Windows/GlassWindow6.hide()
		$Scenes/Explosion/Fire2.show()
		$Scenes/Corpses/civilian_male_fifteen.show()
		$Scenes/Corpses/civilian_male_twentythree.show()
		$Scenes/Explosion/Fire2.hide()
		$Scenes/Explosion/GreySmoke2.show()
		
func _on_CafeArea_body_entered(body):
	if body.name == "BombTest":
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Game/building-explosion.ogg")
		player.play()
		$Buildings/CafeInterior.hide()
		$Buildings/CafeInteriorRUBBLE.show()
		$Buildings/CafeFront.hide()
		$Buildings/CafeFrontRUBBLE.show()
		$Scenes/Explosion/Fire3.show()
		$Scenes/Corpses/female_civilian_ten.show()
		$Scenes/Corpses/male_civilian_five.show()
		$Scenes/Corpses/civilian_male_twelve.show()
		$Scenes/Explosion/GreySmoke3.show()

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
