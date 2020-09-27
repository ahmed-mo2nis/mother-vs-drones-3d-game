# mother-vs-drones-3d-game
3D Video Game Created in Godot Game Engine. Details here :  https://ahmed-mo2nis.itch.io/mother-vs-drones

Note that due to a bug in the Godot engine when exporting the game to Windows OS, I had to add

ProjectSettings.load_resource_pack("res://mvd0.pck")

var imported_scene = load("res://Scenes/CutSceneLevelThreeA.tscn")

So if you find those and plan to export to GNU/Linux just remove these 2 lines and export the whole project
