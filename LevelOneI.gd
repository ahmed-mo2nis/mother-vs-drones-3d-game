extends Spatial

export var SavedScene: String = ""
var file = File.new()

var enemy_drone = preload("res://Scenes/EnemyLevelOneAATest.tscn")
var basic_bomb = preload("res://Scenes/BombTest.tscn")
onready var bomb_timer = get_node("Scenes/BombTimer")
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
		get_tree().change_scene("res://Scenes/LevelOneJ.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		bomb_timer.start()

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
	a.transform.origin = Vector3(0,10,-2.5)

	var b = basic_bomb.instance()
	enemy_container.add_child(b)
	b.transform.origin = Vector3(2,10,-2.5)

	var c = basic_bomb.instance()
	enemy_container.add_child(c)
	c.transform.origin = Vector3(4,10,-2.5)

	var d = basic_bomb.instance()
	enemy_container.add_child(d)
	d.transform.origin = Vector3(6,10,-2.5)

	var e = basic_bomb.instance()
	enemy_container.add_child(e)
	e.transform.origin = Vector3(8,10,-2.5)

	var f = basic_bomb.instance()
	enemy_container.add_child(f)
	f.transform.origin = Vector3(10,10,-2.5)

	var g = basic_bomb.instance()
	enemy_container.add_child(g)
	g.transform.origin = Vector3(-2,10,-2.5)

	var h = basic_bomb.instance()
	enemy_container.add_child(h)
	h.transform.origin = Vector3(-4,10,-2.5)

	var i = basic_bomb.instance()
	enemy_container.add_child(i)
	i.transform.origin = Vector3(-6,10,-2.5)

	var j = basic_bomb.instance()
	enemy_container.add_child(j)
	j.transform.origin = Vector3(-8,10,-2.5)

	var k = basic_bomb.instance()
	enemy_container.add_child(k)
	k.transform.origin = Vector3(-10,10,-2.5)

	var l = basic_bomb.instance()
	enemy_container.add_child(l)
	l.transform.origin = Vector3(12,10,-2.5)
	
	var m = basic_bomb.instance()
	enemy_container.add_child(m)
	m.transform.origin = Vector3(-12,10,-2.5)
	
	var n = basic_bomb.instance()
	enemy_container.add_child(n)
	n.transform.origin = Vector3(14,10,-2.5)
	
	var o = basic_bomb.instance()
	enemy_container.add_child(o)
	o.transform.origin = Vector3(-14,10,-2.5)
	
	var p = basic_bomb.instance()
	enemy_container.add_child(p)
	p.transform.origin = Vector3(16,10,-2.5)

	var q = basic_bomb.instance()
	enemy_container.add_child(q)
	q.transform.origin = Vector3(-16,10,-2.5)

	var r = basic_bomb.instance()
	enemy_container.add_child(r)
	r.transform.origin = Vector3(18,10,-2.5)

	var s = basic_bomb.instance()
	enemy_container.add_child(s)
	s.transform.origin = Vector3(-18,10,-2.5)

	var t = basic_bomb.instance()
	enemy_container.add_child(t)
	t.transform.origin = Vector3(20,10,-2.5)

	var u = basic_bomb.instance()
	enemy_container.add_child(u)
	u.transform.origin = Vector3(-20,10,-2.5)

	var v = basic_bomb.instance()
	enemy_container.add_child(v)
	v.transform.origin = Vector3(22,10,-2.5)

	var w = basic_bomb.instance()
	enemy_container.add_child(w)
	w.transform.origin = Vector3(-22,10,-2.5)

	var x = basic_bomb.instance()
	enemy_container.add_child(x)
	x.transform.origin = Vector3(24,10,-2.5)

	var y = basic_bomb.instance()
	enemy_container.add_child(y)
	y.transform.origin = Vector3(-24,10,-2.5)

	var z = basic_bomb.instance()
	enemy_container.add_child(z)
	z.transform.origin = Vector3(26,10,-2.5)
	
	var aa = basic_bomb.instance()
	enemy_container.add_child(aa)
	aa.transform.origin = Vector3(-26,10,-2.5)

	var bb = basic_bomb.instance()
	enemy_container.add_child(bb)
	bb.transform.origin = Vector3(28,10,-2.5)

	var c2 = basic_bomb.instance()
	enemy_container.add_child(c2)
	c2.transform.origin = Vector3(-28,10,-2.5)

	var dd = basic_bomb.instance()
	enemy_container.add_child(dd)
	dd.transform.origin = Vector3(30,10,-2.5)

	var ee = basic_bomb.instance()
	enemy_container.add_child(ee)
	ee.transform.origin = Vector3(-30,10,-2.5)

	var ff = basic_bomb.instance()
	enemy_container.add_child(ff)
	ff.transform.origin = Vector3(32,10,-2.5)

	var gg = basic_bomb.instance()
	enemy_container.add_child(gg)
	gg.transform.origin = Vector3(-32,10,-2.5)

	var hh = basic_bomb.instance()
	enemy_container.add_child(hh)
	hh.transform.origin = Vector3(34,10,-2.5)

	var ii = basic_bomb.instance()
	enemy_container.add_child(ii)
	ii.transform.origin = Vector3(-34,10,-2.5)

	var jj = basic_bomb.instance()
	enemy_container.add_child(jj)
	jj.transform.origin = Vector3(36,10,-2.5)

	var kk = basic_bomb.instance()
	enemy_container.add_child(kk)
	kk.transform.origin = Vector3(-36,10,-2.5)

	var ll = basic_bomb.instance()
	enemy_container.add_child(ll)
	ll.transform.origin = Vector3(38,10,-2.5)

	var mm = basic_bomb.instance()
	enemy_container.add_child(mm)
	mm.transform.origin = Vector3(-38,10,-2.5)

	var nn = basic_bomb.instance()
	enemy_container.add_child(nn)
	nn.transform.origin = Vector3(40,10,-2.5)

	var oo = basic_bomb.instance()
	enemy_container.add_child(oo)
	oo.transform.origin = Vector3(-40,10,-2.5)

	var pp = basic_bomb.instance()
	enemy_container.add_child(pp)
	pp.transform.origin = Vector3(42,10,-2.5)

	var qq = basic_bomb.instance()
	enemy_container.add_child(qq)
	qq.transform.origin = Vector3(-42,10,-2.5)

	var rr = basic_bomb.instance()
	enemy_container.add_child(rr)
	rr.transform.origin = Vector3(44,10,-2.5)

	var s2 = basic_bomb.instance()
	enemy_container.add_child(s2)
	s2.transform.origin = Vector3(-44,10,-2.5)

	var tt = basic_bomb.instance()
	enemy_container.add_child(tt)
	tt.transform.origin = Vector3(46,10,-2.5)

	var uu = basic_bomb.instance()
	enemy_container.add_child(uu)
	uu.transform.origin = Vector3(-46,10,-2.5)

	var vv = basic_bomb.instance()
	enemy_container.add_child(vv)
	vv.transform.origin = Vector3(48,10,-2.5)

	var ww = basic_bomb.instance()
	enemy_container.add_child(ww)
	ww.transform.origin = Vector3(-48,10,-2.5)

