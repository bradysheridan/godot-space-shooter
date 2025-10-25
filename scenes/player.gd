extends CharacterBody2D

@export var speed := 500

func _ready():
	# Set initial player position
	position = Vector2(100, 500);

func _process(delta):
	# Update position
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# Update rotation
	$PlayerImage.rotation += 0.1 * delta;
