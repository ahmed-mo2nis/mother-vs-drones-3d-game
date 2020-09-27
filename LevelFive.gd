extends Spatial

onready var loading_bar = $LoadingScreen
var game_thread = Thread.new()
var load_percent = 0

onready var level_container = $Scenes

var level_five_a = preload("res://Scenes/LevelFiveA.tscn")
var level_five_b = preload("res://Scenes/LevelFiveB.tscn")
var level_five_c = preload("res://Scenes/LevelFiveC.tscn")
var level_five_d = preload("res://Scenes/LevelFiveD.tscn")
var level_five_e = preload("res://Scenes/LevelFiveE.tscn")
var level_five_f = preload("res://Scenes/LevelFiveF.tscn")
var level_five_g = preload("res://Scenes/LevelFiveG.tscn")
var level_five_h = preload("res://Scenes/LevelFiveH.tscn")
var level_five_i = preload("res://Scenes/LevelFiveI.tscn")
var level_five_j = preload("res://Scenes/LevelFiveJ.tscn")
var level_five_station = preload("res://Scenes/LevelFiveStation.tscn")

func _ready():
	load_game()
	var a = level_five_a.instance()
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
