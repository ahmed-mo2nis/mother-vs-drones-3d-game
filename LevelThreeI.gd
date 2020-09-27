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
onready var bomb_thirteen_timer = get_node("Scenes/BombThirteenTimer")
onready var bomb_fourteen_timer = get_node("Scenes/BombFourteenTimer")
onready var bomb_fifteen_timer = get_node("Scenes/BombFifteenTimer")
onready var bomb_sixteen_timer = get_node("Scenes/BombSixteenTimer")
onready var bomb_seventeen_timer = get_node("Scenes/BombSeventeenTimer")
onready var bomb_eighteen_timer = get_node("Scenes/BombEighteenTimer")
onready var bomb_nineteen_timer = get_node("Scenes/BombNineteenTimer")
onready var bomb_twenty_timer = get_node("Scenes/BombTwentyTimer")
onready var bomb_twenty_one_timer = get_node("Scenes/BombTwentyOneTimer")
onready var bomb_twenty_two_timer = get_node("Scenes/BombTwentyTwoTimer")
onready var bomb_twenty_three_timer = get_node("Scenes/BombTwentyThreeTimer")
onready var enemy_container = $Enemy

var museum_display = preload("res://Scenes/Museu_MAM_Rio.tscn")
var amenhotep_statue = preload("res://Scenes/FountainTwo.tscn")
var roman_statue = preload("res://Scenes/peasnt_woman_statue.tscn")
var islamic_plate = preload("res://Scenes/man-with-bull-statue.tscn")
var rubble = preload("res://Scenes/lion.tscn")

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
	bomb_thirteen_timer.set_wait_time(0.4)
	bomb_fourteen_timer.set_wait_time(0.4)
	bomb_fifteen_timer.set_wait_time(0.4)
	bomb_sixteen_timer.set_wait_time(0.4)
	bomb_seventeen_timer.set_wait_time(0.4)
	bomb_eighteen_timer.set_wait_time(0.4)
	bomb_nineteen_timer.set_wait_time(0.4)
	bomb_twenty_timer.set_wait_time(0.4)
	bomb_twenty_one_timer.set_wait_time(0.4)
	bomb_twenty_two_timer.set_wait_time(0.4)
	bomb_twenty_three_timer.set_wait_time(0.4)
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
		get_tree().change_scene("res://Scenes/LevelThreeJ.tscn")
		
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
		
func _on_Area14_body_entered(body):
	if body is KinematicBody:
		bomb_thirteen_timer.start()
		
func _on_Area15_body_entered(body):
	if body is KinematicBody:
		bomb_fourteen_timer.start()
		
func _on_Area16_body_entered(body):
	if body is KinematicBody:
		bomb_fifteen_timer.start()
		
func _on_Area17_body_entered(body):
	if body is KinematicBody:
		bomb_sixteen_timer.start()
		
func _on_Area18_body_entered(body):
	if body is KinematicBody:
		bomb_seventeen_timer.start()
		
func _on_Area19_body_entered(body):
	if body is KinematicBody:
		bomb_eighteen_timer.start()
		
func _on_Area20_body_entered(body):
	if body is KinematicBody:
		bomb_nineteen_timer.start()
		
func _on_Area21_body_entered(body):
	if body is KinematicBody:
		bomb_twenty_timer.start()
		
func _on_Area22_body_entered(body):
	if body is KinematicBody:
		bomb_twenty_one_timer.start()
		
func _on_Area23_body_entered(body):
	if body is KinematicBody:
		bomb_twenty_two_timer.start()
		
func _on_Area24_body_entered(body):
	if body is KinematicBody:
		bomb_twenty_three_timer.start()

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
		bomb_thirteen_timer.stop()
		bomb_fourteen_timer.stop()
		bomb_fifteen_timer.stop()
		bomb_sixteen_timer.stop()
		bomb_seventeen_timer.stop()
		bomb_eighteen_timer.stop()
		bomb_nineteen_timer.stop()
		bomb_twenty_timer.stop()
		bomb_twenty_one_timer.stop()
		bomb_twenty_two_timer.stop()
		bomb_twenty_three_timer.stop()

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
	a.transform.origin = Vector3(0,10,-31)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(2,10,-31)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(4,10,-31)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(6,10,-31)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-2,10,-31)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-4,10,-31)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(0,10,-27)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(2,10,-27)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(4,10,-27)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(6,10,-27)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-2,10,-27)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-4,10,-27)
	enemy_container.add_child(l)

