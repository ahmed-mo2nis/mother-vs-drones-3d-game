extends Spatial

export var SavedScene: String = ""
var file = File.new()

var enemy_chemical_drone = preload("res://Scenes/EnemyLevelOneABTest.tscn")
var sarin_bomb = preload("res://Scenes/SarinBomb.tscn")
onready var enemy_container = $Enemy

onready var health = Health
onready var health_bar = $MenuOptions/HealthBar

func _ready():
	$MenuOptions/PausePlayConfirm.hide()
	$MenuOptions/QuitPlayConfirm.hide()
	$MenuOptions/RestartPlayConfirm.hide()
	$MenuOptions/SavePlayConfirm.hide()
	$MenuOptions/HealthIncreasedByThree.hide()
	health.connect("health_changed", health_bar, "set_value")
	health.connect("max_changed", health_bar, "set_max")
	health.initialize()
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Audio/Sounds/Game/tick-g.ogg")
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
			$MenuOptions/HealthIncreasedByThree.hide()

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().change_scene("res://Scenes/LevelFourG.tscn")
		
func _on_Area2_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(-1,10,-27)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area3_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(-12,10,-20)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area4_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(9,10,-21)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area5_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(9,10,-8)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area6_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(0,10,6)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area7_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(0,10,26)
		a.rotate_y(30)
		enemy_container.add_child(a)
		
func _on_Area8_body_entered(body):
	if body is KinematicBody:
		var a = sarin_bomb.instance()
		a.transform.origin = Vector3(-20,10,46)
		a.rotate_y(30)
		enemy_container.add_child(a)

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
		$Walls/WallFour20.hide()

func _on_GasMask_body_entered(body):
	if body.name == "Mother_test":
		health.current_health += 3
		$MenuOptions/HealthIncreasedByThree.show()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://Audio/Sounds/Player/woman-sighs.wav")
		player.play()
