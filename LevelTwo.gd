extends Spatial

onready var loading_bar = $LoadingScreen
var game_thread = Thread.new()
var load_percent = 0

onready var level_container = $Scenes

var level_two_a = preload("res://Scenes/LevelTwoA.tscn")
var level_two_b = preload("res://Scenes/LevelTwoB.tscn")
var level_two_c = preload("res://Scenes/LevelTwoC.tscn")
var level_two_d = preload("res://Scenes/LevelTwoD.tscn")
var level_two_e = preload("res://Scenes/LevelTwoE.tscn")
var level_two_f = preload("res://Scenes/LevelTwoF.tscn")
var level_two_g = preload("res://Scenes/LevelTwoG.tscn")
var level_two_h = preload("res://Scenes/LevelTwoH.tscn")
var level_two_i = preload("res://Scenes/LevelTwoI.tscn")
var level_two_j = preload("res://Scenes/LevelTwoJ.tscn")

func _ready():
	load_game()
	var a = level_two_a.instance()
	level_container.add_child(a)

func load_game():
	game_thread.start(self, "build_game", null, 1)
	
func setup():
	load_percent += 100
	$LoadingScreen.update_percent(load_percent)
	
func build_game(empty):
	load_percent += 100
	$LoadingScreen.update_percent(load_percent)
	game_thread.wait_to_finish()
