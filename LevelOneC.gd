extends Spatial

export var SavedScene: String = ""
var file = File.new()

var enemy_drone = preload("res://Scenes/EnemyLevelOneAATest.tscn")
var basic_bomb = preload("res://Scenes/BombTest.tscn")
onready var bomb_timer = get_node("Scenes/BombTimer")
onready var bomb_two_timer = get_node("Scenes/BombTwoTimer")
onready var bomb_three_timer = get_node("Scenes/BombThreeTimer")
onready var bomb_four_timer = get_node("Scenes/BombFourTimer")
onready var bomb_five_timer = get_node("Scenes/BombFiveTimer")
onready var enemy_container = $Enemy

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByOne.hide()
	$MenuOptions/HealthIncreasedByFive.hide()
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	bomb_timer.set_wait_time(0.4)
	bomb_two_timer.set_wait_time(0.4)
	bomb_three_timer.set_wait_time(0.4)
	bomb_four_timer.set_wait_time(0.4)
	bomb_five_timer.set_wait_time(0.4)
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

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().change_scene("res://Scenes/LevelOneD.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area3_body_entered(body):
	if body is KinematicBody:
		bomb_timer.stop()
	
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		bomb_timer.stop()
	
func _on_Area5_body_entered(body):
	if body is KinematicBody:
		bomb_two_timer.start()

func _on_Area6_body_entered(body):
	if body is KinematicBody:
		bomb_two_timer.stop()

func _on_Area7_body_entered(body):
	if body is KinematicBody:
		bomb_two_timer.stop()
	
func _on_Area8_body_entered(body):
	if body is KinematicBody:
		bomb_three_timer.start()

func _on_Area9_body_entered(body):
	if body is KinematicBody:
		bomb_three_timer.stop()

func _on_Area10_body_entered(body):
	if body is KinematicBody:
		bomb_three_timer.stop()
	
func _on_Area11_body_entered(body):
	if body is KinematicBody:
		bomb_four_timer.start()

func _on_Area12_body_entered(body):
	if body is KinematicBody:
		bomb_four_timer.stop()

func _on_Area13_body_entered(body):
	if body is KinematicBody:
		bomb_four_timer.stop()
	
func _on_Area14_body_entered(body):
	if body is KinematicBody:
		bomb_five_timer.start()
		
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
	a.transform.origin = Vector3(-2,10,-33)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-4,10,-33)
	
	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(0,10,-33)
	
	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(2,10,-33)
	
	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(4,10,-33)
	
	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(6,10,-33)
	
	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(6,10,-33)
	
	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(6,10,-33)
	
	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(6,10,-33)
	
	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(6,10,-33)

func _on_BombTwoTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(-2,10,-10)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-4,10,-10)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(0,10,-10)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(2,10,-10)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(4,10,-10)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(6,10,-10)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(6,10,-10)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(6,10,-10)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(6,10,-10)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(6,10,-10)

func _on_BombThreeTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(26,10,9)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(24,10,9)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(22,10,9)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(20,10,9)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(18,10,9)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(28,10,9)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(30,10,9)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(32,10,9)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(34,10,9)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(36,10,9)

func _on_BombFourTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(26,10,34)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(24,10,34)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(22,10,34)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(20,10,34)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(18,10,34)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(28,10,34)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(30,10,34)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(32,10,34)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(34,10,34)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(36,10,34)

func _on_BombFiveTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(-45,10,26)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-45,10,28)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(-45,10,30)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(-45,10,32)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(-45,10,34)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(-45,10,36)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(-45,10,38)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(-45,10,40)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(-45,10,42)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(-45,10,44)
