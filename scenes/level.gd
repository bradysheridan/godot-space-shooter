extends Node2D

# Load meteor scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health: int = 5

func _ready():
	# Set up health UI
	get_tree().call_group('ui', 'set_health', health)

func _on_meteor_timer_timeout() -> void:
	# Create an instance of the scene node
	var meteor = meteor_scene.instantiate()
	
	# Attach node to scene tree
	$Meteors.add_child(meteor)
	
	# Connect collision signal
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health == 0:
		get_tree().change_scene_to_file("res://scenes/game-over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