func _on_BombTwoTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-22,10,-28)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-20,10,-28)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-18,10,-28)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-16,10,-28)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-24,10,-28)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-26,10,-28)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-22,10,-24)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-20,10,-24)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-18,10,-24)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-16,10,-24)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-24,10,-24)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-26,10,-24)
	enemy_container.add_child(l)

func _on_BombThreeTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(18,10,-27)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(20,10,-27)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(22,10,-27)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(24,10,-27)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(16,10,-27)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(14,10,-27)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(18,10,-23)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(20,10,-23)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(22,10,-23)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(24,10,-23)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(16,10,-23)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(14,10,-23)
	enemy_container.add_child(l)

func _on_BombFourTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-2,10,-22)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(0,10,-22)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(2,10,-22)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(4,10,-22)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-4,10,-22)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-6,10,-22)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-2,10,-18)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(0,10,-18)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(2,10,-18)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(4,10,-18)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-4,10,-18)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-6,10,-18)
	enemy_container.add_child(l)

func _on_BombFiveTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(5,10,-12)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(7,10,-12)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(9,10,-12)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(11,10,-12)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(3,10,-12)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(1,10,-12)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(5,10,-8)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(7,10,-8)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(9,10,-8)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(11,10,-8)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(3,10,-8)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(1,10,-8)
	enemy_container.add_child(l)

func _on_BombSixTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-16,10,-17)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-14,10,-17)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-12,10,-17)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-10,10,-17)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-18,10,-17)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-20,10,-17)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-16,10,-13)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-14,10,-13)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-12,10,-13)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-10,10,-13)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-18,10,-13)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-20,10,-13)
	enemy_container.add_child(l)

func _on_BombSevenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-15,10,-7)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-13,10,-7)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-11,10,-7)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-9,10,-7)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-17,10,-7)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-19,10,-7)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-15,10,-3)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-13,10,-3)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-11,10,-3)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-9,10,-3)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-17,10,-3)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-19,10,-3)
	enemy_container.add_child(l)

func _on_BombEightTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(5,10,-3)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(7,10,-3)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(9,10,-3)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(11,10,-3)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(3,10,-3)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(1,10,-3)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(5,10,1)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(7,10,1)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(9,10,1)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(11,10,1)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(3,10,1)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(1,10,1)
	enemy_container.add_child(l)

func _on_BombNineTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-14,10,3)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-12,10,3)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-10,10,3)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-8,10,3)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-16,10,3)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-18,10,3)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-14,10,7)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-12,10,7)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-10,10,7)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-8,10,7)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-16,10,7)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-18,10,7)
	enemy_container.add_child(l)

func _on_BombTenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(5,10,8)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(7,10,8)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(9,10,8)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(11,10,8)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(3,10,8)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(1,10,8)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(5,10,12)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(7,10,12)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(9,10,12)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(11,10,12)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(3,10,12)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(1,10,12)
	enemy_container.add_child(l)

func _on_BombElevenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-14,10,14)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-12,10,14)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-10,10,14)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-8,10,14)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-16,10,14)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-18,10,14)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-14,10,18)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-12,10,18)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-10,10,18)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-8,10,18)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-16,10,18)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-18,10,18)
	enemy_container.add_child(l)

func _on_BombTwelveTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(4,10,21)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(6,10,21)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(8,10,21)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(10,10,21)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(2,10,21)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(0,10,21)
	enemy_container.add_child(f)
	
	var g = basic_bomb.instance()
	g.transform.origin = Vector3(4,10,25)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(6,10,25)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(8,10,25)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(10,10,25)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(2,10,25)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(0,10,25)
	enemy_container.add_child(l)

func _on_BombThirteenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(35,10,-7)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(37,10,-7)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(39,10,-7)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(41,10,-7)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(33,10,-7)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(31,10,-7)
	enemy_container.add_child(f)

