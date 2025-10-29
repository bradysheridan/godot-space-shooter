extends CharacterBody2D

@export var speed := 500
var can_shoot: bool = true

signal laser(pos)

func _process(_delta):
	# position
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# shoot laser
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false

func _on_laser_debouncer_timeout() -> void:
	can_shoot = true
