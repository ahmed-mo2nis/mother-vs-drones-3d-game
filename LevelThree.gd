extends Spatial

onready var loading_bar = $LoadingScreen
var game_thread = Thread.new()
var load_percent = 0

onready var level_container = $Scenes

var level_three_a = preload("res://Scenes/LevelThreeA.tscn")
var level_three_b = preload("res://Scenes/LevelThreeB.tscn")
var level_three_c = preload("res://Scenes/LevelThreeC.tscn")
var level_three_d = preload("res://Scenes/LevelThreeD.tscn")
var level_three_e = preload("res://Scenes/LevelThreeE.tscn")
var level_three_f = preload("res://Scenes/LevelThreeF.tscn")
var level_three_g = preload("res://Scenes/LevelThreeG.tscn")
var level_three_h = preload("res://Scenes/LevelThreeH.tscn")
var level_three_i = preload("res://Scenes/LevelThreeI.tscn")
var level_three_j = preload("res://Scenes/LevelThreeJ.tscn")

func _ready():
	load_game()
	var a = level_three_a.instance()
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