func _on_BombFourteenTimer_timeout():
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

func _on_BombFifteenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(37,10,29)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(39,10,29)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(41,10,29)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(43,10,29)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(35,10,29)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(33,10,29)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(37,10,33)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(39,10,33)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(41,10,33)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(43,10,33)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(35,10,33)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(33,10,33)
	enemy_container.add_child(l)

func _on_BombSixteenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-34,10,19)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-32,10,19)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-30,10,19)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-28,10,19)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-36,10,19)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-38,10,19)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-34,10,23)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-32,10,23)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-30,10,23)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-28,10,23)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-36,10,23)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-38,10,23)
	enemy_container.add_child(l)

func _on_BombSeventeenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(36,10,-31)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(38,10,-31)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(40,10,-31)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(42,10,-31)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(34,10,-31)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(32,10,-31)
	enemy_container.add_child(f)

func _on_BombEighteenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-34,10,28)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-32,10,28)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-30,10,28)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-28,10,28)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-36,10,28)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-38,10,28)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-34,10,32)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-32,10,32)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-30,10,32)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-28,10,32)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-36,10,32)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-38,10,32)
	enemy_container.add_child(l)

func _on_BombNineteenTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(40,10,3)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(42,10,3)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(44,10,3)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(46,10,3)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(38,10,3)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(36,10,3)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(40,10,7)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(42,10,7)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(44,10,7)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(46,10,7)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(38,10,7)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(36,10,7)
	enemy_container.add_child(l)

func _on_BombTwentyTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(39,10,17)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(41,10,17)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(43,10,17)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(45,10,17)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(37,10,17)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(35,10,17)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(39,10,21)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(41,10,21)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(43,10,21)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(45,10,21)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(37,10,21)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(35,10,21)
	enemy_container.add_child(l)

func _on_BombTwentyOneTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(0,10,29)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(2,10,29)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(4,10,29)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(6,10,29)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-2,10,29)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-4,10,29)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(0,10,33)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(2,10,33)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(4,10,33)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(6,10,33)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-2,10,33)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-4,10,33)
	enemy_container.add_child(l)

func _on_BombTwentyTwoTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(-30,10,43)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(-28,10,43)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(-26,10,43)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(-24,10,43)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-32,10,43)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-34,10,43)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(-30,10,47)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(-28,10,47)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(-26,10,47)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(-24,10,47)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-32,10,47)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-34,10,47)
	enemy_container.add_child(l)

func _on_BombTwentyThreeTimer_timeout():
	var a = basic_bomb.instance()
	a.transform.origin = Vector3(0,10,43)
	enemy_container.add_child(a)

	var b = basic_bomb.instance()
	b.transform.origin = Vector3(2,10,43)
	enemy_container.add_child(b)

	var c = basic_bomb.instance()
	c.transform.origin = Vector3(4,10,43)
	enemy_container.add_child(c)

	var d = basic_bomb.instance()
	d.transform.origin = Vector3(6,10,43)
	enemy_container.add_child(d)

	var e = basic_bomb.instance()
	e.transform.origin = Vector3(-2,10,43)
	enemy_container.add_child(e)

	var f = basic_bomb.instance()
	f.transform.origin = Vector3(-4,10,43)
	enemy_container.add_child(f)

	var g = basic_bomb.instance()
	g.transform.origin = Vector3(0,10,47)
	enemy_container.add_child(g)

	var h = basic_bomb.instance()
	h.transform.origin = Vector3(2,10,47)
	enemy_container.add_child(h)

	var i = basic_bomb.instance()
	i.transform.origin = Vector3(4,10,47)
	enemy_container.add_child(i)

	var j = basic_bomb.instance()
	j.transform.origin = Vector3(6,10,47)
	enemy_container.add_child(j)

	var k = basic_bomb.instance()
	k.transform.origin = Vector3(-2,10,47)
	enemy_container.add_child(k)

	var l = basic_bomb.instance()
	l.transform.origin = Vector3(-4,10,47)
	enemy_container.add_child(l)
