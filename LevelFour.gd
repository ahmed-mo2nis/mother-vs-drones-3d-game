extends Spatial

onready var loading_bar = $LoadingScreen
var game_thread = Thread.new()
var load_percent = 0

onready var level_container = $Scenes

var level_four_a = preload("res://Scenes/LevelFourA.tscn")
var level_four_b = preload("res://Scenes/LevelFourB.tscn")
var level_four_c = preload("res://Scenes/LevelFourC.tscn")
var level_four_d = preload("res://Scenes/LevelFourD.tscn")
var level_four_e = preload("res://Scenes/LevelFourE.tscn")
var level_four_f = preload("res://Scenes/LevelFourF.tscn")
var level_four_g = preload("res://Scenes/LevelFourG.tscn")
var level_four_h = preload("res://Scenes/LevelFourH.tscn")
var level_four_i = preload("res://Scenes/LevelFourI.tscn")
var level_four_j = preload("res://Scenes/LevelFourJ.tscn")

func _ready():
	load_game()
	var a = level_four_a.instance()
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
