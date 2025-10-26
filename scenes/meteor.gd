extends Area2D

var base_speed: int = 375
var direction_x: float
var rotation_speed: float
var speed = base_speed

# Given texture file name, return meteor speed (bigger = slower)
func get_meteor_speed(file_name):
	if "_big" in file_name: return base_speed * 0.8
	if "_small" in file_name: return base_speed * 1.1
	if "_tiny" in file_name: return base_speed * 1.25
	return base_speed # default to base_speed

# Return all file names with valid extensions in the specified directory
func get_file_names(root_dir, valid_extensions = ["png"]):
	var file_names = []
	
	for file_name in DirAccess.get_files_at(root_dir):
		if (file_name.get_extension() in valid_extensions):
			file_names.append(file_name)
		
	return file_names

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# Start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# Skin, speed, direction and rotation
	var skin_file_name = get_file_names("res://graphics/meteors").pick_random()
	$MeteorImage.texture = load("res://graphics/meteors/" + skin_file_name)
	speed = get_meteor_speed(skin_file_name)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)
	
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
