extends Node2D

# Load meteor scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	# Create an instance of the scene node
	var meteor = meteor_scene.instantiate()
	
	# Attach node to scene tree
	$Meteors.add_child(meteor)

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
