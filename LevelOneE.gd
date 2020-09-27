extends Spatial

export var SavedScene: String = ""
var file = File.new()

var enemy_drone = preload("res://Scenes/EnemyLevelOneAATest.tscn")
var basic_bomb = preload("res://Scenes/BombTest.tscn")
onready var bomb_timer = get_node("Scenes/BombTimer")
onready var bomb_two_timer = get_node("Scenes/BombTwoTimer")
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
		get_tree().change_scene("res://Scenes/LevelOneF.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

func _on_Area3_body_entered(body):
	if body is KinematicBody:
		bomb_timer.stop()
		
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		bomb_two_timer.start()

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
	a.transform.origin = Vector3(0,10,-24)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(-2,10,-24)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(-4,10,-24)
	
	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(-6,10,-24)
	
	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(2,10,-24)
	
	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(4,10,-24)
	
	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(6,10,-24)
	
	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(8,10,-24)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(-8,10,-24)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(10,10,-24)
	
	var k = basic_bomb.instance()
	enemy_container.add_child(k)
	k.transform.origin = Vector3(-10,10,-24)

	var l = basic_bomb.instance()
	enemy_container.add_child(l)
	l.transform.origin = Vector3(12,10,-24)
	
	var m = basic_bomb.instance()
	enemy_container.add_child(m)
	m.transform.origin = Vector3(-12,10,-24)
	
	var n = basic_bomb.instance()
	enemy_container.add_child(n)
	n.transform.origin = Vector3(-14,10,-24)
	
	var o = basic_bomb.instance()
	enemy_container.add_child(o)
	o.transform.origin = Vector3(-16,10,-24)
	
	var p = basic_bomb.instance()
	enemy_container.add_child(p)
	p.transform.origin = Vector3(-18,10,-24)
	
	var q = basic_bomb.instance()
	enemy_container.add_child(q)
	q.transform.origin = Vector3(-20,10,-24)

func _on_BombTwoTimer_timeout():
	var a = basic_bomb.instance()
	enemy_container.add_child(a)
	a.transform.origin = Vector3(0,10,44)
	
	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(2,10,44)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(4,10,44)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(6,10,44)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(-2,10,44)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(-4,10,44)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(-6,10,47)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(8,10,44)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(10,10,44)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(12,10,44)

	var k = basic_bomb.instance()
	enemy_container.add_child(k)
	k.transform.origin = Vector3(14,10,44)

	var l = basic_bomb.instance()
	enemy_container.add_child(l)
	l.transform.origin = Vector3(16,10,44)

	var m = basic_bomb.instance()
	enemy_container.add_child(m)
	m.transform.origin = Vector3(18,10,44)

	var n = basic_bomb.instance()
	enemy_container.add_child(n)
	n.transform.origin = Vector3(20,10,44)

	var o = basic_bomb.instance()
	enemy_container.add_child(o)
	o.transform.origin = Vector3(22,10,44)

	var p = basic_bomb.instance()
	enemy_container.add_child(p)
	p.transform.origin = Vector3(24,10,44)

	var q = basic_bomb.instance()
	enemy_container.add_child(q)
	q.transform.origin = Vector3(26,10,44)
	
	var r = basic_bomb.instance()
	enemy_container.add_child(r)
	r.transform.origin = Vector3(28,10,44)
	
	var s = basic_bomb.instance()
	enemy_container.add_child(s)
	s.transform.origin = Vector3(30,10,44)
	
	var t = basic_bomb.instance()
	enemy_container.add_child(t)
	t.transform.origin = Vector3(32,10,44)
	
	var u = basic_bomb.instance()
	enemy_container.add_child(u)
	u.transform.origin = Vector3(34,10,47)
