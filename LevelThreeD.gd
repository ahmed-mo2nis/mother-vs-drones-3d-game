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
onready var bomb_six_timer = get_node("Scenes/BombSixTimer")
onready var bomb_seven_timer = get_node("Scenes/BombSevenTimer")
onready var bomb_eight_timer = get_node("Scenes/BombEightTimer")
onready var bomb_nine_timer = get_node("Scenes/BombNineTimer")
onready var bomb_ten_timer = get_node("Scenes/BombTenTimer")
onready var bomb_eleven_timer = get_node("Scenes/BombElevenTimer")
onready var bomb_twelve_timer = get_node("Scenes/BombTwelveTimer")
onready var enemy_container = $Enemy

var school_teaching_building = preload("res://Scenes/School_Teaching_Building.tscn")
var rubble = preload("res://Scenes/Rubble.tscn")
var garbage_container = preload("res://Scenes/garbage_container.tscn")
var red_car = preload("res://Scenes/RedCar.tscn")
var leszkikrov_car = preload("res://Scenes/LESZKIKROV.tscn")

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByFive.hide()
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	bomb_timer.set_wait_time(0.4)
	bomb_two_timer.set_wait_time(0.4)
	bomb_three_timer.set_wait_time(0.4)
	bomb_four_timer.set_wait_time(0.4)
	bomb_five_timer.set_wait_time(0.4)
	bomb_six_timer.set_wait_time(0.4)
	bomb_seven_timer.set_wait_time(0.4)
	bomb_eight_timer.set_wait_time(0.4)
	bomb_nine_timer.set_wait_time(0.4)
	bomb_ten_timer.set_wait_time(0.4)
	bomb_eleven_timer.set_wait_time(0.4)
	bomb_twelve_timer.set_wait_time(0.4)
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/pressure-builder.ogg")
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
			$MenuOptions/HealthIncreasedByFive.hide()

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().change_scene("res://Scenes/LevelThreeE.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()
		
func _on_Area3_body_entered(body):
	if body is KinematicBody:
		bomb_two_timer.start()
		
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		bomb_three_timer.start()
		
func _on_Area5_body_entered(body):
	if body is KinematicBody:
		bomb_four_timer.start()
		
func _on_Area6_body_entered(body):
	if body is KinematicBody:
		bomb_five_timer.start()
		
func _on_Area7_body_entered(body):
	if body is KinematicBody:
		bomb_six_timer.start()
		
func _on_Area8_body_entered(body):
	if body is KinematicBody:
		bomb_seven_timer.start()
		
func _on_Area9_body_entered(body):
	if body is KinematicBody:
		bomb_eight_timer.start()
		
func _on_Area10_body_entered(body):
	if body is KinematicBody:
		bomb_nine_timer.start()
		
func _on_Area11_body_entered(body):
	if body is KinematicBody:
		bomb_ten_timer.start()
		
func _on_Area12_body_entered(body):
	if body is KinematicBody:
		bomb_eleven_timer.start()
		
func _on_Area13_body_entered(body):
	if body is KinematicBody:
		bomb_twelve_timer.start()

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

func _on_WallArea_body_entered(body):
	if body is KinematicBody:
		$Walls/WallThree20.hide()
		bomb_timer.stop()
		bomb_two_timer.stop()
		bomb_three_timer.stop()
		bomb_four_timer.stop()
		bomb_five_timer.stop()
		bomb_six_timer.stop()
		bomb_seven_timer.stop()
		bomb_eight_timer.stop()
		bomb_nine_timer.stop()
		bomb_ten_timer.stop()
		bomb_eleven_timer.stop()
		bomb_twelve_timer.stop()

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
	a.transform.origin = Vector3(0,10,-28)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(2,10,-28)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(4,10,-28)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(6,10,-28)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-2,10,-28)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-4,10,-28)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(0,10,-24)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(2,10,-24)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(4,10,-24)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(6,10,-24)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-2,10,-24)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-4,10,-24)
	enemy_container.add_child(l)

func _on_BombTwoTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(20,10,-25)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(22,10,-25)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(24,10,-25)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(26,10,-25)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(18,10,-25)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(16,10,-25)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(20,10,-21)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(22,10,-21)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(24,10,-21)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(26,10,-21)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(18,10,-21)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(16,10,-21)
	enemy_container.add_child(l)

func _on_BombThreeTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(37,10,-21)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(39,10,-21)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(41,10,-21)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(43,10,-21)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(35,10,-21)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(33,10,-21)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(37,10,-17)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(39,10,-17)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(41,10,-17)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(43,10,-17)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(35,10,-17)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(33,10,-17)
	enemy_container.add_child(l)

func _on_BombFourTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-13,10,-23)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-11,10,-23)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-9,10,-23)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-7,10,-23)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-15,10,-23)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-17,10,-23)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-13,10,-19)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-11,10,-19)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-9,10,-19)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-7,10,-19)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-15,10,-19)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-17,10,-19)
	enemy_container.add_child(l)

func _on_BombFiveTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-31,10,-19)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-33,10,-19)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-35,10,-19)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-37,10,-19)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-29,10,-19)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-27,10,-19)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-31,10,-15)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-33,10,-15)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-35,10,-15)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-37,10,-15)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-29,10,-15)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-27,10,-15)
	enemy_container.add_child(l)

func _on_BombSixTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(0,10,-13)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(2,10,-13)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(4,10,-13)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(6,10,-13)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-2,10,-13)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-4,10,-13)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(0,10,-9)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(2,10,-9)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(4,10,-9)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(6,10,-9)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-2,10,-9)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-4,10,-9)
	enemy_container.add_child(l)

func _on_BombSevenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(22,10,-8)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(24,10,-8)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(26,10,-8)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(28,10,-8)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(20,10,-8)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(18,10,-8)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(22,10,-4)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(24,10,-4)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(26,10,-4)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(28,10,-4)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(20,10,-4)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(18,10,-4)
	enemy_container.add_child(l)

func _on_BombEightTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(40,10,0)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(42,10,0)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(44,10,0)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(46,10,0)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(38,10,0)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(36,10,0)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(40,10,4)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(42,10,4)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(44,10,4)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(46,10,4)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(38,10,4)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(36,10,4)
	enemy_container.add_child(l)

func _on_BombNineTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(18,10,0)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(20,10,0)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(22,10,0)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(24,10,0)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(16,10,0)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(14,10,0)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(18,10,4)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(20,10,4)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(22,10,4)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(24,10,4)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(16,10,4)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(14,10,4)
	enemy_container.add_child(l)

func _on_BombTenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(40,10,10)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(42,10,10)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(44,10,10)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(46,10,10)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(38,10,10)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(36,10,10)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(40,10,14)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(42,10,14)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(44,10,14)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(46,10,14)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(38,10,14)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(36,10,14)
	enemy_container.add_child(l)

func _on_BombElevenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(38,10,-15)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(40,10,-15)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(42,10,-15)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(44,10,-15)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(36,10,-15)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(34,10,-15)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(38,10,-11)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(40,10,-11)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(42,10,-11)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(44,10,-11)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(36,10,-11)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(34,10,-11)
	enemy_container.add_child(l)

func _on_BombTwelveTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(17,10,-17)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(19,10,-17)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(21,10,-17)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(23,10,-17)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(15,10,-17)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(13,10,-17)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(17,10,-13)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(19,10,-13)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(21,10,-13)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(23,10,-13)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(15,10,-13)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(13,10,-13)
	enemy_container.add_child(l)
