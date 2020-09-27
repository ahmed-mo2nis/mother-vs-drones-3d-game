extends Spatial

onready var loading_bar = $LoadingScreen
var game_thread = Thread.new()
var load_percent = 0

onready var level_container = $Scenes

var level_one_a = preload("res://Scenes/LevelOneA.tscn")
var level_one_b = preload("res://Scenes/LevelOneB.tscn")
var level_one_c = preload("res://Scenes/LevelOneC.tscn")
var level_one_d = preload("res://Scenes/LevelOneD.tscn")
var level_one_e = preload("res://Scenes/LevelOneE.tscn")
var level_one_f = preload("res://Scenes/LevelOneF.tscn")
var level_one_g = preload("res://Scenes/LevelOneG.tscn")
var level_one_h = preload("res://Scenes/LevelOneH.tscn")
var level_one_i = preload("res://Scenes/LevelOneI.tscn")
var level_one_j = preload("res://Scenes/LevelOneJ.tscn")

func _ready():
	load_game()
	var a = level_one_a.instance()
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
